\version "2.18.0"

#(set-default-paper-size "a4")
#(set-global-staff-size 16.4)
#(ly:set-option 'point-and-click #f)
%mobile -s14 -i3

italicas=\override LyricText.font-shape = #'italic
rectas=\override LyricText.font-shape = #'upright
ss=\once \set suggestAccidentals = ##t
incipitwidth = 20
mtempo={\tempo 4 = 100}
mtempob={\tempo 4 = 50}
mt=#(define-music-function (parser location offset) (number?) % move lyric text
      #{ \once \override LyricText.X-offset = -$offset #})


htitle="Ardens est cor meum"
hcomposer="Victoria"

\header {
	title=\markup{\fontsize #3 "Ardens est cor meum"}
	subtitle="Tempore resurrectionis Domini"
	subsubtitle=\markup{\null \vspace #3 }
	composer="Tomás Luis de Victoria (c.1548-1611)"
	%opus="(-)"
	%poet=\markup{"1576,  1583b,  1585b,  1589a,  1589b,  1603"}
	poet=\markup{"1576,  1583b...,  1585b"}
	copyright=\markup{
		\fill-line {"Transcribed and edited by Nancho Alvarez" \typewriter "http://tomasluisdevictoria.org"}
                % 1576, 1585, 1603
	}
%	tagline=""
}



global={\key c \major \time 2/2  \skip 1*75 \bar "|."
}

cantus={
	r2 d'4. e'8 |
	f'4 g' a'4. g'8 |
	a' b' c''2 b'8 a' |
	g'4 a' b' c'' |
%5
	b'2 c'' |
	R1*4/4 |
	R1*4/4 |
	r2 e'4. f'8 |
	g'4 a' b'2 |
%10
	c''4 a'2 bes'4 ~ |
	bes'8 a' a'2 g'4 |
	a'2 r4 d' |
	d''2. d''4 |
	cis'' a' a' \ss c'' |
%15
	c'' bes' a'2 |
	a'1 |
	a'2 r |
	R1*4/4 |
	R1*4/4 |
%20
	a'1 ~ |
	a' |
	g'2 r4 d' ~ |
	d'8[ e' f' g' a' b'] c''4 |
	b' c'' b' a' |
%25
	gis' a'2 gis'4 | % en 1576 y en 1603 el primero no es sostenido, en 1585 las 2 notas tienen sostenido
	a'2 r4 d' |
	e' f' g' e' | %rubio e' f' e' e' 
	f' a' c'' bes' |
	a'2. a'4 |
%30
	a'2 d'' ~ |
	d''4 d'' d''4. c''8 |
	bes'4 a' g'2 ~ |
	g'4 f'8 e' f'4 d' |
	r d''2 c''4 |
%35
	bes' a' g' f' |
	g'2 a' |
	R1*4/4 |
	r2 r4 d'' ~ |
	d'' c'' bes' a' |
%40
	g' f' g' a' |
	g'1 |
	\set Staff.autoBeaming = ##f
	fis'4 fis' g' g'8 g' | % en 1576 no hay sostenido
	f' e'4 d'8 e'2 |
	r r4 a' |
%45
	a'2 r4 b' |
	c'' c''8 c'' bes' a'4 g'8 |
	a'4 c''4. c''8 a'4 |
	a'2 f'4 a' ~ |
	a'8 g' f'4  e'8[ d'] e'4 |
%50
	\set Staff.autoBeaming = ##t
	f'1 |
	r2 a' |
	a'4 a' a'2 |
	a' r4 d' |
	e' f' g' e' |
%55
	f'4. g'8 a'2 |
	d'4 a' a' gis' |
	a' f' e'2 |
	d'4 d'' d'' cis'' |
	d''4. c''8 bes'4 bes' |
%60
	a'1 |
	a' |
	r4 a'2 f'4 |
	g' a' a'2 |
	r r4 g' ~ |
%65
	g' e' f' g' |
	g'2 r4 f' |
	d' e' f'2 ~ |
	f' r |
	r r4 a' |
%70
	f' g' a'2 |
	r4 c'' a' bes' |
	a'1 |
	r4 a' d' d'' ~ |
	d''8 c'' bes' a' bes'2 |
%75
	a'\breve*1/2
}

cantusdos={
	R1*4/4 |
	R1*4/4 |
	a4. b8 c'4 d' |
	e' f' g' a' ~ |
%5
	a' gis' a'2 ~ |
	a' r |
	r e'4. f'8 |
	g'4 a' b' c'' |
	b' a'2 gis'4 |
%10
	a' e' f'2 ~ |
	f' d' |
	e' r |
	R1*4/4 | % falta en 1576, corregido a mano
	r4 e' f' g' |
%15
	a' g' e'2 |
	\[f' e'\] |
	d'4 f' e' g' |
	g' f' e'2 |
	e'1 |
%20
	e' |
	R1*4/4 |
	R1*4/4 |
	a'1 |
	g'4. g'8 g'4 f' |
%25
	e'2. e'4 |
	c' e'2 d'4 |
	c' d'2 cis'4 |
	d'2 r |
	R1*4/4 |
%30
	f'2. f'4 |
	f' f' g' a' |
	\[d'2 bes'\] |
	a' r4 f' ~ |
	f' f' f' f' |
%35
	g' c' d'2 ~ |
	d' d' |
	R1*4/4 |
	R1*4/4 |
	r2 f'4. f'8 |
%40
	g'4 a' d' f' |
	e'8 d' d'2 cis'4 |
	d'2 r |
	R1*4/4 |
	r2 r4 e' |
%45
	fis'2 r4 g' | % en 1576 no hay sostenido
	\set Staff.autoBeaming = ##f
	g' a'8 a' g' e' d'4 |
	e' a'4. g'8 f'4 |
	 e'8[ f'] e'4 d' f' ~ |
	f'8 e' d'4 cis'8 d'4 cis'8 |
%50
	\set Staff.autoBeaming = ##t
	d'2 r |
	r4 a'4. g'8 f'4 |
	e' a e'2 |
	fis' r |
	R1*4/4 |
%55
	r4 d' e' f' |
	g' e' f' e'8 d' |
	c'4 d'2 cis'4 |
	d'8 e' f' g' a'4 a' |
	f' f' g'4. f'8 | % en 1576 fis' fis'
%60
	e'4 d' e'2 |
	f'1 |
	r2 f' |
	d'4 e' f' a' |
	g' e' d'2 |
%65
	r4 e' c' d' |
	e'2 a' |
	f'4 g' a'2 |
	r r4 f' ~ |
	f' d' e' f' ~ |
%70
	f' e' c' d'8 e' |
	f'4 e' r2 |
	r4 e' a a' ~ |
	a'8 g' f' e' \[f'2 |
	g'\] d'4 g' ~ |
%75
	g' fis'8 e' \mtempob fis'\breve*1/4
}

altus={
	r4 a2 b4 |
	c' d' e' f' |
	e'4. d'8[ e' f'] g'4 ~ |
	g' c' e'2 ~ |
%5
	e' e' |
	a4. b8 c'4 d' |
	e'1 ~ |
	e' ~ |
	e'1
        e'2 r2 |
%10
	R1*4/4 |
	r4 a2 bes4 ~ |
	bes8 a a2 g4 |
	a c' d' e' |
%15
	f' d' cis' e' ~ | % en 1576 y 1603 no hay sostenido, en 1585 sí
	e'8 d' d'2 cis'4 |
	d'2 r |
	R1*4/4 |
	R1*4/4 |
%20
	r4 a4. b8 c' d' |
	e'2 c'4 e' ~ |
	e' d'8 c' b c' d' e' |
	f'2 c' |
	e' d'4. c'8 |
%25
	b4 a b b |
	a2 r |
	R1*4/4 |
	r4 f' e' d' |
	cis' d'2 cis'4 |
%30
	d' d'2 d'4 |
	d' d' d'2 ~ |
	d'4 d' d'2 |
	d'1 |
	R1*4/4 |
%35
	R1*4/4 |
	r2 r4 d' ~ |
	d' c' bes a |
	g f g2 |
	a r4 d' ~ |
%40
	d' c' bes a |
	bes4. a8 g2 |
	\set Staff.autoBeaming = ##f
	a4 d' d' e'8 e' |
	d' b a4 b e' ~ |
	e'8 d' c'4 b c' |
%45
	r d' d'4. d'8 |
	e'4 f'8 f' d' cis' d'4 |
	c' f'4. e'8 d'4 |
	cis'8 d'4 cis'8 d'2 |
	R1*4/4 |
%50
	r4 a4. g8 f4 |
	e d8 d' cis'4 d' | % en 1576 y 1603 no hay sostenido, en 1585 sí
	e' d'2 cis'4 |
	d'1 |
	r2 r4 g |
%55
	a b c' a |
	b cis' d' b |
	a2 r |
	r r4 a |
	d' d' d'2 |
%60
	c'4 d'2 cis'4 |
	\set Staff.autoBeaming = ##t
	d'1 |
	r2 d' |
	b4 cis' d'2 |
	r4 c' a b |
%65
	c' g a g |
	r c'2 a4 |
	bes g f8 g a bes |
	c'4 f' e' c' |
	d'2 r |
%70
	r r4 d' |
	a c'4. a8 d'4 ~ |
	d' cis'8 b cis'2 |
	d'1 ~ |
	d' ~ |
%75
	d'\breve*1/2
}

tenor={
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
%5
	r2 r4 e ~ |
	e f g a |
	b c'2 b8 a |
	b4 a r e |
	e1 |
%10
	e2 r4 d |
	d'2. d'4 |
	cis'2 r |
	R1*4/4 |
	r4 a d' c' |
%15
	f g a2 |
	\[d a\] |
	d4 d' cis' d' | % en 1576 y 1603 no hay sostenido, en 1585 sí.
	e' d' b2 |
	\[c' b\] |
%20
	c' r4 a ~ |
	a8 b c' d' e'2 |
	b4 g4. a8 b c' |
	d'2 a |
	R1*4/4 |
%25
	R1*4/4 |
	r4 c' b4. a8 |
	g4 a2 gis4 |
	a f g4. f8 |
	e4 d e e |
%30
	d2 f4. f8 |
	f4 d g d |
	d1 |
	d2 r |
	d'4. c'8 bes4 a |
%35
	g f bes2 ~ |
	bes a |
	R1*4/4 |
	R1*4/4 |
	r2 d'4. c'8 |
%40
	bes4 a g f |
	g4. f8 e2 |
	d r |
	R1*4/4 |
	r2 r4 a |
%45
	d'2 r4 g |
	\set Staff.autoBeaming = ##f
	c' f8 f g a bes4 |
	a f4. c8 d4 |
	a2 d |
	r4 a a8 f e4 |
%50
	d2 r4 a ~ |
	a8 g f4 e d |
	a1 |
	a2 r |
	R1*4/4 |
%55
	R1*4/4 |
	R1*4/4 |
	\set Staff.autoBeaming = ##t
	r2 r4 e |
	f2. e4 |
	d8 e f d g4 d |
%60
	a1 |
	a2 f |
	d4 e f2 |
	r4 a2 f4 |
	g a2 g8 f |
%65
	e2 r4 g |
	e g f2 |
	r r4 a ~ |
	a f g a |
	bes4. a8 g4 f |
%70
	bes2 a4 f |
	d e f d |
	a2 r4 a |
	d d'4. c'8 a4 |
	bes8 a g f g2 |
%75
	a\breve*1/2
}

tenordos={
	d4. e8 f4 g |
	a b c' d' ~ |
	d' c'8 b a4 g ~ |
	g f e2 ~ |
%5
	e a |
	R1*4/4 |
	R1*4/4 |
	e4. f8 g4 a |
	b c' b2 |
%10
	a4 a d'2 ~ |
	d' bes |
	a4 e f2 ~ |
	f d |
	e r |
%15
	R1*4/4 |
	R1*4/4 |
	r4 a a b |
	c' a gis b ~ | % en 1576 no hay sostenido
	b8 a a2 gis4 |
%20
	a2 c'4. b8 |
	a g a4. g8 e f |
	g a b c' d'2 |
	d r |
	R1*4/4 |
%25
	R1*4/4 |
	r4 a g4. f8 |
	e4 d e e |
	d2 r |
	r a ~ |
%30
	a4 a a a |
	bes2. a4 |
	g fis g2 |
	a1 ~ |
	a2 r |
%35
	R1*4/4 |
	r4 g2 f4 |
	f f g c |
	d1 |
	e2 r |
%40
	R1*4/4 |
	R1*4/4 |
	\set Staff.autoBeaming = ##f
	r4 a b c'8 c' |
	a g a4 g c' ~ |
	c'8 b a4 gis a |
%45
	r a b2 |
	R1*4/4 |
	R1*4/4 |
	r4 a4. a8 a4 |
	c' a r a ~ |
%50
	a8 a a4 c' d' |
	a2 r4 a ~ |
	a8 g f4 e2 |
	d4 a b2 |
	c'4 d'2 cis'!4 |
%55
	d'4.  c'16[ b] a2 |
	g4 a d e |
	f4. g8 a2 |
	a1 |
	r4 d d8 d g4 ~ |
%60
	g f e2 |
	\set Staff.autoBeaming = ##t
	d4 a2 f4 |
	g a a2 |
	r f |
	d4 e f d |
%65
	c c'2 b8 a |
	g4 g c'2 |
	r c' |
	a4 b c'2 |
	r4 d' \ss bes c' |
%70
	d' g r a |
	f g a g8 f |
	e1 |
	f4 a a8 g f e |
	d1 |
%75
	d\breve*1/2 
}

bassus={
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
%5
	r2 a,4. b,8 |
	c4 d e f |
	g a2 g8 f |
	e4 a, e a, |
	e,1 |
%10
	a,2 r |
	R1*4/4 |
	r4 a, d2 ~ |
	d bes, |
	a, r |
%15
	R1*4/4 |
	R1*4/4 |
	r4 d a g |
	c d e2 |
	\[a, e\] |
%20
	a,1 |
	r4 a,4. b,8 c d |
	e f g4 g,2 |
	r4  d8[ e f g] a4 |
	e c g d |
%25
	e2. e4 |
	a,2 r |
	R1*4/4 |
	r4 d c g, |
	a,2. a,4 |
%30
	d2 d |
	bes, g,4 \ss fis, |
	g, d g,2 |
	d1 ~ |
	d2 r |
%35
	R1*4/4 |
	r2 d4. c8 |
	bes,4 a, g, f, |
	bes,1 |
	a,2 r |
%40
	R1*4/4 |
	R1*4/4 |
	\set Staff.autoBeaming = ##f
	r4 d g c8 c |
	d e f4 e c ~ |
	c8 g, a,4 e a, |
%45
	r d g2 |
	R1*4/4 |
	R1*4/4 |
	r2 r4 f ~ |
	f8 c d4 a,2 |
%50
	d4 f4. e8 d4 |
	cis d a, d |
	cis d a,2 |
	d4 d g4. f8 |
	e4 d e2 |
%55
	d r |
	R1*4/4 |
	r2 r4 a, |
	d2 a, |
	bes, g, |
%60
	a,1 |
	\set Staff.autoBeaming = ##t
	d2 d |
	b,4 c d2 |
	r d |
	b,4 c d g, |
%65
	r c a, b, |
	c2 f, |
	r r4 f ~ |
	f d e f |
	bes,2 r4 f |
%70
	d e f8 e d c |
	d4 c f, g, |
	a,1 |
	r4 d2 d4 |
	g,1 |
%75
	d\breve*1/2
}

textocantus=\lyricmode{
Ar -- dens est cor me -- _ _ _ _ _ _ _ _ _ _ _ um
ar -- dens est cor me -- um
de -- si -- _ _ _ de -- ro
de -- si -- de -- ro vi -- de -- re Do -- mi -- num
me -- um:
quæ -- _ ro
quæ -- _ _ _ _ _ _ _ ro
et non in -- ve -- _ ni -- o
et non in -- ve -- ni -- o,
et non in -- ve -- ni -- o u -- _ bi po -- su -- e -- runt
e -- _ _ _ _ um
u -- bi po -- su -- e -- runt e -- um
u -- _ bi po -- su -- e -- runt e -- _ _ um,
si tu su -- stu -- li -- sti il -- lum
si tu
si tu su -- stu -- li -- sti il -- lum % 1576: su -- stu -- li -- sti i -- _ _ lum
di -- ci -- to mi -- hi,
di -- _ ci -- to mi -- _ _ hi
di -- ci -- to mi -- hi
et e -- go e -- um
tol -- _ _ lam,
et e -- go e -- um tol -- lam,
et e -- go e -- _ _ um
tol -- lam
al -- le -- lu -- _ ia
al -- _ le -- lu -- _ ia
al -- le -- lu -- ia _
al -- le -- lu -- ia
\italicas al -- le -- lu -- ia \rectas
al -- le -- lu -- _ _ _ _ _ ia.
}

textocantusdos=\lyricmode{
Ar -- \mt #3.3 dens \mt #.5 est cor me -- _ _ _ _ _ um _
ar -- dens est cor me -- _ _ _ _ um
de -- si -- _ de -- ro
vi -- de -- re Do -- mi -- num me -- _ um,
vi -- de -- re Do -- mi -- num
me -- um:
quæ -- ro et non in -- ve -- ni -- o,
et non in -- ve -- ni -- o
u -- bi po -- su -- e -- runt e -- _ um
u -- _ bi po -- su -- e -- runt e -- _ um
u -- bi po -- su -- e -- runt e -- _ _ _ um % en 1576 no está claro el texto
si tu
si tu su -- stu -- li -- sti il -- lum
di -- ci -- to mi -- _ _ hi,
di -- _ ci -- to mi -- _ _ hi
di -- ci -- to mi -- _ _ hi
et e -- go e -- um tol -- _ _ _ _ _ lam, __ _ _ _ _ 
et e -- go e -- _ _ um tol -- lam
al -- le -- lu -- ia,
al -- le -- lu -- ia
\italicas al -- le -- lu -- ia, \rectas 
al -- le -- lu -- ia
al -- _ le -- lu -- ia, _ 
al -- le -- lu -- _ _ ia
al -- le -- lu -- _ _ _ _ _ _ _ _ _ ia. __ _ _ 
}

textoaltus=\lyricmode{
Ar -- dens est cor me -- _ _ _ _ _ _ _ _ _ _ um,
ar -- dens est cor me -- _ _ um
de -- si -- _ _ _ de -- ro vi -- de -- re Do -- mi -- num me -- _ _ _ _ um:
quæ -- _ _ _ _ ro,
quæ -- _ _ _ _ _ _ _ _ ro et non __ _ _ in -- ve -- ni -- o
et non in -- ve -- _ ni -- o
u -- bi po -- su -- e -- _ runt e -- um
u -- _ bi po -- su -- e -- runt e -- um
u -- _ bi po -- su -- e -- runt e -- um,
si tu su -- stu -- li -- sti il -- lum,
di -- _ ci -- to mi -- hi
si tu,
si tu su -- stu -- li -- sti il -- lum
di -- ci -- to mi -- _ _ hi
di -- ci -- to mi -- hi,
di -- ci -- to mi -- _ _ hi
et e -- go e -- um tol -- _ _ _ lam
et e -- go e -- um tol -- _ lam
al -- le -- lu -- ia
\italicas al -- le -- _ lu -- _ _ ia \rectas 
al -- le -- lu -- _ ia, __ _ _ _ _ 
al -- le -- lu -- ia
al -- le -- lu -- _ _ _ _ _ _ ia. _ _ 
}

textotenor=\lyricmode{
Ar -- _ dens est cor me -- _ _ _ _ um
cor me -- um
de -- si -- de -- ro
vi -- de -- re Do -- mi -- num 
me -- _ um,
vi -- de -- re Do -- mi -- num
me -- _ um:
quæ -- _ _ _ _ _ ro,
quæ -- _ _ _ _ ro
et non in -- ve -- _ ni -- o,
et non __ _ _ in -- ve -- ni -- o
u -- bi po -- su -- e -- runt
e -- um
u -- bi po -- su -- e -- runt e -- _ um
u -- bi po -- su -- e -- runt e -- _ _ um
si tu
si tu su -- stu -- li -- sti il -- lum di -- ci -- to mi -- hi
di -- ci -- to mi -- hi
di -- _ ci -- to mi -- _ _ hi
et e -- go e -- _ _ _ _ um
tol -- lam,
al -- le -- lu -- ia
al -- le -- lu -- ia __ _ _ _ 
\italicas al -- le -- lu -- ia \rectas 
al -- _ le -- lu -- _
_ _ _ _ _ ia,
\italicas al -- le -- _ lu -- _ ia \rectas 
al -- le -- lu -- _ _ _ _ _ _ _ ia.
}

textotenordos=\lyricmode{
Ar -- dens est cor me -- _ _ _ _ _ _ _ _ _ _ _ _ um
ar -- dens est cor me -- _ _ um
de -- si -- _ de -- ro,
de -- si -- _ de -- ro
vi -- de -- re Do -- mi -- num me -- _ _ _ _ um:
quæ -- _ _ _ _ _ _ _ _ _ _ _ _ ro
et non __ _ _ in -- ve -- ni -- o
u -- _ bi po -- su -- e -- runt
e -- _ _ um _
u -- bi po -- su -- e -- runt e -- um
si tu su -- stu -- li -- sti il -- lum di -- _ ci -- to mi -- hi
si tu di -- ci -- to mi -- hi
di -- _ ci -- to mi -- _ hi
di -- _ ci -- to mi -- hi,
et e -- go e -- um
tol -- _ _ _ lam,
et e -- go e -- um tol -- lam
et e -- go e -- _ um tol -- lam,
al -- le -- lu -- _ ia
al -- le -- _ lu -- _ ia, % en 1576 al -- le -- lu -- _ ia, ij
al -- le -- _ _ lu -- ia
al -- le -- lu -- ia
al -- le -- _ \italicas lu -- \rectas ia % al -- le -- lu -- _ ia
\italicas al -- le -- _ lu -- _ _ _ ia, \rectas 
al -- le -- _ _ _ lu -- ia. % en 1576 está mal aplicada la letra
}

textobassus=\lyricmode{
Ar -- dens est cor me -- _ _ _ _ _ _ _ um,
cor me -- um % en 1576 no repite el texto
de -- si -- _ de -- ro
vi -- de -- re Do -- mi -- num me -- _ um:
quæ -- _ _ _ _ _ _ ro
quæ -- _ _ _ _ ro et non in -- ve -- ni -- o
et non in -- ve -- ni -- o u -- bi po -- su -- e -- runt e -- um _
u -- bi po -- su -- e -- runt e -- um
si tu su -- stu -- li -- sti il -- lum di -- _ ci -- to mi -- hi
si tu di -- _ ci -- to mi -- hi, 
di -- ci -- to mi -- _ hi,
di -- ci -- to mi -- hi,
et e -- go e -- um tol -- lam
et e -- go e -- um tol -- lam,
al -- le -- lu -- ia
al -- le -- _ \italicas lu -- \rectas ia % lu -- _
al -- le -- _ lu -- ia
\italicas al -- _ le -- lu -- _ ia \rectas
al -- le -- lu -- ia, __ _ _ _ _ % en 1576 es diferente lu -- _ _ _ _ _ _ 
al -- le -- lu -- ia
al -- le -- lu -- ia.
}


incipitcantus=\markup{
	\score{
		{ 
		\set Staff.instrumentName="Cantus I  " % Superius
		\override NoteHead.style = #'neomensural
		\override Staff.TimeSignature.style = #'neomensural
		\cadenzaOn 
		\clef "petrucci-g"
		\key f \major
		\time 2/2
                g'2.
		} 

	\layout { line-width=\incipitwidth indent = 0 }
	}
}

incipitcantusdos=\markup{
	\score{
		{ 
		\set Staff.instrumentName="Cantus II " % en 1576 Altus
		\override NoteHead.style = #'neomensural
		\override Staff.TimeSignature.style = #'neomensural
		\cadenzaOn 
		\clef "petrucci-c1"
		\key f \major
		\time 2/2
                d'2.
		} 

	\layout { line-width=\incipitwidth indent = 0 }
	}
}

incipitaltus=\markup{
	\score{
		{ 
		\set Staff.instrumentName="Altus       " % en 1576 altus II
		\override NoteHead.style = #'neomensural 
		\override Staff.TimeSignature.style = #'neomensural
		\cadenzaOn 
		\clef "petrucci-c2"
		\key f \major
		\time 2/2
                d'1
		} 
	\layout { line-width=\incipitwidth indent = 0 }
	}
}


incipittenor=\markup{
	\score{
		{ 
		\set Staff.instrumentName="Tenor I    " % en 1576 tenor 2
		\override NoteHead.style = #'neomensural 
		\override Staff.TimeSignature.style = #'neomensural
		\cadenzaOn 
		\clef "petrucci-c3"
		\key f \major
		\time 2/2
                a1
		} 
	\layout { line-width=\incipitwidth indent=0 }
	}
}

incipittenordos=\markup{
	\score{
		{ 
		\set Staff.instrumentName="Tenor II  " % en 1576 tenor 1
		\override NoteHead.style = #'neomensural 
		\override Staff.TimeSignature.style = #'neomensural
		\cadenzaOn 
		\clef "petrucci-c3"
		\key f \major
		\time 2/2
                g2.
		} 
	\layout { line-width=\incipitwidth indent=0 }
	}
}

incipitbassus=\markup{
	\score{
		{ 
		\set Staff.instrumentName="Bassus    "
		\override NoteHead.style = #'neomensural
		\override Staff.TimeSignature.style = #'neomensural
		\cadenzaOn 
		\clef "petrucci-f3"
		\key f \major
		\time 2/2
                 d2.
		} 
	\layout { line-width=\incipitwidth indent = 0 }
	}
}

%\layout {
%       \context {\Voice
%               \remove Ligature_bracket_engraver
%               \consists Mensural_ligature_engraver
%       }
%       line-width=\incipitwidth
%       indent = 0
%}

\score {\transpose c' c'{
\new ChoirStaff<<

	\new Staff <<\global
	\new Voice="v1" {
		\set Staff.instrumentName=\incipitcantus
		\clef "treble"
		\cantus }
	\new Lyrics \lyricsto "v1" {\textocantus }
	>>

	\new Staff <<\global
	\new Voice="v5" {
		\set Staff.instrumentName=\incipitcantusdos
		\clef "treble"
		\cantusdos }
	\new Lyrics \lyricsto "v5" {\textocantusdos }
	>>

        \new Staff <<\global
	\new Voice="v2" {
		\set Staff.instrumentName=\incipitaltus
		\clef "G_8"
		\altus }
	\new Lyrics \lyricsto "v2" {\textoaltus }
	>>
	
        	\new Staff <<\global
	\new Voice="v3" {
		\set Staff.instrumentName=\incipittenor
		\clef "G_8"
		\tenor }
	\new Lyrics \lyricsto "v3" {\textotenor }
	>>

	\new Staff <<\global
	\new Voice="v6" {
		\set Staff.instrumentName=\incipittenordos
		\clef "G_8"
		\tenordos }
	\new Lyrics \lyricsto "v6" {\textotenordos }
	>>

        \new Staff <<\global
	\new Voice="v4" {
		\set Staff.instrumentName=\incipitbassus
		\clef "bass"
		\bassus }
	\new Lyrics \lyricsto "v4" {\textobassus }
	>>
	
>>

	} % transpose

\layout{ 
	\context {\Lyrics 
		\override VerticalAxisGroup.staff-affinity = #UP
		\override VerticalAxisGroup.nonstaff-relatedstaff-spacing =
			#'((basic-distance . 0) (minimum-distance . 0) (padding . 1))
		\override LyricText.font-size = #1.2
		\override LyricHyphen.minimum-distance = #0.5
	}
	\context {\Score 
		tempoHideNote = ##t
		\override BarNumber.padding = #2 
	}
	\context {\Voice 
		melismaBusyProperties = #'()
		%autoBeaming = ##f
	}
	\context {\Staff 
                %\RemoveEmptyStaves
                %\override VerticalAxisGroup.remove-first = ##t
		\override VerticalAxisGroup.staff-staff-spacing =
			#'((basic-distance . 11) (minimum-distance . 0) (padding . 1))
		\consists Ambitus_engraver 
		\override LigatureBracket.padding = #1
	}
}

%\midi { \mtempo }

}


\paper{
	evenHeaderMarkup=\markup  \fill-line { \fromproperty #'page:page-number-string \htitle \hcomposer }
	oddHeaderMarkup= \markup  \fill-line { \on-the-fly #not-first-page \hcomposer \on-the-fly #not-first-page \htitle \on-the-fly #not-first-page \fromproperty #'page:page-number-string }
	%system-count=20
	%page-count = 8
	ragged-last-bottom = ##f
	indent=3.8\cm
	system-system-spacing =
	#'((basic-distance . 22) (minimum-distance . 0) (padding . 5))
	top-system-spacing = % header
	#'((basic-distance . 8) (minimum-distance . 0) (padding . 0))
	last-bottom-spacing = % footer
	#'((basic-distance . 12) (minimum-distance . 0) (padding . 0))
        markup-system-spacing.padding = #3
}
