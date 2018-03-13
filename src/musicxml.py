'''
Created on Apr 22, 2017

@author: isaac

TODO:

    - dictionary to font symbols
    - spacing strategies
    - detect if downbeat (useful to group rests) 
    - clefs: best fit / same as source / specify
    -

    - extract specific part only
    - specify value factor 
    - transposition 

    - ligatures... maybe impossible?
    - text

'''




import xml.etree.cElementTree as ET


filename = '../resources/Pueri_Hebraeorum.mscx'
part_names = []
pitch_names = ['C', 'C#', 'D', 'Eb', 'E', 'F', 'F#', 'G', 'G#', 'A', 'Bb', 'B']
xml_durations = {'breve': 32, 'whole': 16, 'half': 8, 'quarter': 4, 'eighth': 2, '16th': 1}
figure = {1:'semifusa', 
          2:'fusa', 
          4:'semiminima', 
          6: 'dotted semiminima', 
          8:'minima', 
          12: 'dotted minima', 
          16:'semibrevis', 
          24: 'dotted semibrevis',
          32:'brevis', 
          64:'longa', 
          72:'longa2',
          128: 'maxima',
          144: 'maxima2'}
value_factor = 2

my_duration = 0
previous_duration = 0
current_tie = 0
is_dotted = 0

output = []

if __name__ == '__main__':
    print "Gardanito"
    tree = ET.ElementTree(file=filename)
    root = tree.getroot()
    
    for e1 in root:
        print e1
        for e2 in e1:
            #print " ", e2

            if e2.tag == "Part":
                for e3 in e2:
                    #print "  ", e3

                    if e3.tag == "Staff":
                        staff_id = e3.attrib["id"]

                    if e3.tag == "Instrument":
                        for e4 in e3:
                            #print "   ", e4
                            if e4.tag == "longName":
                                part_names.append(e4.text)
                        
            if e2.tag == "Staff":
                print "Staff", e2.attrib["id"]
                
                for e3 in e2:
                    if e3.tag == "Measure":
                        #print "  ", e3, e3.attrib
                        for e4 in e3:

                            if e4.tag == "Rest":
                                for e5 in e4:
                                    if e5.tag == "durationType":
                                        if (e5.text == "measure"):
                                            my_duration = xml_durations['whole']
                                        else:
                                            my_duration = xml_durations[e5.text]  
                                        
                                        new_rest = figure[my_duration*value_factor] + " rest"
                                        output.append(new_rest)
                            
                            if e4.tag == "Chord":
                                is_dotted = False
                                for e5 in e4:
                                    
                                    if e5.tag == "dots":
                                        is_dotted = True
                                                                    
                                    if e5.tag == "durationType":
                                        my_duration = xml_durations[e5.text]

                                        if is_dotted:
                                            my_duration = my_duration * 1.5
                                     
                                        if current_tie:
                                            my_duration = my_duration + previous_duration
                                                                                            
                                    if e5.tag == "Note":
                                        for e6 in e5:               
                                                                 
                                            if e6.tag == "pitch":
                                                my_pitch = e6.text
                                                my_pitch = int(my_pitch) - 24
                                                my_octave = my_pitch // 12
                                                my_scaleindex = my_pitch%12
                                                my_pitchname = pitch_names[my_pitch%12]
                                            
                                            # tie is starting
                                            if e6.tag == "Tie":
                                                current_tie = e6.attrib["id"]
                                            
                                            # tie is ending
                                            if e6.tag == "endSpanner":
                                                if e6.attrib["id"] == current_tie:
                                                    current_tie = 0
                                        
                                        if current_tie:
                                            previous_duration = my_duration
                                        else:
                                            new_note = figure[my_duration*value_factor] + " " + my_pitchname + str(my_octave)
                                            output.append(new_note)
                print output
                del output[:]
                                
    
    pass