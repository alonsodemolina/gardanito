\version "2.18.0"

#(set-default-paper-size "a4")
#(set-global-staff-size 16.4)
#(ly:set-option 'point-and-click #f)
%mobile -s15.5 -i3.4

italicas=\override LyricText.font-shape = #'italic
rectas=\override LyricText.font-shape = #'upright
ss=\once \set suggestAccidentals = ##t
incipitwidth = 20
htitle="Ave Maris Stella: 6. Agnus Dei"
hcomposer="Victoria"


\header {
	title=\markup{\fontsize #3 "6. Agnus Dei"}
	subtitle=\markup{"de la misa Ave Maris Stella"}
	subsubtitle=\markup{\null \vspace #2 }
        composer=\markup{"Tomás Luis de Victoria (c.1548-1611)"}
        poet="1576,  1583a"
	copyright=\markup{
		\fill-line {"Edited by Nancho Alvarez" \typewriter "http://tomasluisdevictoria.org"}
	}
%	tagline=""
}

global={\key f \major \time 2/2 \skip 1*37 \bar "||" }


cantus={
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
%5
	R1*4/4 |
	g'2 d'' |
	\[e'' c'' |
	d''1\] |
	\[e''2 f''\] |
%10
	\[g'' f''\] |
	\[e'' d'' ~ \] |
	d''4 cis''8 \ss b' cis''2 |
	d''1 ~ |
	d'' |
%15
	r4 d'' d'' d'' |
	g'2 a'4 bes' |
	c''2. bes'8 a' |
	bes'4. g'8 a'2 |
	bes' r4 d'' |
%20
	d'' d'' g'2 |
	a'4 bes' c''4. bes'8 |
	a'4 g'2 fis'4 |
	g'2 bes' ~ |
	bes'1 |
%25
	a' |
	c'' |
	d'' |
	\[g'2 a'\] |
	bes'4. a'8 g'4 f' ~ |
%30
	f' e' f'2 ~ |
	f' a' ~ |
	a'4 a' c''2 ~ |
	c''1 |
	a'2 bes'4 a'8 g' |
%35
	a'4 f' g'2 ~ |
	g'4 fis'8 e' fis'2 |
	g'\breve*1/2 
}

altus={
	d'2. c'4 |
	d' g8[ a bes c'] d'4 ~ |
	d'8 e' f' g' a' bes' c'' a' |
	bes'4. a'16 g' f'4 g' |
%5
	e' c' d'2 |
	e'4 g'2 fis'4 |
	g' c'8[ d' e' f'] g'4 ~ |
	g'8 f' d' e' f'4 g' |
	e' a'2 a'4 |
%10
	g'4. a'8 bes'2 ~ |
	bes'4 a'8 g' f'4 g' |
	a'2 r4 a' |
	a' a' d' f' ~ |
	f'8 g' a'2 bes'4 |
%15
	a'2 bes' |
	R1*4/4 |
	r4 a' a' a' |
	d' g'2 fis'4 |
	g'4. a'8 bes'2 |
%20
	a'4 bes' c''4. bes'8 |
	a'4 g' f' e' |
	f'8 e' d' c' d'2 |
	bes4 d'2 d'4 |
	bes g d'4. c'8 |
%25
	d' e' f'4 d' a' ~ |
	a' a' g' e' |
	g'2 d' |
	r4 g'2 fis'4 |
	g' d' ees'8 d' c' bes |
%30
	c'2 c' |
	r4 a2 a4 |
	c' d' e' f' |
	g' a'4. g'8 g'4 ~ |
	g' f'8 e' f'4. e'16 d' |
%35
	c'4 d' g8 a bes c' |
	d'1 |
	d'\breve*1/2 
}

tenor={
	R1*4/4 |
	R1*4/4 |
	d'2. c'4 |
	d' g8[ a bes c'] d'4 ~ |
%5
	d'8 c' c'2 b4 |
	\[c'2 a\] |
	c'4. bes8 g4. a8 |
	bes1 |
	a2 r4 d' ~ |
%10
	d' c' d'8 c' bes a |
	g4 a bes8 c' d' e' |
	f'4 e'8 d' e'2 |
	d'4 a' a' a' |
	d'4. e'8 f'4 g' ~ |
%15
	g' fis' g'4. \ss f'16 e' |
	d'4 e'4. f'8 g'4 ~ |
	g' fis'8 e' fis'2 |
	g'4 d' d' d' |
	g8 a bes c' d'4. e'8 |
%20
	f' g' f'2 e'8 d' |
	e'4 d' c'2 ~ |
	c'4 bes a2 |
	g r |
	r4 g'2 g'4 |
%25
	f' d' f'4. d'8 |
	e'4 f' e'2 |
	d'4 bes2 a4 |
	c' bes d'4. c'8 |
	bes a bes2 a4 |
%30
	g2 f4 a ~ |
	a a c'4. d'8 |
	e'4 f' g' a' |
	e' f'4. e'8 c'4 |
	d'2 r4 a ~ |
%35
	a a c' g |
	bes a8 g a2 |
	g\breve*1/2
}

bassus={
	R1*4/4 |
	g2. f4 |
	g d8[ e f g] a4 |
	g8 a bes c' d'4 g |
%5
	a4. g8 f4 g |
	\[c2 d |
	c1\] |
	g2 r4 d' ~ |
	d' c' d' d |
%10
	ees2 d4 d' ~ |
	d' c' d' bes |
	a1 |
	d |
	r2 d' |
%15
	d'4 d' g4. a8 |
	bes4 c'2 bes4 |
	a1 |
	g2 r4 d' |
	d' d' g8 a bes c' |
%20
	d'4 d' c'2 ~ |
	c'4 bes a4. g8 |
	f4 g d2 |
	g1 ~ |
	g |
%25
	r4 d'2 d'4 |
	c' a c'2 |
	g4 g2 f4 |
	ees2 d |
	g4. f8 ees4 f |
%30
	c2 f ~ |
	f1 |
	R1*4/4 |
	R1*4/4 |
	r4 d2 d4 |
%35
	f d ees2 |
	d1 |
	g\breve*1/2 
}


textocantus=\lyricmode{
A -- gnus De -- _ _ _ _ _ _ _ _ _ _ _ _ i, _
qui tol -- lis pec -- ca -- ta mun -- _ _ _ _ _ di,
qui tol -- lis pec -- ca -- ta mun -- _ _ _ _ di:
mi -- _ se -- re -- re
no -- _ _ _ _ _ _ _ bis, _
mi -- _ se -- re -- _ re no -- _ _ _ _ _ _ _ _ _ bis.

}

textoaltus=\lyricmode{
A -- gnus De -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ i, 
A -- gnus De -- _ _ _ _ _ _ _ _ _ _ _ i,
A -- gnus De -- _ _ _ _ _ _ _ i,
qui tol -- lis pec -- ca -- _ _ _ ta mun -- di,
qui tol -- lis pec -- ca -- ta mun -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ di:
mi -- se -- re -- re
no -- _ _ _ _ bis, 
mi -- _ se -- re -- re no -- bis,
mi -- se -- re -- re no -- _ _ _ _ bis,
mi -- se -- re -- re no -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ bis.
}

textotenor=\lyricmode{
A -- gnus De -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ i,
A -- _ gnus De -- _ _ _ _ _ _ _ _ _ _ _ _ _ i,
qui tol -- lis pec -- _ _ ca -- _ ta mun -- _ _ _ _ _ _ _ _ _ _ di,
qui tol -- lis
pec -- _ _ _ ca -- _ _ _ _ _ _ _ ta mun -- _ _ _ di:
mi -- se -- re -- re no -- _ _ _ _ bis,
mi -- se -- re -- re no -- _ _ _ _ _ _ bis,
mi -- _ se -- re -- _ _ re no -- _ _ _ _ _ bis,
mi -- _ se -- re -- re no -- _ _ _ bis.
}

textobassus=\lyricmode{
A -- gnus De -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ i,
A -- _ gnus De -- _ _ i,
\italicas
A -- _ gnus De -- _ _ i,
\rectas
qui tol -- lis pec -- _ _ ca -- ta mun -- di,
qui tol -- lis pec -- _ _ _ _ ca -- ta _ _ mun -- _ _ _ _ di: _
mi -- se -- re -- re no -- bis,
mi -- se -- re -- re
no -- _ _ _ _ bis, _
mi -- se -- re -- re no -- _ bis.
}



incipitcantus=\markup{
	\score{
		{ 
		\set Staff.instrumentName="Cantus " % Superius
		\override NoteHead.style = #'neomensural
		\override Rest.style = #'neomensural
		\override Staff.TimeSignature.style = #'neomensural
		\cadenzaOn 
		\clef "petrucci-g"
		\key f \major
		\time 2/2
		g'1
		} 
	\layout {
		\context {\Voice
			\remove Ligature_bracket_engraver
			\consists Mensural_ligature_engraver
		}
		line-width=\incipitwidth
                indent=0
	}
	}
}


incipitaltus=\markup{
	\score{
		{ 
		\set Staff.instrumentName="Altus    "
		\override NoteHead.style = #'neomensural 
		\override Rest.style = #'neomensural
		\override Staff.TimeSignature.style = #'neomensural
		\cadenzaOn 
		\clef "petrucci-c2"
		\key f \major
		\time 2/2
		d'1.
		} 
	\layout {
		\context {\Voice
			\remove Ligature_bracket_engraver
			\consists Mensural_ligature_engraver
		}
		line-width=\incipitwidth
                indent=0
	}
	}
}


incipittenor=\markup{
	\score{
		{ 
		\set Staff.instrumentName="Tenor   "
		\override NoteHead.style = #'neomensural 
		\override Rest.style = #'neomensural
		\override Staff.TimeSignature.style = #'neomensural
		\cadenzaOn 
		\clef "petrucci-c3"
		\key f \major
		\time 2/2
		d'1.
		} 
	\layout {
		\context {\Voice
			\remove Ligature_bracket_engraver
			\consists Mensural_ligature_engraver
		}
		line-width=\incipitwidth
                indent=0
	}
	}
}


incipitbassus=\markup{
	\score{
		{ 
		\set Staff.instrumentName="Bassus "
		\override NoteHead.style = #'neomensural 
		\override Rest.style = #'neomensural
		\override Staff.TimeSignature.style = #'neomensural
		\cadenzaOn 
		\clef "petrucci-c4"
		\key f \major
		\time 2/2
		g1.
		} 
	\layout {
		\context {\Voice
			\remove Ligature_bracket_engraver
			\consists Mensural_ligature_engraver
		}
		line-width=\incipitwidth
                indent=0
	}
	}
}





\score {\transpose c' g{
\new ChoirStaff<<

	\new Staff <<\global
	\new Voice="v1" {
		\set Staff.instrumentName=\incipitcantus
		\clef "treble"
		\cantus }
	\new Lyrics \lyricsto "v1" {\textocantus }
	>>

	
	\new Staff << \global
	\new Voice="v2" {
		\set Staff.instrumentName=\incipitaltus
		\clef "G_8" 
		\altus}
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
	\new Voice="v4" {
		\set Staff.instrumentName=\incipitbassus
		\clef "bass" 
		\bassus }
	\new Lyrics \lyricsto "v4" {\textobassus}
	>>
	
>>

}%transpose

\layout{ 
	%\context {\Lyrics \override VerticalAxisGroup.minimum-Y-extent = #'(-0 . 0) }
	\context {\Score \override BarNumber.padding = #2 }
	%\context {\Lyrics \override LyricText.font-size = #2 }
	\context {\Voice melismaBusyProperties = #'() }
	%\context { \Staff \RemoveEmptyStaves }
	\context {\Staff 
                  \override VerticalAxisGroup.staff-staff-spacing =
			#'((basic-distance . 11) (minimum-distance . 0) (padding . 1))
		\consists Ambitus_engraver 
			\override LigatureBracket.padding = #1
	}
}

%\midi {}


}


global={\set Score.currentBarNumber = #38 
	\key f \major \time 2/2 \skip 1*37 \bar "|." }


cantus={\bar ""
	g'1 |
	d'' |
%40
	\[e''2 c'' |
	d''1\] |
	d''2 r4 g'' ~ |
	g'' e'' f'' e'' |
	d''4. c''8 bes'4 c'' |
%45
	a' bes' a'4. bes'8 |
	c''4 g''2 e''4 |
	f''2 c'' |
	R1*4/4 |
	r2 r4 a' |
%50
	bes' a'2 a'4 |
	c'' c'' bes'8 c'' d'' e'' |
	f''2. e''4 |
	d''1 |
	d''2 r |
%55
	d'' g'' |
	fis''4 fis'' g''2 ~ |
	g''4 c'' d''4. e''8 |
	f''4 d'' ees''2 ~ |
	ees'' d'' ~ |
%60
	d'' r4 d'' ~ |
	d'' d'' cis''2 |
	d''4 f''4. d''8 f''4 |
	e''8 d'' c'' bes' a' g' a'4 |
	g' g''2 g''4 |
%65
	fis''2 g''4 g'8 a' |
	bes' c'' d''2 a'4 |
	r d''2 d''4 |
	d'' bes' c'' d'' |
	g' g''2 g''4 |
%70
	f'' d'' f''4. e''8 |
	c''4. d''8[ e'' f''] g''4 ~ |
	g''8 f'' e'' d'' c'' bes' a' g' |
	f'4 g'2 fis'4 |
	g'\breve*1/2
}

altus={
	R1*4/4 |
	g'2 f'4 g' |
%40
	c' c'' a' c'' ~ |
	c'' bes' g' bes' ~ |
	bes'8 a' bes' g' a'4 bes' |
	c'' g' a' g'8 f' |
	g'2 g' |
%45
	R1*4/4 |
	r4 c' g'2 |
	a'2. f'4 |
	g'4. a'8 bes'4 c'' ~ |
	c'' bes' a'2 |
%50
	g'4 e' f'2 |
	e'4 e' g' g' |
	f'8 g' a' f' g'4. a'8 |
	bes'2 a'4 f' |
	bes'4. a'16 g' a'2 ~ |
%55
	a' g' |
	r r4 d' |
	ees'2 d'4 g' |
	a' f' g'4. f'8 |
	ees'4 c' f'2 |
%60
	r4 d'2 d'4 |
	f' g' a' e' |
	r2 d'4. d'8 |
	e'4 e' f'2 ~ |
	f'4 e'8 d' c'4 g |
%65
	R1*4/4 |
	g'4. g'8 a'4 a' |
	bes'4. a'16 g' a'2 |
	g'1 ~ |
	g' |
%70
	r2 a' ~ |
	a'4 f' g'4. f'8 |
	e' d' e'4 f' c' |
	d'1 |
	d'\breve*1/2
}

tenor={
	R1*4/4 |
	R1*4/4 |
%40
	R1*4/4 |
	g1 |
	d' |
	\[e'2 c'\] |
	d'2. e'4 |
%45
	fis' g'2 fis'4 |
	g'4. f'8[ e' d'] c'4 ~ |
	c'8 bes a g a f c'4 ~ |
	c' bes8 a g4 c' |
	a bes c' d' ~ |
%50
	d' cis' d'2 |
	r4 a bes2 |
	a4 a c' c' |
	bes8 c' d' e' f' g' a'4 ~ |
	a'8 g' g'2 fis'8 e' |
%55
	\ss f'! e' d' c' bes4 c' |
	d'1 |
	c'4 g' g' g |
	d'2 c'4 bes ~ |
	bes a bes8 c' d' e' |
%60
	f'2 r |
	d'4. d'8 e'4 e' |
	f' d'8 e' f' g' a' f' |
	g' f' e' d' c'4 f |
	r g2 g4 |
%65
	a a bes8 a bes c' |
	d'4 bes a2 |
	g4 g'2 fis'4 |
	g'4. f'8 ees'4 d' |
	c' bes8 a bes4 c' |
%70
	d' f' d' f' ~ |
	f'8 e' c'4. d'8 e' f' |
	g'2 c'4 f' ~ |
	f'8 e' d'4. c'8 a4 |
	b\breve*1/2
}

tenordos={
	R1 |
	R1*4/4 |
%40
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
	g1 |
%45
	\[d' |
	e'\] |
	\[c' |
	d'2.\] e'4 |
	f' g'2 f'4 |
%50
	\[e'2 d'\] |
	c' d' ~ |
	d' r |
	d'1 |
	d' ~ |
%55
	d'2 g |
	\[a bes\] |
	c'2. bes4 |
	a2 g |
	R1*4/4 |
%60
	r2 bes ~ |
	bes a ~ |
	a1 |
	c' ~ |
	c' |
%65
	d' ~ |
	d' ~ |
	d' |
	g ~ |
	g |
%70
	a2 a ~ |
	a c' ~ |
	c' a |
	bes a |
	g\breve*1/2
}
bassus={
	R1*4/4 |
	R1*4/4 |
%40
	R1*4/4 |
	R1*4/4 |
	g2 f4 g |
	c c' a c' ~ |
	c' bes8 a g4 c |
%45
	d1 |
	c |
	f4. e8 f4 a |
	g2 r |
	r r4 d |
%50
	g a d8 e f g |
	a4 a g2 |
	d4 d c c |
	g8 a bes c' d'4. c'8 |
	bes4 g d2 |
%55
	r4 d ees2 |
	d4 d g2 |
	c g4. f8 |
	d e f4 ees4. d8 |
	c2 bes,4 bes ~ |
%60
	bes bes g8 a bes c' |
	d'4 g r2 |
	d2. d4 |
	c2 f |
	c4. d8 ees2 |
%65
	d g ~ |
	g4 g fis2 |
	g \[d |
	ees4.\] d8 c4 bes, |
	ees1 |
%70
	d2 d |
	f c ~ |
	c f |
	bes,4. c8 d2 |
	g\breve*1/2 
}


textocantus=\lyricmode{
A -- gnus De -- _ _ i,
A -- _ gnus De -- _ _ _ _ _ _ _ _ _ _ _ _ _ i,
qui tol -- lis pec -- ca -- ta mun -- _ _ _ _ _ _ di,
qui tol -- lis pec -- ca -- _ ta mun -- _ _ _ _ _ di: _
do -- _ na no -- bis pa -- _ _ _ _ _ _ _ _ _ cem,
do -- na no -- bis pa -- _ _ _ _ cem,
\italicas
do -- na no -- bis pa -- _ cem,
\rectas
do -- na no -- bis pa -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ cem.
}

textoaltus=\lyricmode{
A -- gnus De -- i, 
A -- gnus De -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ i,
A -- gnus De -- _ _ _ _ _ _ _ _ i,
qui tol -- lis pe -- ca -- ta mun -- _ _ _ _ _ _ _ _ _ _ _ _ _ di,
qui tol -- lis pec -- ca -- ta mun -- _ _ _ di:
do -- na no -- bis pa -- cem,
do -- na no -- bis pa -- _ _ _ _ cem,
do -- na no -- bis pa -- _ _ _ cem, _
do -- _ na no -- _ _ _ _ _ bis pa -- cem.
}

textotenor=\lyricmode{
A -- gnus De -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ i,
A -- gnus De -- _ _ _ _ i,
qui tol -- lis pec -- ca -- ta mun -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ di,
pec -- ca -- ta mun -- _ _ _ _ di: __ _ _ _ _ 
do -- na no -- bis pa -- _ _ _ _ _ _ _ _ _ _ _ cem,
do -- na no -- bis pa -- _ _ _ _ _ _ cem,
do -- na no -- _ _ bis pa -- _ _ _ _ cem, 
do -- na no -- _ _ _ _ _ _ _ bis pa -- _ _ _ _ _ cem.
}

textotenordos=\lyricmode{
A -- gnus __ _ De -- _ _ _ _ _ _ _ _ i, _
qui tol -- _ lis pec -- _ ca -- ta mun -- di:
do -- _ na _ 
no -- _ bis _ _ pa -- _ cem,
\italicas
do -- _ na _ no -- bis pa -- cem.
}

textobassus=\lyricmode{
A -- gnus De -- i, 
\italicas
A -- gnus De -- _ _ _ _ _ _ i,
A -- gnus De -- _ i,
\rectas
qui tol -- lis pec -- _ _ _ ca -- ta mun -- di,
pec -- ca -- ta mun -- _ _ _ _ _ _ _ di,
qui tol -- lis pec -- ca -- ta mun -- _ _ _ _ _ _ _ di:
do -- _ na no -- _ _ _ _ bis,
do -- na no -- bis pa -- _ _ cem,
\italicas
do -- _ na no -- bis pa -- _ _ _ _ _ cem,
\rectas
do -- na no -- _ bis pa -- _ _ cem.
}




\score {\transpose c' g{
\new ChoirStaff<<

	\new Staff <<\global
	\new Voice="v1" {
		\set Staff.instrumentName="C  "
		\clef "treble"
		\cantus }
	\new Lyrics \lyricsto "v1" {\textocantus }
	>>

	
	\new Staff << \global
	\new Voice="v2" {
		\set Staff.instrumentName="A  "
		\clef "G_8" 
		\altus}
	\new Lyrics \lyricsto "v2" {\textoaltus }
	>>

	
	\new Staff <<\global
	\new Voice="v3" {
		\set Staff.instrumentName="T1 "
		\clef "G_8"
		\tenor }
	\new Lyrics \lyricsto "v3" {\textotenor }
	>>

	
	\new Staff <<\global
	\new Voice="v5" {
		\set Staff.instrumentName="T2 "
		\clef "G_8"
		\tenordos }
	\new Lyrics \lyricsto "v5" {\textotenordos }
	>>
	

	\new Staff <<\global
	\new Voice="v4" {
		\set Staff.instrumentName="B  "
		\clef "bass" 
		\bassus }
	\new Lyrics \lyricsto "v4" {\textobassus }
	>>
	
>>

}%transpose

\layout{ 
        indent = 0.6\cm
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
	indent=3.5\cm
	system-system-spacing =
	#'((basic-distance . 20) (minimum-distance . 0) (padding . 5))
	top-system-spacing = % header
	#'((basic-distance . 9) (minimum-distance . 0) (padding . 0))
	last-bottom-spacing = % footer
	#'((basic-distance . 12) (minimum-distance . 0) (padding . 0))

}
