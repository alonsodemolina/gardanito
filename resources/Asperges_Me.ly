\version "2.18.0"

#(set-default-paper-size "a4")
#(set-global-staff-size 16.5)
#(ly:set-option 'point-and-click #f)
%mobile -s15.0 -i2.4 -ball

italicas=\override LyricText.font-shape = #'italic
rectas=\override LyricText.font-shape = #'upright
ss=\once \set suggestAccidentals = ##t
incipitwidth = 14

htitle="Asperges me"
hcomposer="Victoria"

\header {
	title=\markup{\fontsize #4 "Asperges me"}
	subtitle="Antiphona per annum"
        subsubtitle=" "
	composer="Tomás Luis de Victoria (c.1548-1611)"
	%opus="(-)"
	poet="1592,  1600a"
	copyright=\markup{
		\fill-line {"Transcribed and edited by Nancho Alvarez" \typewriter "http://tomasluisdevictoria.org"}
	}
%	tagline=""
}

\markup{" "}

\score {\transpose c c {
<<
         \new Voice = "canto" {
		 %\set Staff.instrumentName="Tenor "
                 \override Staff.TimeSignature.stencil = #'()
                 \override Stem.transparent = ##t
                 \set Score.timing = ##f
                 \override NoteHead.style = #'neomensural         
                \key g \major \clef "G_8"
                \override LigatureBracket.padding = #0.5
                \[d4 e\] \[g fis e\]
                \[fis % plica hacia arriba a la izda
                g\] a  
                \bar "|" 
                
        
         }
         \new Lyrics \lyricsto "canto" {
                 A -- _ sper -- _ _ ges __ _ me
         }
>>
        }%transpose

\layout {
        line-width=14\cm
        %tablet line-width=12\cm
        indent=5.2\cm
        %tablet indent=4\cm
        ragged-right = ##f
}
}

%tablet \pageBreak

global={\key c \major \time 2/2  \skip 1*20  \bar "||"
}

cantus={
	r2 \[d'' |
	e'' f'' ~ \] |
	f'' e'' |
	d'' r |
%5
	r4 e'' d''2 |
	\[b' cis''\] |
	d''4. c''16 b' a'8 b' c'' d'' |
	e''4 e'' d''2 ~ |
	d'' b' ~ |
%10
	b' r |
	\[g'1 |
	a'\] |
	c''2. b'4 |
	cis'' d''2 cis''4 |
%15
	d''2 r4 d'' |
	e'' e'' f''2 |
	d''4 g''4. f''8 e'' d'' |
	c''4 a' c''4. b'8 |
	a'4 g'2 fis'4 |
%20
	g'\breve*1/2 | 
}

altus={
	\[a'2 b'\] |
	\[c'' a' |
	bes'2.\] a'4 |
	a'2 r4 a' |
%5
	g' e' f'8 g' a'4 ~ |
	a' gis' a'4. \ss g'16 a' |
	bes'4 a' r a' |
	\set Staff.autoBeaming = ##f
	g'8 e' g'4 fis' g' ~ |
	\set Staff.autoBeaming = ##t
	g' fis' g' \[d' ~ |
%10
	d' e'2\] f'4 ~ |
	f' e'8 d' e' f' g' e' |
	fis'4 g'2 fis'4 |
	g'2 r4 d' |
	a'2. a'4 |
%15
	fis'2 r |
	g' a'4 a' |
	b'!2 g' |
	a'2. g'4 |
	f'8 e' d' c' d'2 |
%20
	d'\breve*1/2 |
}

tenor={
	\[d'2 g'4.\] f'8 |
	g'4 a'4. g'8 f' e' |
	d'2. cis'4 |
	d'8 e' f' d' e'2 ~ |
%5
	e' r |
	r4 e' e' a |
	r d' c' a |
	c'2. b4 |
	a2 g |
%10
	R1*4/4 |
	R1*4/4 |
	r2 r4 d' |
	e'8 f' g' e' fis'4 g' ~ |
	g' f' e' e' |
%15
	d' a b b |
	c'2 a4 d' ~ |
	d'8 c' b a b4 c' |
	c'2 a4 c' ~ |
	c' b a2 |
%20
	g\breve*1/2 |
}

bassus={
	r2 \[g |
	c'\] d'4. c'8 |
	bes a bes4 g a |
	d d' c' a |
%5
	c'2 d' |
	e' a4 a |
	g d f2 |
	c d ~ |
	d g |
%10
	\[g a\] |
	c'4.  b8[ c' d'] e'4 |
	d' c' d' d' |
	c'4. b8 a4 g |
	a2. a4 |
%15
	d2 g |
	c4 c f d |
	g4. f8 e4 c |
	f2. e4 |
	f g d2 |
%20
	g\breve*1/2 |
}

textocantus=\lyricmode{
Do -- _ _ _ mi -- ne 
hys -- so -- po __ _ % Ysopo
et __ _ _ _ _ _ _ _ mun -- da -- _ bor: _
la -- _ va -- _ _ _ bis me
et su -- per ni -- vem de -- _ _ _ _ al -- ba -- _ _ _ _ bor.
}

textoaltus=\lyricmode{
Do -- _ _ _ _ mi -- ne
hys -- so -- po et __ _ _ _ mun -- da -- _ _ _ bor
hys -- so -- po,
et mun -- da -- _ _ bor:
la -- _ _ va -- _ _ _ _ _ _ _ _ _ bis me
la -- va -- bis me
et su -- per ni -- vem
de -- al -- ba -- _ _ _ _ bor.
}

textotenor=\lyricmode{
Do -- _ _ _ _ _ _ _ _ mi -- ne __ _ _ _ _ _ 
hys -- so -- po
hys -- so -- po
et mun -- da -- bor:
la -- va -- _ _ _ _ _ _ _ _ bis me,
et su -- per ni -- vem de -- _ _ _ _ _ al -- ba -- bor,
de -- _ al -- ba -- bor.
}

textobassus=\lyricmode{
Do -- _ _ _ _ _ _ mi -- _ ne,
hys -- so -- po
et mun -- da -- bor,
hys -- so -- po
et mun -- da -- _ bor:
la -- _ va -- _ _ _ _ _ bis me,
la -- va -- _ _ _ _ bis me,
et su -- per ni -- vem de -- _ _ al -- ba -- _ _ _ _ bor.
}



incipitcantus=\markup{
	\score{
		{ 
		\set Staff.instrumentName="C "
		\override NoteHead.style = #'neomensural
		\override Rest.style = #'neomensural
		\override Staff.TimeSignature.style = #'neomensural
		\cadenzaOn 
		\clef "petrucci-g"
		\key c \major
		\time 4/4
		\[d''1*1/2 e'' f''\breve*1/2\]
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
		\set Staff.instrumentName="A "
		\override NoteHead.style = #'neomensural 
		\override Rest.style = #'neomensural
		\override Staff.TimeSignature.style = #'neomensural
		\cadenzaOn 
		\clef "petrucci-c2"
		\key c \major
		\time 4/4
		\[a'1 b'\]
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
		\set Staff.instrumentName="T "
		\override NoteHead.style = #'neomensural 
		\override Rest.style = #'neomensural
		\override Staff.TimeSignature.style = #'neomensural
		\cadenzaOn 
		\clef "petrucci-c3"
		\key c \major
		\time 4/4
		\[d'1*2 g'\] % con el sol ennegrecido
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
		\set Staff.instrumentName="B "
		\override NoteHead.style = #'neomensural 
		\override Rest.style = #'neomensural
		\override Staff.TimeSignature.style = #'neomensural
		\cadenzaOn 
		\clef "petrucci-c4"
		\key c \major
		\time 4/4
		\[g1 c'\]
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
		\clef "treble" 
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
                %\override LyricText.font-size = #1.2
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


%\midi {}

}

\pageBreak

\score {\transpose c c {
<<
         \new Voice = "canto" {
		 %\set Staff.instrumentName="Tenor "
                 \override Staff.TimeSignature.stencil = #'()
                 \override Stem.transparent = ##t
                 \set Score.timing = ##f
                 \override NoteHead.style = #'neomensural         
                \key g \major \clef "G_8"
                \override LigatureBracket.padding = #0.5
                \[d4 g fis\] \[g a\] a a \[a c'\] b \[b a\] \[a b\]   \bar "|" 
                % todas las ligaduras excepto la primera, empiezan con una plica hacia arriba
         }
         \new Lyrics \lyricsto "canto" {
                Mi -- _ _ se -- _ re -- re me -- _ i De -- _ us __ _ 
         }
>>
        }%transpose

\layout {
        line-width=15\cm 
        indent=4\cm
        %tablet indent = 2\cm
        ragged-right = ##f
}
}

%tablet \pageBreak

global={
\override Staff.TimeSignature.stencil = #'()
\set Score.currentBarNumber = #21
\key c \major \time 2/2  \skip 1*8 \bar "||"
}

cantus={
        \bar ""
	e''2 fis''4 fis'' |
	g''2. fis''4 |
	g''2 f'' ~ |
	f'' r4 c'' |
%25
	c'' d'' e'' c'' |
	d''2 e''4. d''8 |
	c'' b' a' g' a'4 g' ~ |
	g' fis' g'\breve*1/4 | 
}

altus={
	r4 a' a' a' |
	g'4. a'8 bes'4 a' |
	bes'2 a'4 a' |
	a' b' c''4. b'8 |
%25
	a'4 d' g' a' |
	a' b' c'' g' |
	a' f'4. e'8 d' c' |
	d'2 d'\breve*1/4 |
}

tenor={
	\[cis'2 d'\] |
	b4 cis' d'2 |
	d'4 d' d' d' |
	\[d'2 e'\] |
%25
	\[f' e'\] | % es muy pequeña la plica de esta ligadura
	d' c' |
	c'2. b4 |
	a2 g\breve*1/4 |
}

bassus={
	a2 d4 d |
	e2 d4 d' |
	g g d2 |
	d r4 a |
%25
	a b c'8 b a g |
	f4 g c2 |
	f4. e8 d2 ~ |
	d g\breve*1/4 |
}

textocantus=\lyricmode{
Se -- cun -- dum ma -- _ _ gnam _
mi -- se -- ri -- cor -- di -- am tu -- _ _ _ _ _ _ _ _ _ am.
}

textoaltus=\lyricmode{
Se -- cun -- dum ma -- _ _ _ _ gnam mi -- se -- ri -- cor -- _ _ di -- am,
mi -- se -- ri --  cor -- di -- am 
tu -- _ _ _ _ am.
}

textotenor=\lyricmode{
Se -- _ cun -- dum ma -- gnam mi -- se -- ri -- cor -- _ _ _ di -- am tu -- _ _ am.
}

textobassus=\lyricmode{
Se -- cun -- dum ma -- gnam,
se -- cun -- dum ma -- gnam mi -- se -- ri -- cor -- _ _ _ _ di -- am tu -- _ _ _ am.
}



\score {\transpose c' g{
\new ChoirStaff<<

	\new Staff <<\global
	\new Voice="v1" {
		%\set Staff.instrumentName="C"
		\clef "treble"
		\cantus }
	\new Lyrics \lyricsto "v1" {\textocantus }
	>>

	
	\new Staff << \global
	\new Voice="v2" {
		%\set Staff.instrumentName="A"
		\clef "treble" 
		\altus}
	\new Lyrics \lyricsto "v2" {\textoaltus }
	>>

	
	\new Staff <<\global
	\new Voice="v3" {
		%\set Staff.instrumentName="T"
		\clef "G_8"
		\tenor }
	\new Lyrics \lyricsto "v3" {\textotenor }
	>>
	
		
	\new Staff <<\global
	\new Voice="v4" {
		%\set Staff.instrumentName="B"
		\clef "bass" 
		\bassus }
	\new Lyrics \lyricsto "v4" {\textobassus }
	>>
	
>>

	}%transpose

\layout{ 
        indent=0
        system-count = 1
        \context {\Lyrics 
                \override VerticalAxisGroup.staff-affinity = #UP
                \override VerticalAxisGroup.nonstaff-relatedstaff-spacing =
                        #'((basic-distance . 0) (minimum-distance . 0) (padding . 1))
                %\override LyricText.font-size = #1.2
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
                %\consists Ambitus_engraver 
                \override LigatureBracket.padding = #1
        }
}


%\midi {}

}

\markup{" "} %notablet

%tablet \pageBreak

\score {\transpose c c {
<<
         \new Voice = "canto" {
		 %\set Staff.instrumentName="Tenor "
                 \override Staff.TimeSignature.stencil = #'()
                 \override Stem.transparent = ##t
                 \set Score.timing = ##f
                 \override NoteHead.style = #'neomensural         
                \key g \major \clef "G_8"
                \override LigatureBracket.padding = #0.5
                \[d4 g fis\] \[g a\] a a a a a a a \bar "|"
                a a \[a b c'\] b b \[b a\] \[a b\] \bar "|" 
                % todas las ligaduras excepto las dos últimas empiezan con una plica hacia arriba
         }
         \new Lyrics \lyricsto "canto" {
               Glo -- _ _ ri -- _ a Pa -- tri
               et Fi -- li -- o
               et Spi -- ri -- _ _ tu -- i San -- _ cto __ _ 
         }
>>
        }%transpose

\layout {
        line-width=17\cm %notablet
        indent=2\cm
        %tablet indent = 1\cm
        ragged-right = ##f
}
}

%tablet \pageBreak

global={
\override Staff.TimeSignature.stencil = #'()
\set Score.currentBarNumber = #29
\key c \major \time 2/2  \skip 1*16 \bar "|."

}

cantus={
        \bar ""
	r2 \[cis'' |
%30
	d''\] b'4 cis'' |
	d''2 d'' |
	r d''4. d''8 |
	d''4 d'' d'' d'' | 
	f''2 e''4 e'' ~ |
%35
	e'' d'' e''2 ~ |
	e'' r4 e'' |
	fis''2 g'' ~ |
	g''4 fis'' g'' g'' |
	f''1 |
%40
	r4 c''2 d''4 |
	e'' c'' \[d''2 |
	e''4.\] d''8[ c'' b' a' g'] |
	a'4 g'2 fis'4 |
	g'\breve*1/2
        \override Score.RehearsalMark #'self-alignment-X = #right
        \mark \markup{\smaller "[Asperges me ut supra]"}
        % On Passion Sunday and Palm Sunday, the Glória Patri is not said, but
        % the Antiphon Asperges me is repeated immediately after the Psalm.
}

altus={
	e'2 a' |
%30
	a' g'4 g' ~ |
	g' fis' g' g' |
	c' c''2 b'4 |
	b' a' b'4. a'16 g' |
	a'4 a' c'' b' |
%35
	a'2. gis'4 |
	a'2 r4 a' ~ |
	a' a' g'4. a'8 |
	bes'4 a' bes' bes' |
	a' a'2 b'4 |
%40
	c''4. b'8 a'4 d' |
	g' a'2 b'4 |
	c'' g' a' f' ~ |
	f'8 e' d' c' d'2 |
	d'\breve*1/2 % 1592 b, 1600a d' (en el libro de Tudela está corregido a d')
}

tenor={
	r2 e' |
%30
	fis' g' |
	a' r4 g' ~ |
	g' fis' g' g' |
	\set Staff.autoBeaming = ##f
	d' d'8 d' d'4 d' |
	\set Staff.autoBeaming = ##t
	d'2 r4 e' |
%35
	c' a c' b |
	a2 \[cis' |
	d'\] b4 cis' |
	d'2. d'4 |
	d' d' \[d'2 |
%40
	e'\] \[f' |
	e'\] d' |
	c' c' ~ |
	c'4 b a2 |
	g\breve*1/2
}

bassus={
	r2 a |
%30
	d' e' |
	d'4 d g2 |
	a g4 g ~ |
	g fis g g |
	d d a gis |
%35
	a f e2 |
	r a |
	d e4 e |
	\set Staff.autoBeaming = ##f
	d d'8 d' g4 g |
	\set Staff.autoBeaming = ##t
	d1 |
%40
	r4 a2 b4 |
	c'8 b a g f4 g |
	\[c2 f4.\] e8 |
	d1 |
	g\breve*1/2
}

textocantus=\lyricmode{
Sic -- _ _ ut e -- rat
in prin -- ci -- pi -- o,
et nunc
et sem -- _ _ per _
et in sæ -- _ _ _ cu -- la
sæ -- cu -- lo -- rum.
A -- _ _ _ _ _ _ _ _ _ men.
}

textoaltus=\lyricmode{
Sic -- ut e -- rat in _ prin -- ci -- pi -- o,
in prin -- ci -- pi -- o, __ _ _ _ 
et nunc et sem -- _ per
et _ in sæ -- _ _ _ _ cu -- la 
sæ -- cu -- lo -- rum.
A -- _ men,
sæ -- cu -- lo -- rum. 
A -- _ _ _ _ _ _ men.
}

textotenor=\lyricmode{
Sic -- ut e -- rat
in _ prin -- ci -- pi -- o,
in prin -- ci -- pi -- o
et nunc
et sem -- _ per,
et __ _ in __ _ sæ -- cu -- la sæ -- cu -- _ lo -- _ _ rum.
A -- _ _ _ men.
}

textobassus=\lyricmode{
Sic -- ut e -- rat,
sic -- ut e -- rat in _ prin -- ci -- pi -- o,
et nunc
et sem -- _ per
et in sæ -- cu -- la,
et in sæ -- cu -- la
sæ -- cu -- lo -- _ _ _ _ rum.
A -- _ _ _ men.
}



\score {\transpose c' g{
\new ChoirStaff<<

	\new Staff <<\global
	\new Voice="v1" {
		%\set Staff.instrumentName="C"
		\clef "treble"
		\cantus }
	\new Lyrics \lyricsto "v1" {\textocantus }
	>>

	
	\new Staff << \global
	\new Voice="v2" {
		%\set Staff.instrumentName="A"
		\clef "treble" 
		\altus}
	\new Lyrics \lyricsto "v2" {\textoaltus }
	>>

	
	\new Staff <<\global
	\new Voice="v3" {
		%\set Staff.instrumentName="T"
		\clef "G_8"
		\tenor }
	\new Lyrics \lyricsto "v3" {\textotenor }
	>>
	
		
	\new Staff <<\global
	\new Voice="v4" {
		%\set Staff.instrumentName="B"
		\clef "bass" 
		\bassus }
	\new Lyrics \lyricsto "v4" {\textobassus }
	>>
	
>>

	}%transpose

\layout{ 
        indent=0
        \context {\Lyrics 
                \override VerticalAxisGroup.staff-affinity = #UP
                \override VerticalAxisGroup.nonstaff-relatedstaff-spacing =
                        #'((basic-distance . 0) (minimum-distance . 0) (padding . 1))
                %\override LyricText.font-size = #1.2
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
                %\consists Ambitus_engraver 
                \override LigatureBracket.padding = #1
        }
}


%\midi {}

}


\paper{
        evenHeaderMarkup=\markup  \fill-line { \fromproperty #'page:page-number-string \htitle \hcomposer }
        oddHeaderMarkup= \markup  \fill-line { \on-the-fly #not-first-page \hcomposer \on-the-fly #not-first-page \htitle \on-the-fly #not-first-page \fromproperty #'page:page-number-string }
        %system-count=20
        %page-count = 8
        ragged-last-bottom = ##f
        indent=2.5\cm
        system-system-spacing =
        #'((basic-distance . 20) (minimum-distance . 0) (padding . 5))
        top-system-spacing = % header
        #'((basic-distance . 10) (minimum-distance . 0) (padding . 0))
        last-bottom-spacing = % footer
        #'((basic-distance . 12) (minimum-distance . 0) (padding . 0))

}
