\version "2.18.0"

#(set-default-paper-size "a4")
#(set-global-staff-size 16.6)
%#(ly:set-option 'point-and-click #f)
%mobile -s15.5 -i3.2

italicas=\override LyricText.font-shape = #'italic
rectas=\override LyricText.font-shape = #'upright
ss=\once \set suggestAccidentals = ##t
incipitwidth = 20

htitle="Pueri hebræorum"
hcomposer="Victoria"

\header {
	title=\markup{\fontsize #4 "Pueri hebræorum"}
	subtitle="Dominica in Ramis Palmarum"
	subsubtitle=\markup{\null \vspace #2 }
	composer="Tomás Luis de Victoria (c.1548-1611)"
	%opus="(-)"
	%poet="1572,  1583b,  1585a,  1589a,  1589b,  1603"
	poet="1572,  1583b...,  1585a"
	copyright=\markup{
		\fill-line {"Transcribed and edited by Nancho Alvarez" \typewriter "http://tomasluisdevictoria.org"}
	}
%	tagline=""
}


global={\key c \major \time 2/2 \skip 1*59 \bar "|." }

cantus={
	R1*4/4 |
	r2 c'' ~ |
	c''4 c'' \[a'2 |
	g'\] c'' ~ |
%5
	c''4 c'' d''8 c'' d'' e'' |
	f''4 c'' f''2 ~ |
	f'' e''4 c'' ~ |
	c'' c'' \[a'2 |
	g'\] c'' ~ |
%10
	c''4 c'' d''2 |
	e''4  c''8[ d'' e'' f''] g''4 ~ |
	g'' fis'' g''4. \ss f''8 |
	e'' d'' e''4. d''8 c'' b' |
	a'2 g'4 b' |
%15
	c'' d'' e'' fis'' | 
	g''1 |
	e''4 e''4. e''8 e''4 |
	d'' c''2 b'4 ~ |
	b' a'2 g'4 ~ |
%20
	g' g' a'8 g' a' b' |
	\[c''2 d''\] |
	g' r4 g' | %\break
	a' b' c''2 |
	b'1 |
%25
	r2 r4 g' ~ |
	g' g' c''2 |
	c''4 b' a'4. g'16 a' |
	b'2. a'8 g' |
	a'4. b'8 c''2 |
%30
	g'1 |
	r4 d''2 d''4 |
	g''2 g''4 fis'' |
	g''4.  f''8[ e'' d''] c''4 ~ |
	c'' b' c'' e'' |
%35
	f''2 e''4 e'' ~ |
	e'' e'' f''4. e''8 |
	d''4 c'' b' c'' ~ |
	c'' b' c''2 |
	g'1 |
%40
	a' |
	b'2 b'4 b' |
	c''2 g'4 c'' |
	c'' d'' e''2 |
	c''4 d'' e'' fis'' |
%45
	g''2. g''4 |
	e''2 r |
	r c'' ~ |
	c'' d'' ~ |
	d'' e'' |
%50
	e''4 e'' d''2 ~ |
	d'' b'4 b' |
	b' b' c'' e'' |
	e'' e'' f''4. e''8 |
	d''4 c'' b' c'' ~ |
%55
	c'' b' c''2 ~ |
	c''1 ~ |
	c'' ~ |
	c'' ~ |
	c''\breve*1/2
}

altus={
	f'2. f'4 |
	\[d'2 c'\] |
	f'4 e' f'2 ~ |
	f'4  e'8[ d' e' f'] g'4 |
%5
	c' c''2 b'4 |
	a'8 g' a' b' c''4 a' ~ |
	a'8 g' a' f' g'2 |
	a'4 f'2 f'4 |
	\[d'2 c'\] |
%10
	f'2. f'4 |
	g' a' g'8 f' e' d' |
	e' c' c''2 b'8 a' |
	g'2 g' |
	r r4 g' |
%15
	a' b' c''2 ~ |
	c''4 b'8 a' b'2 |
	c''4 c''4. c''8 c''4 |
	b' a'2 g'4 ~ |
	g' f'2 e'4 ~ |
%20
	e' e' f'8 e' f' g' |
	 a'[ g']  g'[ f'16 e'] f'2 |
	e'4 c' e'4. d'8 |
	e' f' g'2 fis'4 |
	g'1 ~ |
%25
	g' |
	r4 c'2 c'4 |
	g'2 g'4 fis' |
	g'4. f'8 \[e'2 |
	d'\] e' |
%30
	r4 c''2 b'8 a' |
	b'4 a' b'2 ~ |
	b'4 a'8 g' a'2 |
	g'4 d' g'2 ~ |
	g' e'4 g' |
%35
	a'2 g'4 e' |
	g'2 a'4 a' ~ |
	a' a' g' fis' |
	g'2 g' |
	R1*4/4 |
%40
	c'1 |
	d' |
	e'2 e'4 e' |
	f'2 c'4 g' |
	a' b' c'' c'' ~ |
%45
	c'' b'8 a' b'4 b' |
	c''2 g' ~ |
	g' a' ~ |
	a' b' |
	b'4 b' c''2 ~ |
%50
	c''4 b' a'2 ~ |
	a' g' |
	r4 g' g' g' |
	c' c'' c'' c'' |
	a'2 g' ~ |
%55
	g'4 g' e' g' |
	g' g' a' f' ~ |
	f'8 e' a'2 g'4 |
	f'8 e' f' g' a'4 a' |
	g'\breve*1/2
}

tenor={
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
	c'2. c'4 |
%5
	\[a2 g\] |
	c'2. c'4 |
	d'2 e' |
	a4.  b8[ c' d'] c'4 ~ |
	c' b e'8 d' c' b |
%10
	a g c'4.  b8 b[ a] |
	c'4 a r c' ~ |
	c' c' d'2 |
	e'4  c'8[ d' e' f'] g'4 ~ |
	g' fis' g'4. \ss f'8 |
%15
	e'4 d' c'4. d'8 |
	e'4 d'8 c' d'2 |
	c'4 g'4. g'8 g'4 |
	g' e' f' d' |
	e' c' d' b |
%20
	c' c'4. b8 a g |
	f4 c'2 b4 |
	c' g c'2 ~ |
	c'4 b a2 |
	g4 d'2 d'4 |
%25
	e'2 e'4 d' |
	e'2. d'8 c' |
	d'2 r4 d'4 ~ |
	d' d' g'2 |
	g'4 fis' g'4. \ss f'8 |
%30
	e'2 d' ~ |
	d' r4 g ~ |
	g g d'2 |
	d'4 b c'8 d' e' c' |
	d'2 c'4 c' |
%35
	c'2 c' |
	r4 c'2 c'4 |
	f'4. e'8 d'4 c' |
	d'2 c'4 e' ~ |
	\set Staff.autoBeaming = ##f
	e'8 e' e'4 d' e' |
	\set Staff.autoBeaming = ##t
%40
	f'2 e' |
	r4 g' g' g' |
	c' g' g' g' |
	a'2 g'4. f'8 |
	e'4 d' \[c'2 |
%45
	d'2.\] d'4 |
	c' e'2 d'4 |
	e'8 f' g'2 fis'8 e' |
	fis'4 e' g' d' |
	g'4. f'8 g'4 a' ~ |
%50
	a'8 g' g'2 fis'8 e' |
	fis'2 g'4 d' |
	d' d' e' g' |
	g' g' a'2 |
	f'4. e'8 d'4 c' |
%55
	d' d' c' e' |
	e' e' f' a' ~ |
	a'8 g'16 f' e'4 f' g' |
	a'4. g'8[ f' e'] f'4 ~ |
	f'4 e'8 d' e'\breve*1/4
}

bassus={
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
%5
	R1*4/4 |
	f2. f4 |
	\[d2 c\] |
	f2. f4 |
	\[g2 a4.\] g8 |
%10
	f4. e8 d2 |
	c4 c'2 c'4 |
	\[a2 g\] |
	c'2. c'4 |
	\[d'2 e'4.\] d'8 |
%15
	c'4 b a2 |
	g1 |
	r4 c'4. c'8 c'4 |
	g a f g |
	e f d e |
%20
	c c f2 ~ |
	f4 e d2 |
	c1 |
	R1*4/4 |
	r4 g2 g4 |
%25
	c'2 c'4 b |
	c'4. b8 a2 |
	g4 g d'2 |
	g r |
	r r4 c ~ |
%30
	c c g2 |
	g4 fis g4. \ss f8 |
	e2 d |
	\[g c\] |
	g c4 c |
%35
	f2 c4 c |
	c'2 f4 f ~ |
	f f g a |
	g2 c4 c' ~ |
	\set Staff.autoBeaming = ##f
	c'8 c' c'4 b c' |
	\set Staff.autoBeaming = ##t
%40
	f4. g8 a2 |
	g1 |
	r4 c' c' c' |
	f2 r4 c' |
	c' b a2 |
%45
	g2. g4 |
	c c'2 b4 |
	c'4. b8 a2 ~ |
	a g |
	r4 g \[c'2 ~ |
%50
	c' d' ~ \] |
	d' g4 g |
	g g c c' |
	c' c' f2 ~ |
	f g ~ |
%55
	g4 g c c' |
	c' c' f2 |
	r4 a4. g16 f e4 |
	f2. f4 |
	c\breve*1/2
}

textocantus=\lyricmode{
Pu -- _ e -- ri __ _
he -- _ bræ -- o -- _ _ _ _ _ _ _ rum,
pu -- _ e -- ri __ _
he -- _ bræ -- o -- rum,
he -- _ _ _ _ _ bræ -- o -- _ _ _ _ _ _ _ _ rum,
he -- bræ -- o -- _ _ _ rum,
ve -- sti -- men -- ta pro -- ster -- _ ne -- bant _
in vi -- _ _ _ _ _ a
in vi -- _ _ a
et _ cla -- ma -- bant di -- cen -- _ _ _ _ _ _ _ _  tes
et cla -- ma -- bant di -- cen -- _ _ _ _ _ _  tes:
ho -- san -- na
fi -- _ li -- o __ _ _ _ _ 
Da -- _ _ vid,
be -- ne -- di -- ctus qui ve -- nit in no -- mi -- ne
Do -- _ _ _ _ mi -- ni
be -- _ ne -- _ di -- ctus qui ve -- _ nit in 
no -- mi -- ne, in no -- mi -- ne __ _ _ _ _ 
Do -- _ mi -- ni. _ _ _ _ 
}

textoaltus=\lyricmode{
Pu -- e -- ri __ _
he -- bræ -- o -- _ _ _ _ _ _ rum,
he -- bræ -- o -- _ _ _ _ _ _ _ _ _ _ rum,
pu -- e -- ri __ _
he -- bræ -- o -- _ _ _ _ _ _ _ _ _ _ _ rum
he -- bræ -- _ o -- _ _ _ _ rum,
ve -- sti -- men -- ta
pro -- ster -- _ ne -- bant _ in vi -- _ _ _ _ _ _ _ _ _ a,
in vi -- _ _ _ _ _ a _
et cla -- ma -- bant di -- cen -- _ _ _ tes
di -- _ _ _ _ cen -- _ _ _ _ tes,
di -- cen -- _ tes:
ho -- san -- na,
ho -- san -- na fi -- _ li -- o __ _
Da -- vid
be -- ne -- di -- ctus qui ve -- nit in no -- mi -- ne Do -- _ _ _ _ mi -- ni,
be -- _ ne -- _ di -- ctus qui ve -- _ _ _ _ nit
in no -- mi -- ne,
in no -- mi -- ne Do -- _ mi -- ni,
in no -- mi -- ne Do -- _ _ _ _ _ _ _ _ _ mi -- ni.
}

textotenor=\lyricmode{
Pu -- e -- ri __ _ he -- bræ -- o -- rum,
he -- _ _ _ _ _ bræ -- o -- _ _ _ _ _ _ _ _ _ _ rum
he -- _ bræ -- o -- rum,
he -- _ _ _ _ _ bræ -- o -- _ _ _ _ _ _ _ _ _ rum,
ve -- sti -- men -- ta pro -- ster -- ne -- bant,
pro -- ster -- ne -- bant in __ _ _ _ _ 
vi -- _ a,
in vi -- _ _ _ a,
et cla -- ma -- bant di -- cen -- _ _ tes 
et _ cla -- ma -- bant di -- cen -- _ _ tes _
et _ cla -- ma -- bant di -- cen -- _ _ _ _ tes:
ho -- san -- na
fi -- li -- o __ _ _ _ Da -- vid,
be -- _ ne -- di -- ctus qui ve -- nit 
in no -- mi -- ne,
in no -- mi -- ne Do -- _ _ _ _ _ mi -- ni,
be -- ne -- di -- _ _ _ _ _ _ ctus qui ve -- _ _ _ _ _ _ _ _ _ nit
in no -- mi -- ne,
in no -- mi -- ne Do -- _ _ _ _ mi -- ni,
in no -- mi -- ne Do -- _ _ _ _ _ _ _ _ _ _ _ _ mi -- _ ni.
}

textobassus=\lyricmode{
Pu -- e -- ri __ _
he -- bræ -- o -- _ _ _ _ _ rum,
pu -- e -- ri __ _
he -- bræ -- o -- _ _ _ _ _ rum
ve -- sti -- men -- ta 
pro -- ster -- ne -- bant,
pro -- ster -- ne -- bant in vi -- _ _ _ a
et cla -- ma -- bant di -- cen -- _ _ tes,
di -- cen -- tes
et _  cla -- ma -- bant di -- cen -- _ _ tes,
di -- _ cen -- tes:
ho -- san -- na,
ho -- san -- na fi -- _ li -- o __ _
Da -- vid,
be -- _ ne -- di -- ctus qui ve -- _ _ nit
in no -- mi -- ne
in no -- mi -- ne
Do -- mi -- ni,
be -- ne -- di -- _ _ _ ctus
qui ve -- _ _ _ nit in no -- mi -- ne,
in no -- mi -- ne _
Do -- _ mi -- ni,
in no -- mi -- ne
Do -- _ _ _ _ mi -- ni.
}


incipitcantus=\markup{
	\score{
		{ 
		\set Staff.instrumentName="Cantus "
		\override NoteHead.style = #'neomensural
		\override Rest.style = #'neomensural
		\override Staff.TimeSignature.style = #'neomensural
		\cadenzaOn 
		\clef "petrucci-g"
		\key c \major
		\time 2/2
		c''1.
		} 
	\layout {
		\context {\Voice
			\remove Ligature_bracket_engraver
			\consists Mensural_ligature_engraver
		}
		line-width=\incipitwidth
		indent = 0
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
		\key c \major
		\time 2/2
		f'1.
		} 
	\layout {
		\context {\Voice
			\remove Ligature_bracket_engraver
			\consists Mensural_ligature_engraver
		}
		line-width=\incipitwidth
		indent = 0
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
		c'1.
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
		\key c \major
		\time 2/2
		f1.
		} 
	\layout {
		\context {\Voice
			\remove Ligature_bracket_engraver
			\consists Mensural_ligature_engraver
		}
		line-width=\incipitwidth
		indent = 0
	}
	}
}





\score {\transpose c' c'{
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
	\new Lyrics \lyricsto "v4" {\textobassus }
	>>
	
>>

	}%transpose

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
	indent=3.6\cm
	system-system-spacing =
	#'((basic-distance . 20) (minimum-distance . 0) (padding . 5))
	top-system-spacing = % header
	#'((basic-distance . 8) (minimum-distance . 0) (padding . 0))
	last-bottom-spacing = % footer
	#'((basic-distance . 12) (minimum-distance . 0) (padding . 0))
        markup-system-spacing.padding = #1.5
}
