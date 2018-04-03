#!/usr/bin/python3

'''
Created on March 20, 2018

@author: Nancho Alvarez

TODO:

    - manage the segments that have no incipit
    - time signature changes
    - more testing
    - translate to English
    - last note always a longa?

    - read a book on python and re-write this whole mess

'''

import re

notes={'c': 0, 'd': 1, 'e': 2, 'f':3, 'g':4, 'a':5, 'b':6}

lily_accidentals={'ses':-2, 'eses':-2, 's':-1, 'es':-1, 'is':1, 'isis':2}

distance=[0, 2, 4, 5, 7, 9, 11] # semitones between each note and do

durations={ '64': 0.25,
            '32': 0.5,
            '16': 1,
            '8': 2,
            '4': 4,
            '2': 8,
            '1': 16,
            '\\breve': 32,
            '\\longa': 64,
            '\\maxima': 128
}

figure = {'1':'semifusa', 
          '2':'fusa', 
          '4':'semiminima', 
          '6':'dotted semiminima', 
          '8':'minima', 
          '12':'dotted minima', 
          '16':'semibrevis', 
          '24':'dotted semibrevis',
          '32':'brevis', 
          '48':'dotted brevis',
          '64':'longa', 
          '96':'dotted longa',
          '128': 'maxima'
}

class LilySource:

    def __init__(self, file_contents):
        self.text=file_contents

    def remove_comments(self):
        # eliminamos bloques %{ ... %}
        s=re.sub(r'%{.*?%}', r'', self.text, flags=re.DOTALL)
        # eliminamos comentarios de una linea % ...
        self.text=re.sub(r'%.*?\n', r'\n', s)

    def find_segments(self):
        segments=[]
        for match in re.finditer('\\\\score\s*{', self.text):
            bloque, size=leerbloque(self.text, match.end(0)-1)
            if re.search('ChoirStaff\s*<<', bloque):
                segments.append(bloque)
        return segments

    def extract(self, string):
        # Busca en el texto lilypond una definicion de la forma string={....}
        # Devuelve el bloque {...}, y elimina del texto la definicion
        bloque=""
        # \W matches any non-alphanumeric
        p=re.compile('\W' + string + '\s*=\s*')
        m=p.search(self.text)
        if not m:
            return ''
        string_start=m.start()
        string_end=m.end()
        i=string_end
        llaves=0
        initial_status=1
        while llaves!=0 or initial_status == 1:
            c=self.text[i]
            bloque=bloque + c
            if c == '{':
                initial_status=0
                llaves=llaves+1
            if c == '}':
                llaves=llaves-1
            i=i+1
        resto=self.text[:string_start+1] + self.text[i:]
        self.text=resto
        return bloque


def parse(bloque):
    l=[]
    note_regexp=re.compile(
            "(c|d|e|f|g|a|b)"
            "((s|es|is)*)\s*"
            "((,|')*)\s*"
            "((!|\?)?)\s*"
            "(\d+|\\\\breve|\\\\longa|\\\\maxima)?\s*"
            "((\.)*)"
    )
    rest_regexp=re.compile(
            "(r|R)\s*"
            "(\d+|\\\\breve|\\\\longa|\\\\maxima)?\s*"
            "((\.)*)\s*"
            "("
            "\*\s*"
            "((\d+)/(\d+)(\s*\*\s*(\d+))?|(\d+))"
            ")?"
    )
    i=1
    old_duration=8
    while True:
        c=bloque[i]
        m=note_regexp.match(bloque[i:])
        r=rest_regexp.match(bloque[i:])
        if c=='}':
            break
        elif c.isspace():
            i=i+1
            continue

        # Notes
        elif m:
            # a note is the list
            # [diatonic, chromatic, octave, cautionary, duration]
            # diatonic value from 0 to 6 
            diat=notes[m.group(1)] 
            # chromatic: doubleflat is -2, flat is -1, etc.
            sufix=m.group(2)
            if sufix:      
                chrom=lily_accidentals[sufix]
            else:
                chrom=0
            octave=count_commas(m.group(4))
            # cautionay: '?', '!' or ''
            caut=m.group(6)
            # duration in fusas
            d=m.group(8)
            if d:
                dur=durations[d]
                puntillos=len(m.group(9))
                dur=dur*(2-1/2**puntillos)
                old_duration=dur
            else:
                dur=old_duration
            token=[diat,chrom,octave,caut,dur]
            length=len(m.group(0))
        
        # Rests
        elif r:
            # A rest is a list ['r', duration]
            # duration is the number of fuses
            if r.group(11):
                repeats=int(r.group(11))
            elif r.group(10):
                repeats=int(r.group(10))
            else:
                repeats=1
            if r.group(7):
                numerator=int(r.group(7))
                denominator=int(r.group(8))
            else:
                numerator=1
                denominator=1
            d=r.group(2)
            if d:
                dur=durations[d]
                puntillos=len(r.group(3))
                dur=dur*(2-1/2**puntillos)
                old_duration=dur
            else:
                dur=old_duration
            dur=dur*numerator/denominator
            token=['r', dur]
            for _ in range(repeats):
                l.append(token)
            i=i+len(r.group(0))
            continue

        elif c.isalpha():
            token, length = leerpalabra(bloque, i)
        elif c=='*':
            token, length = leerproporcion(bloque, i)
        elif c=='#':
            token, length = leerscheme(bloque, i)
        elif c=='\\':
            token, length = leercomando(bloque, i)
        elif c=='{':
            token, length = leerbloque(bloque, i)
        else:
            token=c
            length=1
        l.append(token)
        i=i+length
    return l

def leerpalabra(string, pos):
    palabra=""
    j=pos
    letra=string[j]
    while letra.isalpha() or letra=='.':
        palabra=palabra + letra
        j=j+1
        letra=string[j]
    return palabra, j-pos


def leerproporcion(string, pos):
    proporcion=""
    j=pos
    c=string[j]
    while c.isdigit() or c.isspace() or c=='/' or c=='*':
        if not c.isspace():
            proporcion=proporcion + c
        j=j+1
        c=string[j]
    return proporcion, j-pos


def leerscheme(string, pos):
    scheme=""
    j=pos
    c=string[j]
    while c=='#' or c.isalpha() or c.isdigit():
        scheme=scheme + c
        j=j+1
        c=string[j]
    return scheme, j-pos

def leercomando(string, pos):
    j=pos+1
    c=string[j]
    if c.isalpha():
        comando, long=leerpalabra(string,j)
    else:
        comando=c
        long=1
    return '\\' + comando, long + 1

def leerbloque(string, pos):
    bloque="{"
    j=pos+1
    llaves=1
    while llaves>0:
        c=string[j]
        bloque=bloque+c
        if c == '{':
            llaves=llaves+1
        if c == '}':
            llaves=llaves-1
        j=j+1
    return bloque, j-pos

def count_commas(commas):
    if commas == "":
        return 0
    elif commas[0]=='\'':
        return len(commas)
    else:
        return -len(commas)

def commas_string(octave):
    if octave == 0:
        return ""
    if octave > 0:
        return "'" * octave
    else:
        return "," * (-octave)
    


def relative_to_absolute(tokens, initial_note, octave):
    old_note=initial_note
    i=0
    print (octave)
    while i<len(tokens):
        item=tokens[i]
        if is_a_note(item):
            [note, _, comas, _, _]=item
            difference = note - old_note
            if abs(difference)>3:
                comas = comas - 1 if difference>0 else comas + 1
            octave=comas+octave
            item[2]=octave
            old_note=note
            tokens[i]=item
        i=i+1
    return

def find_transposition(note1, note2):
    # the second component will be the number of semitones
    note1[1] = note1[1] + distance[note1[0]]
    note2[1] = note2[1] + distance[note2[0]]
    # transposition = [ diat distance, number of semitones, octave difference]
    transposition=[0,0,0]
    for j in [0,1,2]:
        transposition[j] = note2[j] - note1[j]
    return transposition


def transpose(tokens, transposition):
    i=0
    while i<len(tokens):
        item=tokens[i]
        if is_a_note(item):
            # add distance to get the number of semitones
            item[1]=item[1] + distance[item[0]]
            # add each note with the transposition
            transposed=[0,0,0]
            for j in [0,1,2]:
                transposed[j]=item[j]+transposition[j]
            # normalize the transposed note 
            item[0]=transposed[0] % 7
            item[1]=transposed[1] % 12
            item[2]=transposed[2] + transposed[0] // 7
            # substract the new distance
            item[1]=item[1] - distance[item[0]]
        i=i+1
    return

def remove_musica_ficta(tokens, key):
    key_signature=[0]*7 # c major
    if key < 0:
        step=-1 # flat
        note=6 # start in b
        interval=3 # we move in forths
    elif key > 0:
        step=1 # sharp
        note = 3 # start in f
        interval=4 # we move in fifths
    else:
        step=note=interval=0 # never used
    i=abs(key)
    while i>0:
        key_signature[note] += step
        note=(note+interval) % 7
        i=i-1
    ficta=0
    for item in tokens:
        if item == '\\ss':
            ficta=1
        if is_a_note(item) and ficta:
            item[1]=key_signature[item[0]]
            ficta=0
    return


def analize_incipit(incipit):
    m=re.search('instrumentName\s*=\s*"([^"]*)"', incipit)
    if m:
        label=m.group(1).strip()
    else:
        label="Staff"
    # this table only 
    key_table={
            "c":0, "f":-1, "bes":-2, "ees":-3, "aes":-4, "des":-5, "ges":-6,
            "ces":-7, "g":1, "d":2, "a":3, "e":4, "b":5, "fis":6, "cis":7
    }
    m=re.search('\\\\key\s*([a-z]*)', incipit)
    if m:
        key_name=m.group(1)
    else:
        key_name="c"
    key=key_table[key_name]
    m=re.search('petrucci-([^"]*)"', incipit)
    if m:
        clef=m.group(1)
    else:
        clef="g2"
    if clef=="g":
        clef="g2"
    m=re.search('\\\\(time\s*[0-9]*/[0-9]*)', incipit)
    if m:
        compas=m.group(1)
    else:
        compas="time 4/4"
    # first note
    m=re.search("(?:\s|\[)(c|d|e|f|g|a|b)"
                "((s|es|is)*)"
                "((,|')*)"
                "(\d+|\\\\breve|\\\\longa|\\\\maxima)"
                "(\.*)",incipit)
    diat=notes[m.group(1)]
    chrom=lily_accidentals[m.group(2)] if m.group(2) else 0
    octave=count_commas(m.group(4))
    dur=durations[m.group(6)]
    puntillos=len(m.group(7))
    dur=dur*(2-1/2**puntillos)
    note=[diat, chrom, octave, dur]
    return (label, clef, key, compas, note)

def process_lyrics(silabas, melismas):
    filtro=[]
    italicas=0
    i=0 # silabas
    j=0 # filtro
    while i<len(silabas):
        item=silabas[i]
        if item == "__":
            pass
        elif item == "--":
            filtro[j-1]=filtro[j-1] + "-"
        elif item == '\\italicas':
            italicas=1
        elif item == '\\rectas':
            a=j-1
            while filtro[a] == "_":
                a=a-1
            filtro[a]=filtro[a] + "]"
        elif item == '\\mt': # \mt #number is a macro to displace lyrics horizontally
            i=i+1
        else:
            if italicas and item != '_':
                item="[" + item
                italicas=0
            filtro.append(item)
            j=j+1
        i=i+1
    # quitamos los melismas
    sinmelismas=[]
    i=0
    while i<len(filtro):
        item=filtro[i]
        if not melismas[i]:
            sinmelismas.append(item)
        i=i+1
    return ' '.join(sinmelismas)


def hallar_melismas(tokens):
    # melismas is a list with as many elements as notes.
    # All its values are 0 except for the positions
    # corresponding to notes with melismas

    # los melismas pueden estar activados por algunos elementos
    # dependiendo de la variable de lilypond melismaBusyProperties
    # la variable autoBeaming tambien influye
    # TODO: leer y analizar esas variables
    
    ligaturebusy=1
    tiebusy=1
    beambusy=0
    # se pueden anadir mas casos: slur, phrasingslur, \melisma \melismaEnd
    melismas=[]
    i=0
    melismatie=0
    melismaligature=0
    melisma=0
    while i<len(tokens):
        item=tokens[i]
        if item=='~' and tiebusy:
            melismatie=1
        if item=='\\[' and ligaturebusy:
            melismaligature=1
        if item=='\\]' and ligaturebusy:
            melisma=melisma-1
        if item=='[' and beambusy:
            melisma=melisma+1
        if item==']' and beambusy:
            melisma=melisma-1
        if is_a_note(item):
            if melismatie==1:
                melismas.append(1)
                melismatie=0
            else:
                melismas.append(melisma)
            if melismaligature:
                melismaligature=0
                melisma=melisma+1
        i=i+1
    return melismas

def is_a_note(item):
    if isinstance(item, list) and len(item)==5:
        return True
    else:
        return False

def is_a_rest(item):
    if isinstance(item, list) and len(item)==2:
        return True
    else:
        return False




def join_ties(tokens):
    normalized=[]
    i=0
    tie=0
    while i<len(tokens):
        item=tokens[i]
        if is_a_note(item):
            [note, _, _, _, duration]=item
            if not tie:
                normalized.append(item)
            else:
                j=-1
                while not is_a_note(normalized[j]):
                    j=j-1
                normalized[j][4]=normalized[j][4] + duration
            tie=0
        elif item=='~':
            tie=1
        else:
            normalized.append(item)
        i=i+1
    return normalized


def intermediate_format(tokens, value_factor):
    intermediate=[]
    i=0
    while i<len(tokens):
        item=tokens[i]
        if item=='\\[':
            j=i+1
            notes_in_ligature=0
            while tokens[j] != '\\]':
                if is_a_note(tokens[j]):
                    notes_in_ligature=notes_in_ligature+1
                j=j+1
            intermediate.append("ligature " + str(notes_in_ligature))
        elif is_a_note(item):
            [diat, chrom, oct, caut, duration]=item
            duration=int(duration*value_factor)
            if duration>128: # no values greater than a maxima
                duration=128
            element=figure[str(duration)] + " " + synthesize(diat, chrom, oct)
            if caut == '!':
                element = element + ' explicit'
            intermediate.append(element)
        elif is_a_rest(item):
            duration=int(item[1]*value_factor)
            intermediate.append(figure[str(duration)] + " " + 'rest')
        i=i+1
    return intermediate

def synthesize(diat, chrom, oct):
    note=['C', 'D', 'E', 'F', 'G', 'A', 'B'][diat]
    acc=['bb','b','','#', '##'][chrom+2]
    octave=str(oct+2) # should be +3 instead of +2 if central do is C4
    return note+acc+octave

def pretty_print(music,lyrics):
    print ('\t' + music[0])
    print ('\t' + music[1])
    print ('\t' + music[2])
    lyrics_list=lyrics.split()
    j=0
    for item in music[3:]:
        if "ligature" in item:
            n=int(item.split()[1])
            lyrics_list[j+1:j+1]='_' * (n-1)
        if re.search('[CDEFGAB].?\d', item):
            print(lyrics_list[j] + "\t" + item)
            j=j+1
        else:
            print("\t" + item)
    print()


#################   main   #################

#lilyfile=open("../resources/O_Quam_Gloriosum_Est_Regnum.ly")
#lilyfile=open("../resources/Pueri_Hebraeorum.ly")
#lilyfile=open("../resources/Ardens_Est_Cor_Meum.ly")
lilyfile=open("../resources/Asperges_Me.ly")

lilysource=LilySource(lilyfile.read())
lilysource.remove_comments()
segments=lilysource.find_segments()

voices_dictionary={}
first_voice=1 # flag: some calculations are done only with the first voice

# Find the voices of each segment
for segment in segments:
    lily_global = lilysource.extract("global")
    for name in re.finditer('Voice[^}]*\\\\(\w+)\s*}', segment):
        voz=name.group(1)

        # incipit
        incipit=lilysource.extract("incipit" + voz)
        if incipit:
            (label, clef, key, compas, incipit_note)=analize_incipit(incipit)
            voices_dictionary[voz]=[label, clef, key, compas]
            incipit_pitch=incipit_note[:3]
            incipit_duration=incipit_note[3]
        else:
            print (voices_dictionary)
            raise Exception ("There is no incipit")

        # musica
        musica=lilysource.extract(voz)
        s=musica.find('{')
        tokens=parse(musica[s:])
        # si es un bloque \relative lo convertimos en absoluto
        m=re.search('\\\\relative\s*([a-z]*)((,|\')*)\s*',musica[:s])
        if m:
            initial_note=notes[m.group(1)[0]]
            octave=count_commas(m.group(2))
            relative_to_absolute(tokens, initial_note, octave)
        if first_voice:
            # find the first note
            i=0
            while not is_a_note(tokens[i]):
                i=i+1
            first_pitch=tokens[i][:3]
            first_duration=tokens[i][4]
            # calculate the transposition comparing
            # the first note with the note in the incipit
            transposition=find_transposition(first_pitch, incipit_pitch)
            # calculate the value_factor comparing with the incipit
            value_factor=incipit_duration/first_duration
            first_voice=0
        transpose(tokens, transposition)
        remove_musica_ficta(tokens, key)
        melismas=hallar_melismas(tokens)
        tokens=join_ties(tokens)
        intermediate=intermediate_format(tokens, value_factor)
        music=[label, clef, str(key), compas] + intermediate

        # texto
        lyrics=lilysource.extract("texto" + voz)
        s=lyrics.find('{')
        silabas=lyrics[s+1:-1].split()
        lyrics=process_lyrics(silabas, melismas)
        #print (music)
        #print (lyrics)
        pretty_print(music,lyrics)

