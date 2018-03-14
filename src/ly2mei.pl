#!/usr/bin/perl

# The functionality of this file is to be rewritten in python

my $textocabecera= <<'END_MESSAGE';
<?xml version="1.0" encoding="UTF-8"?>
<mei>
  <meiHead>
    <!-- metadata goes here -->
  </meiHead>
  <music>
    <front>
      <!-- front matter of text, if any, goes here -->
    </front>
    <body>
      <mdiv>
        <score>
          <scoreDef meter.count="2" meter.sym="common" meter.unit="2">
            <staffGrp n="1" symbol="bracket">
              <staffDef n="1" clef.line="2" clef.shape="G" key.mode="major" key.sig="0" label="Cantus" label.abbr="C" lines="5"/>
              <staffDef n="2" clef.dis="8" clef.dis.place="below" clef.line="2" clef.shape="G" key.mode="major" key.sig="0" label="Altus" label.abbr="A" lines="5"/>
              <staffDef n="3" clef.dis="8" clef.dis.place="below" clef.line="2" clef.shape="G" key.mode="major" key.sig="0" label="Tenor" label.abbr="T" lines="5"/>
              <staffDef n="4" clef.line="4" clef.shape="F" key.mode="major" key.sig="0" label="Bassus" label.abbr="B" lines="5"/>
            </staffGrp>
          </scoreDef>
          <section>
END_MESSAGE
print $textocabecera;

my $nvoces=4;

my @voces=(

[qw/\ss g'1 ~ g'1 a' a'2 a'4 a' a'4. b'8 c''2 d''2. d''4 g' c''4. b'8 a' g' a'4 g'2 fis'4 g'2 g'2 ~ g' r2 r4 c' f' g' a'8 g' a' b' c''4. b'8 a'4 g'8 f' e'4. d'16 c' d'2 e'4 e' g'2 r4 g' c''2. b'4 c''4. b'8 a' g' g'4 ~ g' fis' g'2 ~ g' r2 c''1 b'2 a' ~ a' g' a'1 b'2 c''2 ~ c'' b' c'' a' g'1 g'2 r r1 r4 b'4 g'4. a'8 b'4 g' a'2 g' a' b'4 b' c''4. b'8 a'4 g' fis' g' ~ g' fis' g'2 ~ g' r2 r2 d''2 ~ d'' c'' b' a' ~ a'4 g'8 f' g' e' f'4 ~ f'8 e' e' d'16 c' d'4. e'8 f'2 g' r2 c''2 ~ c'' b' a'2 g'4. f'8 e'4 d'8 c' d'2 c'2 r4 g'4 a'2 b' c''4 a'2 g'4 ~ g' fis' g' g' e' fis' g' e' d' d'' b' cis'' d''2. c''4 b' a'4. g'8 g'4 ~ g' fis'8 e' fis'4 fis' g'1 ~ g'1 ~ g' ~ g'1/],
[qw/d'1 e' f' f'2 f'4 f' f'4. g'8 a'4 g' f'2. f'4 e'2 a4. b8 c'[ d'] e'4. d'8 c'4 ~ c' b e'2 ~ e' d' r2 r4 c'4 f'2. e'4 f'4 d'4. c'8 c'4 ~ c'4 b c' g c'4 d'4 e'4. d'8 c'4 a d'2 g4 c' e' e' d'2 b4 g8 a b c' d'4. e'8 f'4 e'4 a8 b c' d' e' f' g'4 d'8 e' f' g' a'4 e' c'8 d' e' f' g'4 c'2 f' d'4 g'2 fis'8 e' fis'2 g' e' f' e'4 d'8 c' d'2 e'4 e' d'4. e'8 c'4 d' e'2 d'4 d' e'4. c'8 d'4 e' f'4. d'8 e' f' g'2 fis'4 g' d' e'2 ~ e'4 e' d' cis' d'2 b r4 d'2 c'4 ~ c' b2 a4 ~ a8 g g2 fis4 g4 g'2 f'4 ~ f'4 e'2 d'4 ~ d'8 c' c'2 b4 a2 g4 g'4 ~ g' f'2 e'8 d' c'4 a d'4. e'8 f'4 e'4. d'8 d'4 ~ d'8 c' c'2 b8 a g4 a b2 r1 r4 d'4 b b c' a d'2 r4 d'4 d' c' b a g g' g' fis' g'2 ~ g'4 f'8[ e'] d'4 e' d'2 r4 d'4 b c' d'4. b8 d'4 e'4. c'8 d'4 e'4 e' d'2 ~ d'1/],
[qw/g1 c' ~ c' d'2 d'4 d' c'4. b8 a4 c' ~ c' b8 a b4 b c'2 r4 c'4 a b c'2 d' c'4 g c'2. b4 c'4. b8 a4 g f2 g4 c f g a2 g1 r4 d4 g2 ~ g4 fis g2 e4 g c' c' b a g8 a b c' d'4 d8 e f g a b c' d' e'4 a g ~ g8 a b c' d'4 a8 b c' d' e'4. d'16 c' b4 a4 c'2 d'4 ~ d' e'4. d'8 c' b c'2 d'4 e'4 ~ e' c'2 d'4 ~ d'8 c' c'2 b4 c'4 c' b4. g8 a4 b c'2 b4 g c'4. a8 g4 c' f8 g a b c' d' e'4 d'2 g r4 g c'4. b8 a4 g a2 g4 d' ~ d'8 c' b4 a2 g4 g2 f8 e d2 e4 c d2 d' c'2. bes4 a2 g4 d' ~ d' c'2 b4 ~ b a4. g8 g4 ~ g fis g8 a b c' d'4 c'4. b8 g4 a2 g2 r2 r4 g4 e fis g8 f e d c4 d e g a2 b c'4 a4. g8 g4 ~ g fis g g4 a d' b c' d'2. c'4 b4 a8 g a4 a g2 r4 d' b c' e' d' ~ d'8 c' c'2 b8 a b1/],
[qw/R1 c f d2 d4 d f2. e4 d2. d4 c2 f2 ~ f4 e4 a2 g2 c2 r4 c f g a4. g8 f4 e d2 c R1 r4 g c2 ~ c4 b, c4. b,8 a,2 g,4 g, c2. c4 d2 g,4 g, ~ g,8 a, b, c d2 a,4 a,4. b,8 c d e f g4 d8 e f g a4 a4 e2 f1 g2 a ~ a g a f g1 c4 c g4. e8 f4 d c2 g2 r R1*2 r4 g4 c2 ~ c4 c d e d2 g, g f e d4. c8 b,2 a, g, r2 R1 r2 g f e d c4. b,8 a,2 g, R1 r2 r4 g e f g8 f e d c4 d g, g e fis g8 f e d c4 d g,2 r4 d b, c d2 e d r r4 d b, c d2. d4 g, c b, g, g8 f e d c4 b, c c g,2 ~ g,1/]
);

my @letras=(
[qw/O __ _ _ quam glo -- ri -- o -- _ _ _ sum est re -- _ _ _ _ _ _ _ gnum _ in quo cum Chri -- _ _ _ _ _ _ _ _ _ _ _ _ sto, in quo in quo cum Chri -- _ _ _ _ _ _ sto _ gau -- dent, gau -- _ dent om -- nes san -- _ cti, om -- nes san -- cti! a -- mi -- cti sto -- lis al -- _ _ bis, a -- mi -- cti sto -- lis al -- _ _ _ bis _ se -- _ quun -- tur a -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ gnum se -- _ quun -- tur a -- _ _ _ _ _ gnum quo -- cum -- que i -- _ _ _ e -- rit, quo -- cum -- que i -- e -- rit, quo -- cum -- que i -- _ _ _ _ _ _ _ _ _ e -- rit. _ _ _/],
[qw/O __ _ _ quam glo -- ri -- o -- _ _ _ _ sum est re -- _ _ _ _ _ _ _ _ _ _ gnum in quo cum Chri -- _ _ _ _ _ sto, in quo cum Chri -- _ _ _ _ sto, \italicas in quo cum Chri -- sto \rectas gau -- _ _ _ _ _ _ dent, gau -- _ _ _ _ _ _ _ _ _ _ _ dent, gau -- _ _ _ _ dent om -- nes san -- _ _ _ cti, om -- nes san -- _ _ _ cti! a -- mi -- cti sto -- lis al -- bis, a -- mi -- cti sto -- lis al -- _ _ _ _ _ bis, \italicas a -- mi -- _ cti sto -- lis al -- bis \rectas se -- quun -- _ tur a -- _ _ _ _ gnum, se -- quun -- _ tur a -- _ _ _ _ _ gnum, se -- _ quun -- _ _ _ tur a -- _ _ _ _ _ _ _ _ _ _ _ _ gnum quo -- cum -- que i -- e -- rit \italicas quo -- cum -- que i -- e -- rit, \rectas quo -- cum -- que i -- _ _ _ _ e -- rit quo -- cum -- que i -- _ _ _ _ _ _ e -- rit. _/],
[qw/O __ _ _ quam glo -- ri -- o -- _ _ _ _ _ _ _ sum est re -- _ _ _ _ gnum, in quo cum Chri -- _ _ _ _ sto, in quo cum Chri -- sto \italicas in quo _ cum Chri -- sto, \rectas in quo cum Chri -- _ sto __ _ _ _ _ gau -- _ _ _ _ _ _ _ _ dent, gau -- _ _ _ _ _ _ _ _ _ _ _ _ _ dent om -- nes _ san -- _ _ _ _ cti, om -- _ nes san -- _ _ _ _ cti! a -- mi -- cti sto -- lis al -- bis, a -- mi -- cti sto -- lis al -- _ _ _ _ _ _ _ bis a -- mi -- cti sto -- lis al -- bis, se -- _ _ _ quun -- tur a -- _ _ _ _ _ gnum, se -- quun -- tur a -- gnum, se -- _ quun -- tur _ a -- _ _ _ _ _ _ _ _ _ _ _ _ _ gnum quo -- cum -- que i -- _ _ _ _ e -- rit, quo -- cum -- que i -- _ _ _ _ _ _ e -- rit, quo -- cum -- que i -- _ _ _ _ _ e -- rit quo -- cum -- que i -- _ _ _ _ e -- _ rit./],
[qw/O __ _ quam glo -- ri -- o -- _ _ sum est re -- _ _ _ _ gnum in quo cum Chri -- _ _ _ _ sto in quo _ cum Chri -- _ _ sto, \italicas in quo cum Chri -- sto \rectas gau -- _ _ _ _ _ dent, gau -- _ _ _ _ _ _ dent, __ _ _ _ _ gau -- dent om -- nes san -- _ cti, om -- nes san -- cti! a -- mi -- cti sto -- lis al -- bis a -- mi -- _ cti sto -- lis al -- bis, se -- quun -- tur a -- _ _ _ gnum se -- quun -- tur a -- _ _ _ gnum quo -- cum -- que i -- _ _ _ _ e -- rit, quo -- cum -- que i -- _ _ _ _ e -- rit quo -- cum -- que i -- e -- rit quo -- cum -- que i -- e -- rit, quo -- cum -- que i -- _ _ _ _ _ _ e -- rit. _/]
);

my $haycompases=1;
my $compas=1;

my @dur=(4,4,4,4);
my @dots=(0,0,0,0);
my @tie=("","","","");
my @italicas=("normal", "normal", "normal", "normal");
my $tie=0;
my $wordpos="i";
my $con="s";

while ($haycompases) {
	print "            <measure n=\"$compas\">\n";
	my $duracumulada=0;
	for (my $voz=0; $voz<$nvoces; $voz++) {
		my $haynotas=1;
		print "              <staff n=\"@{[$voz+1]}\">\n";
		print "                <layer>\n";
		while ($haynotas) {
			my $lilynote=shift @{$voces[$voz]};
			if ($lilynote eq "\\ss") {
				$lilynote=shift @{$voces[$voz]};
			}

			$oldtie=0;
			$newtie=0;
			$oldtie=1 if (($tie[$voz] eq "i") or ($tie[$voz] eq "m"));
			$newtie=1 if ($voces[$voz][0] eq "~");
			if ($newtie) {
				shift @{$voces[$voz]};
				$tie[$voz]="i";
				$tie[$voz]="m" if ($oldtie);
			} else {
				$tie[$voz]="";
				$tie[$voz]="t" if ($oldtie);
			}
			$lilynote =~ /([a-zR]+)([,']*)[!?]?([0-9]*)(\.*)/;
			$pname=substr ($1, 0, 1);
			$alteracion=substr($1,1);
			$accid="";
			$accid="f" if ($alteracion eq "es");
			$accid="s" if ($alteracion eq "is");
			if ($3 ne "") {
				$dur[$voz]=$3;
				$dots[$voz]=length $4;
			}
			my $comas=$2;
			my $l=length $comas;
			if ($comas eq "") {
				$oct=3;
			} else {
				my $comaocomilla=substr ($comas, 0, 1);
				if ($comaocomilla eq ",") { $oct = 3 - $l; }
				if ($comaocomilla eq "'") { $oct = 3 + $l; }
			}
			if ($pname eq "R") {
					print "                  <mRest/>\n";
					my $repeticiones=1;
					if ($lilynote =~ /R.*\*([0-9])$/) {
						$repeticiones=$1;
					}
					for (my $i=1; $i < $repeticiones; $i++) {
						unshift (@{$voces[$voz]}, "R");
					}
				$haynotas=0;
				$duracumulada=0;
			} elsif ($pname eq "r") {
				print "                  <rest dur=\"$dur[$voz]\"";
				print " dots=\"$dots[$voz]\"" if ($dots[$voz] != 0); 
				print "/>\n";
				my $potencia=2**$dots[$voz];
				$duracumulada += (2*$potencia-1)/($dur[$voz]*$potencia);
				if ($duracumulada>.9999) {
					$haynotas=0;
					$duracumulada=0;
				}
			} else {
				print "                  <note dur=\"$dur[$voz]\" ";
				print "dots=\"$dots[$voz]\" " if ($dots[$voz] != 0); 
				print "oct=\"$oct\" pname=\"$pname\"";
				print " accid=\"$accid\"" if ($accid ne "");
				print " tie=\"$tie[$voz]\"" if ($tie[$voz] ne "");
				print ">\n";
				$silaba=shift @{$letras[$voz]};
				if ($silaba eq "\\italicas") {
					$italicas[$voz]="italic";
					$silaba=shift @{$letras[$voz]};
				}
				if ($silaba eq "\\rectas") {
					$italicas[$voz]="normal";
					$silaba=shift @{$letras[$voz]};
				}
				my $aux=shift @{$letras[$voz]};
				if ($aux eq "--") {
					$wordpos="i";
					$con="d";
				}
				elsif ($aux eq "__") {
					$wordpos="t";
					$con="u";
				}
				elsif ($aux eq "_") {
					unshift (@{$letras[$voz]}, $aux);
				}
				else {
					unshift (@{$letras[$voz]}, $aux);
				}
				if ($silaba ne "_") {
					print "                    <verse>\n";
					print "                      <syl wordpos=\"$wordpos\"";
					print " con=\"$con\" fontstyle=\"$italicas[$voz]\"";
					print ">$silaba</syl>\n";
					print "                    </verse>\n";
				}
				print "                  </note>\n";
				my $potencia=2**$dots[$voz];
				$duracumulada += (2*$potencia-1)/($dur[$voz]*$potencia);
				if ($duracumulada>.9999) {
					$haynotas=0;
					$duracumulada=0;
				}
			}
		}
		print "                </layer>\n";
		print "              </staff>\n";
}
print "            </measure>\n";
$compas++;
if ($compas==7) {$haynotas=0; }
if ($voces[0][0] eq "") {
	$haycompases=0;
}
}


my $textofinal= <<'END_MESSAGE';
          </section>
        </score>
        <parts>
          <!-- markup of performers’ parts goes here -->
        </parts>
      </mdiv>
      <!-- additional movements go here -->
    </body>
    <back>
      <!-- back matter of text, if any, goes here -->
    </back>
  </music>
</mei>
END_MESSAGE

print $textofinal;


