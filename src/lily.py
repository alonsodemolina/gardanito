#!/usr/bin/python

import re


def quitar_comments(string):
    # eliminamos bloques %{ ... %}
    s=re.sub(r'%{.*?%}', r'', string, flags=re.DOTALL)
    # eliminamos comentarios de una linea % ...
    t=re.sub(r'%.*?\n', r'\n', s)
    return t

def extraer(texto, string):
    t=""
    # \W matches any non-alphanumeric
    p=re.compile('\W' + string + '\s*=\s*')
    m=p.search(texto)
    i=m.end()
    llaves=0
    principio=1
    while llaves!=0 or principio == 1:
        c=texto[i]
        t=t + c
        if c == '{':
            principio=0
            llaves=llaves+1
        if c == '}':
            llaves=llaves-1
        i=i+1
    return t


lilyfile=open("../resources/O_Quam_Gloriosum_Est_Regnum.ly")
texto=quitar_comments(lilyfile.read())
cantus=extraer(texto, "cantus")
print cantus
