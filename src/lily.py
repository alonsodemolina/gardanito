#!/usr/bin/python

import re


def quitar_comments(string):
    # eliminamos bloques %{ ... %}
    s=re.sub(r'%{.*?%}', r'', string, flags=re.DOTALL)
    # eliminamos comentarios de una linea % ...
    t=re.sub(r'%.*?\n', r'\n', s)
    return t

def extraer(texto, string):
    # Busca en texto una definicion de la forma string={....}
    # Devuelve el bloque {...}, y el texto con la definicion eliminida
    bloque=""
    # \W matches any non-alphanumeric
    p=re.compile('\W' + string + '\s*=\s*')
    m=p.search(texto)
    string_start=m.start()
    string_end=m.end()
    i=string_end
    llaves=0
    initial_status=1
    while llaves!=0 or initial_status == 1:
        c=texto[i]
        bloque=bloque + c
        if c == '{':
            initial_status=0
            llaves=llaves+1
        if c == '}':
            llaves=llaves-1
        i=i+1
    resto=texto[:string_start+1] + texto[i:]
    return (bloque, resto)

def tokenizar(bloque):
    l=[]
    i=13
    hay_caracteres=1
    while hay_caracteres:
        i=i+1
        c=bloque[i]
        if c=='}':
            hay_caracteres=0
        if c==' ' or c=='\t' or c=='\n':
            continue
        if c=='\\':
            i=i+1
            if bloque[i].isalpha():
                palabra=""
                letra=bloque[i]
                while letra.isalpha():
                    palabra=palabra + letra
                    i=i+1
                    letra=bloque[i]
                l.append('\\' + palabra)
                i=i-1
            else:
                l.append('\\' + bloque[i])
            continue 
        l.append(c)
    return l


lilyfile=open("../resources/O_Quam_Gloriosum_Est_Regnum.ly")
texto=quitar_comments(lilyfile.read())
(cantus, texto)=extraer(texto, "cantus")

tokens=tokenizar(cantus)
print tokens
