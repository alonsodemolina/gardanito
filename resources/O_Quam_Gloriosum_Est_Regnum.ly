\version "2.18.0"

#(set-default-paper-size "a4")
#(set-global-staff-size 16.6)
#(ly:set-option 'point-and-click #f)
%mobile -s15.5 -i3.4

italicas=\override LyricText.font-shape = #'italic
rectas=\override LyricText.font-shape = #'upright
ss=\once \set suggestAccidentals = ##t
incipitwidth = 20

htitle="O quam gloriosum"
hcomposer="Victoria"

\header {
	title=\markup{\fontsize #4 "O quam gloriosum est regnum"}
	subtitle="in festo Omnium Sanctorum"
	subsubtitle =\markup{\vspace #2 }
	composer="Tomás Luis de Victoria (c.1548-1611)"
	%opus="(-)"
	%poet="1572,  1583b,  1585b,  1589a,  1589b,  1603"
	poet="1572,  1583b...,  1585b"
	copyright=\markup{
		\fill-line {"Transcribed and edited by Nancho Alvarez" \typewriter "http://tomasluisdevictoria.org"}
	}
%	tagline=""
}

global =  {\time  2/2 \key c \major  \skip 1*59 \bar "|."}

cantus =  \relative c''{
\[g1  ~g  a \]
a2 a4 a a4. b8 \[c2 d2.\] d4 g, c4.  b8[ a g] a4 g2 fis4 g2 g2~g r2 r4 c, f g  a8[ g a b] c4. b8 a4  g8[ f] e4.  d16[ c] d2 e4 e %\break
g2 r4 g c2. b4 c4.  b8[ a g] g4~ g fis g2 ~ g r2 c1 b2 a~ a g a1 b2 c2~ c b c a g1 g2 r R1
r4 b4 g4. a8 b4 g \[a2 g\] a b4 b c4. b8 a4 g fis g~ g fis g2 ~ g r2 r2 d'2~ d c b a~a4  g8[ f g e] f4~ f8[ e]  e[ d16 c] d4. e8 
%\break
f2 g r2 c2~ c b
a2 g4. f8 e4  d8[ c] d2   c2 r4 g'4 a2 b c4 \[a2 g4 ~ \] g fis g g e fis g e d d' b cis d2. c4 b a4. g8 g4~ g  fis8[ e] fis4 fis g1~g1~g~g\breve*1/2 g'4.
}

altus =  \relative c'{
\[d1 e f\] f2 f4 f f4. g8 a4 g f2. f4 e2 a,4. b8  c[ d] e4. d8 c4~ c b e2~ e d r2 r4 c4 f2. e4 f4 d4. c8 c4~ c4 b c g
c4 d4 e4. d8 c4 a d2 g,4 c e e d2 b4  g8[ a]  b[ c] d4. e8 f4 e4  a,8[ b c d e f] g4  d8[ e f g] a4 e  c8[ d e f] g4 c,2 f d4 g2  fis8[ e] fis2 g e f e4  d8[ c] d2 e4 e d4. e8 c4 d e2
d4 d e4. c8 d4 e f4. d8  e[ f] g2 fis4 g d e2~ e4 e d cis d2 b r4 d2 c4~c b2 a4~ a8[ g] g2 fis4 g4 g'2 f4~f4 e2 d4~ d8[ c] c2 b4 a2 g4 g'4~g f2  e8[ d] c4 a d4. e8
f4 e4. d8 d4~ d8[ c] c2  b8[ a] g4 a b2 R1 r4 d4 b b c a d2 r4 d4 d c b a g g' g fis g2~g4  f8[ e] d4 e d2 r4 d4 b c d4.b8 d4 e4. c8 d4 e4 e d2~d\breve*1/2
 }


tenor =  \relative c'{
\[g1 c ~ \] c d2 d4 d c4. b8 a4 c~c  b8[ a] b4 b c2 r4 c4 a b \[c2 d\] c4 g c2. b4 c4. b8 a4 g f2 g4 c, f g a2 g1
r4 d4 g2~g4 fis g2 e4 g c c b a  g8[ a b c] d4  d,8[ e f g a b]  c[ d] e4 a, g~ g8[ a b c ] d4  a8[ b]  c[ d] e4. d16 c b4 a4 c2 d4~d e4.  d8[ c b] c2 d4 e4~e c2 d4~ d8[ c] c2 b4 c4 c b4. g8 a4 b c2
b4 g c4. a8 g4 c  f,8[ g a b]  c[ d ] e4 d2 g, r4 g c4. b8 a4 g a2 g4 d'~ d8[ c] b4 a2 g4 g2  f8[ e] d2 e4 c d2 d'c2. bes4 a2 g4 d'~d c2 b4~b a4. g8 g4~g fis  g8[ a b c] 
d4 c4. b8 g4 a2 g2 r2 r4 g4 e fis  g8[ \ss f e d] c4 d e  g a2 b c4 a4. g8 g4~g fis g g4 a d b c d2. c4 b4  a8[ g] a4 a g2 r4 d'b c e d~ d8[ c] c2  b8[ a] b\breve*1/2
}


bassus= \relative c{
R1 \[c f\] d2 d4 d f2. e4 d2. d4 c2 f2~f4 e4 \[a2 g2\] c,2 r4 c f g a4. g8 f4 e d2  c R1 r4 g c2~
c4 b c4. b8 a2 g4 g c2. c4 d2 g,4 g~ g8[ a b c] d2 a4 a4.  b8[ c d]  e[ f] g4  d8[ e f g] a4 a4 e2 f1 g2 a~a g a f g1 c,4 c g'4. e8 f4 d c2
g2 r R1 R1 r4 g4 c2~c4 c d e d2 g, g' f e d4.c8 \[b2 a\] g r2 R1 r2 g' f e \[d c4.\] b8 a2 g
R1 r2 r4 g' e f  g8[ f e d] c4 d g, g' e fis  g8[ \ss f e d] c4 d g,2 r4 d' b c d2 e d r r4 d b c d2. d4 g, c b g  g'8[ f e d] c4 b c c g2~g\breve*1/2
}


textocantus = \lyricmode {
O __ _  _  quam glo -- ri -- o -- _ _ _  sum est re  -- _ _ _ _ _ _ _  gnum _ 
in quo cum Chri -- _ _ _ _ _ _ _ _ _ _ _ _ sto, in quo in quo  cum 
Chri -- _ _ _ _ _ _ sto _ 
gau -- dent, gau -- _ dent om -- nes san -- _ cti, om -- nes 
san -- cti!
a -- mi -- cti sto -- lis al -- _ _ bis, a -- mi -- cti sto -- lis 
al -- _ _ _ bis _  
se -- _ quun -- tur
a -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ gnum  se -- _ quun -- tur a -- _ _ _ _ _ gnum
quo -- cum -- que i -- _ _ _ e -- rit, quo -- cum -- que i -- e -- rit, 
quo -- cum -- que i -- _ _ _ _ _ _ _ _ _ e -- rit. _ _ _
}



textoaltus = \lyricmode {
O __ _ _  quam glo -- ri -- o -- _ _ _ _ sum est re  --  _ _ _ _ _ _ _ _ _ _ gnum
in quo cum Chri -- _ _ _ _ _ sto,   in quo cum Chri -- _ _ _ _ sto,
\italicas
in quo cum Chri -- sto
\rectas
gau -- _ _ _ _ _ _ dent,   gau -- _ _ _ _ _ _ _ _ _ _ _ dent,  gau -- _ _ _ _ 
dent om -- nes san -- _ _ _ cti, om -- nes
san -- _ _ _ cti!
a -- mi -- cti sto -- lis al -- bis, a -- mi -- cti sto -- lis 
al -- _ _ _ _ _ bis,
\italicas
a -- mi -- _ cti sto -- lis al -- bis
\rectas
se -- quun -- _ tur a -- _ _ _ _ gnum, se -- quun -- _ tur a -- _ _ _ _ _ 
gnum, se -- _ quun  -- _ _ _ tur a -- _ _ _ _ _ _ _ _ _ _ _ _ gnum 
quo -- cum -- que i -- e -- rit
\italicas
quo -- cum -- que i -- e -- rit, 
\rectas
quo -- cum -- que i -- _ _ _ _ e -- rit quo -- cum -- que i -- _ _ _ _ _ _ 
e -- rit. _
}


textotenor = \lyricmode {
O __ _ _ quam glo -- ri -- o -- _ _ _ _ _ _ _ sum est re  --  _ _ _ _ gnum, in quo cum 
Chri -- _ _ _ _ sto, in quo  cum Chri -- sto
\italicas
in quo _ cum Chri -- sto,
\rectas
in quo cum   Chri -- _ sto __ _ _ _ _  
gau -- _ _ _ _ _ _ _ _ dent, gau -- _ _ _ _ _ _ _ _ _ _ _ _ _ dent    
om -- nes _ san -- _ _ _ _ cti,
om -- _ nes san -- _ _ _ _ cti! 
a -- mi -- cti sto -- lis al -- bis, a -- mi -- cti sto -- lis al -- _ _ _ _ _ _ _ bis
a -- mi -- cti sto -- lis al -- bis,
se -- _ _ _ quun -- tur
a -- _ _ _ _ _ gnum, se -- quun -- tur a -- gnum, se -- _ quun -- tur _    
a -- _ _ _ _ _ _ _ _ _ _ _ _ _ gnum quo -- cum -- que i -- _ _ _ _ e -- rit, 
quo -- cum -- que i -- _ _ _ _ _ _ e -- rit, 
quo -- cum -- que i -- _ _ _ _ _ e -- rit quo -- cum -- que i -- _ _ _ _ e -- _ rit. 
}


textobassus = \lyricmode {
O __ _ quam glo -- ri -- o -- _ _ sum est re  --  _ _ _ _ gnum 
in quo cum Chri -- _ _ _ _ sto 
in quo _   cum Chri -- _ _ sto, 
\italicas
in quo cum Chri -- sto 
\rectas
gau -- _ _ _ _ _ dent, gau -- _ _ _ _ _ _ dent, __ _ _ _ _ gau -- dent 
om -- nes san -- _ cti,
om -- nes san -- cti! 
a -- mi -- cti sto -- lis al -- bis
a -- mi -- _ cti sto -- lis al -- bis, se -- quun -- tur
a -- _ _ _ gnum se -- quun -- tur a -- _ _ _ gnum 
quo -- cum -- que i -- _ _ _ _ e -- rit, quo -- cum -- que i -- _ _ _ _ e -- rit
quo -- cum -- que i -- e -- rit quo -- cum -- que i -- e -- rit, 
quo  -- cum -- que i -- _ _ _ _ _ _ e -- rit. _
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
		\[g'\longa a'\breve\]
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
		\set Staff.instrumentName="Altus   "
		\override NoteHead.style = #'neomensural 
		\override Rest.style = #'neomensural
		\override Staff.TimeSignature.style = #'neomensural
		\cadenzaOn 
		\clef "petrucci-c3"
		\key c \major
		\time 2/2
		\[d' e' f'\]
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
		\clef "petrucci-c4"
		\key c \major
		\time 2/2
		\[g\breve c'\longa\]
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
		\clef "petrucci-f4"
		\key c \major
		\time 2/2
		\[c\breve f\]
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
	indent=3.5\cm
	system-system-spacing =
	#'((basic-distance . 20) (minimum-distance . 0) (padding . 5))
	top-system-spacing = % header
	#'((basic-distance . 8) (minimum-distance . 0) (padding . 0))
	last-bottom-spacing = % footer
	#'((basic-distance . 12) (minimum-distance . 0) (padding . 0))
        markup-system-spacing.padding = #1.5
}
