---
layout: default
tagline: An experiment — Building a grammar sketch for a conlang-in-progress with Jinja, Python, and Markdown.
permalink: latu.html
---

# *Kitsani Latu’* / The Latu language

This is a conlang-in-progress, and a test of using static site generation 
tools to build a grammar sketch. [Here's a quick word about the technical
side](#wgoh)

<div class="admonition">
<p><b>Nema:</b> <span class='tooltip'>hette kaku’</span><span class='tooltiptext'><span class='tooltipline ipa'>[heʔte kakuʔ]</span> <span class='tooltipline ipa'>/heʔte ka-kuʔ/</span> <span class='tooltipline ipa'>perch-IMP</span> <span class='tooltipline lexentry'><b>Hette ka</b> (from <b>hette</b> <i>sit</i>, <b>ka</b> <i>claw.CL</i>, ) <i>perch</i>.</span></span> <span class='tooltip'>pi</span><span class='tooltiptext'><span class='tooltipline ipa'>/pi/</span> <span class='tooltipline ipa'>on</span> <span class='tooltipline lexentry'><b>Pi</b> <i>on</i>.</span></span> <span class='tooltip'>a’achi</span><span class='tooltiptext'><span class='tooltipline ipa'>[aʔatʃi]</span> <span class='tooltipline ipa'>/aʔat-i/</span> <span class='tooltipline ipa'>word-CON</span> <span class='tooltipline lexentry'><b>A’ata</b> <i>word</i>.</span></span> 
<span class='tooltip'>syisa</span><span class='tooltiptext'><span class='tooltipline ipa'>[sɨisa]</span> <span class='tooltipline ipa'>/sɨi-sa/</span> <span class='tooltipline ipa'>have-POS.SUBJ</span> <span class='tooltipline lexentry'><b>Syi</b> <i>have</i>.</span></span> <span class='tooltip'>chihjiniai</span><span class='tooltiptext'><span class='tooltipline ipa'>[tʃihdʒinjai]</span> <span class='tooltipline ipa'>/tihdinja-i/</span> <span class='tooltipline ipa'>line-CON</span> <span class='tooltipline lexentry'><b>Chihjinia</b> <i>line</i>.</span></span> <span class='tooltip'>shihlihte</span><span class='tooltiptext'><span class='tooltipline ipa'>[ʃiɬːihte]</span> <span class='tooltipline ipa'>/sihlihte/</span> <span class='tooltipline ipa'>dot.INDEF</span> <span class='tooltipline lexentry'><b>Shihlihte</b> <i>dot</i>.</span></span> <span class='tooltip'>whētō</span><span class='tooltiptext'><span class='tooltipline ipa'>/ʍeːtoː/</span> <span class='tooltipline ipa'>below</span> <span class='tooltipline lexentry'><b>Whētō</b> <i>below</i>.</span></span>  
<span class='tooltip'>’e</span><span class='tooltiptext'><span class='tooltipline ipa'>/’e/</span> <span class='tooltipline ipa'>then</span> <span class='tooltipline lexentry'><b>’e</b> <i>then</i>.</span></span> <span class='tooltip'>wō</span><span class='tooltiptext'><span class='tooltipline ipa'>/woː/</span> <span class='tooltipline ipa'>will.INDIC</span> <span class='tooltipline lexentry'><b>Wō</b> <i>will</i>.</span></span> <span class='tooltip'>tȳsa</span><span class='tooltiptext'><span class='tooltipline ipa'>[tɨːsa]</span> <span class='tooltipline ipa'>/tɨː-sa/</span> <span class='tooltipline ipa'>go-POS.SUBJ</span> <span class='tooltipline lexentry'><b>Tyna, tȳku’</b> <i>go</i>.</span></span> <span class='tooltip'>whiabiki</span><span class='tooltiptext'><span class='tooltipline ipa'>[ʍjabiki]</span> <span class='tooltipline ipa'>/ʍjabik-i/</span> <span class='tooltipline ipa'>information-CON</span> <span class='tooltipline lexentry'><b>Whiabika</b> <i>information</i>.</span></span> <span class='tooltip'>niosah</span><span class='tooltiptext'><span class='tooltipline ipa'>/niosah/</span> <span class='tooltipline ipa'>more</span> <span class='tooltipline lexentry'><b>Niosah</b> <i>more</i>.</span></span>.</p>
<p><b>Note:</b> <i>Hover over words that have a dotted line under them for more information.</i></p>
</div>

## Phonology

Latu has a small inventory of sounds and a simple syllable structure:
syllables can start with any one consonant, and can end only with /h/ or
/ʔ/. Consonants that are left at the end of a syllable either vanish or
reduce to one of those two glottal consonants. When consonants meet at
syllable boundaries, some undergo sound changes.

Romanization is more phonetic than phonemic, and is similar to Hepburn
romanization of Japanese. For instance, 
<span class='tooltip'>asshi</span><span class='tooltiptext'><span class='tooltipline ipa'>[aʃːi]</span> <span class='tooltipline ipa'>/ahsi/</span> <span class='tooltipline ipa'>drop.INDIC</span> <span class='tooltipline lexentry'><b>Asshi</b> <i>drop</i>.</span></span> *drop.INDIC* is phonemically /ahsi/, but its spelling reflects
its pronunciation [aʃʃi].

### Vowels 

There are six basic vowels: the five cardinal vowels, spelled **a e i o u,**
and /1/, spelled **y.** 

- <span class='tooltip'>dana</span><span class='tooltiptext'><span class='tooltipline ipa'>/dana/</span> <span class='tooltipline ipa'>prize</span> <span class='tooltipline lexentry'><b>Dana</b> <i>prize</i>.</span></span> *prize*  
- <span class='tooltip'>wele</span><span class='tooltiptext'><span class='tooltipline ipa'>/wele/</span> <span class='tooltipline ipa'>boot</span> <span class='tooltipline lexentry'><b>Wele</b> <i>boot</i>.</span></span> *boot*   
- <span class='tooltip'>chiwhi</span><span class='tooltiptext'><span class='tooltipline ipa'>[tʃiʍi]</span> <span class='tooltipline ipa'>/tiʍi/</span> <span class='tooltipline ipa'>little</span> <span class='tooltipline lexentry'><b>Chiwhi</b> <i>little</i>.</span></span> *little* 
- <span class='tooltip'>mono</span><span class='tooltiptext'><span class='tooltipline ipa'>/mono/</span> <span class='tooltipline ipa'>lake</span> <span class='tooltipline lexentry'><b>Mono</b> <i>lake</i>.</span></span> *lake*   
- <span class='tooltip'>suttu</span><span class='tooltiptext'><span class='tooltipline ipa'>/suʔtu/</span> <span class='tooltipline ipa'>problem</span> <span class='tooltipline lexentry'><b>Suttu</b> <i>problem</i>.</span></span> *problem*
- <span class='tooltip'>kywy</span><span class='tooltiptext'><span class='tooltipline ipa'>/kɨwɨ/</span> <span class='tooltipline ipa'>bite</span> <span class='tooltipline lexentry'><b>Kywy</b> <i>bite</i>.</span></span> *bite*   

All six occur both short and long, and written with
a macron when they are long.

- <span class='tooltip'>āmala</span><span class='tooltiptext'><span class='tooltipline ipa'>/aːmala/</span> <span class='tooltipline ipa'>poison</span> <span class='tooltipline lexentry'><b>Āmala</b> <i>poison</i>.</span></span> *poison* 
- <span class='tooltip'>tēlē</span><span class='tooltiptext'><span class='tooltipline ipa'>/teːleː/</span> <span class='tooltipline ipa'>music</span> <span class='tooltipline lexentry'><b>Tēlē</b> <i>music</i>.</span></span> *music*  
- <span class='tooltip'>īhki</span><span class='tooltiptext'><span class='tooltipline ipa'>/iːhki/</span> <span class='tooltipline ipa'>broken</span> <span class='tooltipline lexentry'><b>Īhki</b> <i>broken</i>.</span></span> *broken* 
- <span class='tooltip'>ōmō</span><span class='tooltiptext'><span class='tooltipline ipa'>/oːmoː/</span> <span class='tooltipline ipa'>soap</span> <span class='tooltipline lexentry'><b>Ōmō</b> <i>soap</i>.</span></span> *soap*  
- <span class='tooltip'>ulū</span><span class='tooltiptext'><span class='tooltipline ipa'>/ulū/</span> <span class='tooltipline ipa'>knife</span> <span class='tooltipline lexentry'><b>Ulūa</b> <i>knife</i>.</span></span> *knife* 
- <span class='tooltip'>whȳ’y</span><span class='tooltiptext'><span class='tooltipline ipa'>/ʍɨːʔɨ/</span> <span class='tooltipline ipa'>island</span> <span class='tooltipline lexentry'><b>Whȳ’y</b> <i>island</i>.</span></span> *island* 

There are three diphthongs, **ia io iu**, pronounced /ja jo ju/. Other than in
these diphthongs, the [j]-sound does not occur.

- <span class='tooltip'>mioto</span><span class='tooltiptext'><span class='tooltipline ipa'>/mjoto/</span> <span class='tooltipline ipa'>see</span> <span class='tooltipline lexentry'><b>Mioto</b> <i>see</i>.</span></span> *see*
- <span class='tooltip'>kiala</span><span class='tooltiptext'><span class='tooltipline ipa'>/kjala/</span> <span class='tooltipline ipa'>open</span> <span class='tooltipline lexentry'><b>Kiala</b> <i>open</i>.</span></span> *open*
- <span class='tooltip'>whiutu</span><span class='tooltiptext'><span class='tooltipline ipa'>/ʍjutu/</span> <span class='tooltipline ipa'>point.out</span> <span class='tooltipline lexentry'><b>Whiutu</b> <i>point.out</i>.</span></span> *point.out*

The diphthongs also occur with the second element long.

- <span class='tooltip'>kiūpu</span><span class='tooltiptext'><span class='tooltipline ipa'>/kjuːpu/</span> <span class='tooltipline ipa'>hat</span> <span class='tooltipline lexentry'><b>Kiūpu</b> <i>hat</i>.</span></span> *hat*
- <span class='tooltip'>niāda</span><span class='tooltiptext'><span class='tooltipline ipa'>/njaːda/</span> <span class='tooltipline ipa'>night</span> <span class='tooltipline lexentry'><b>Niāda</b> <i>night</i>.</span></span> *night*
- <span class='tooltip'>wiōlo</span><span class='tooltiptext'><span class='tooltipline ipa'>/wjoːlo/</span> <span class='tooltipline ipa'>village</span> <span class='tooltipline lexentry'><b>Wiōlo</b> <i>village</i>.</span></span> *village*

Roots often have two identical vowels, like the examples in this section.
Another common pattern is an **i** in the first syllable and a diphthong
in the second.

### Consonants

There are fourteen consonant phonemes. 

|                | Bilabial | Alveolar | Velar | Glottal |
|-|-|-|-|-|
| Voiceless stop | **p** /p/ | **t** /t/ | **k** /k/ | **’** /ʔ/ |
| Voiced stop    | **b** /b/ | **d** /d/ | **g** /g/ |  |
| Fricative | | **s** /s/ | **wh** /ʍ/ | **h** /h/ | 
| Nasal | **m** /m/ | **n** /n/ | | | 
| Liquid | | **l** /l/ | **w** /w/ | |

Before **i**, the consonants **t d s** palatalize to [tʃ dʒ ʃ]. Before a
diphthong, these consonants palatalize and the first element of the diphthong
becomes silent. These changes are reflected in writing: the palatalized
consonants are written **ch j sh**.

- <span class='tooltip'>tasa</span><span class='tooltiptext'><span class='tooltipline ipa'>[tasa]</span> <span class='tooltipline ipa'>/tas-a/</span> <span class='tooltipline ipa'>drink-INDEF</span> <span class='tooltipline lexentry'><b>Tasa</b> <i>drink</i>.</span></span> *a drink*
- <span class='tooltip'>tashi</span><span class='tooltiptext'><span class='tooltipline ipa'>[taʃi]</span> <span class='tooltipline ipa'>/tas-i/</span> <span class='tooltipline ipa'>drink-CON</span> <span class='tooltipline lexentry'><b>Tasa</b> <i>drink</i>.</span></span> *drink of...*
- <span class='tooltip'>kada</span><span class='tooltiptext'><span class='tooltipline ipa'>[kada]</span> <span class='tooltipline ipa'>/kad-a/</span> <span class='tooltipline ipa'>path-INDEF</span> <span class='tooltipline lexentry'><b>Kada</b> <i>path</i>.</span></span> *a path*
- <span class='tooltip'>kaji</span><span class='tooltiptext'><span class='tooltipline ipa'>[kadʒi]</span> <span class='tooltipline ipa'>/kad-i/</span> <span class='tooltipline ipa'>path-CON</span> <span class='tooltipline lexentry'><b>Kada</b> <i>path</i>.</span></span> *path of...*

### Syllables

A syllable's core is a single vowel or diphthong, either long or short. 
It can be preceded by any single consonant, and followed by /h/ or /ʔ/.

- <span class='tooltip'>mi</span><span class='tooltiptext'><span class='tooltipline ipa'>/mi/</span> <span class='tooltipline ipa'>not</span> <span class='tooltipline lexentry'><b>Mi</b> <i>not</i>.</span></span> *not*
- <span class='tooltip'>ah</span><span class='tooltiptext'><span class='tooltipline ipa'>/ah/</span> <span class='tooltipline ipa'>hot</span> <span class='tooltipline lexentry'><b>Ah</b> <i>hot</i>.</span></span> *hot*
- <span class='tooltip'>pio’</span><span class='tooltiptext'><span class='tooltipline ipa'>[pjoʔ]</span> <span class='tooltipline ipa'>/pjo-ʔ/</span> <span class='tooltipline ipa'>rice-DEF</span> <span class='tooltipline lexentry'><b>Pio</b> <i>rice</i>.</span></span> *the rice*
- <span class='tooltip'>wē</span><span class='tooltiptext'><span class='tooltipline ipa'>/weː/</span> <span class='tooltipline ipa'>if</span> <span class='tooltipline lexentry'><b>Wē</b> <i>if</i>.</span></span> *if* 
- <span class='tooltip'>ūh</span><span class='tooltiptext'><span class='tooltipline ipa'>/uːh/</span> <span class='tooltipline ipa'>up.DIR</span> <span class='tooltipline lexentry'><b>Ūh</b> <i>up.DIR</i>.</span></span> *upward*
- <span class='tooltip'>sū’</span><span class='tooltiptext'><span class='tooltipline ipa'>[suːʔ]</span> <span class='tooltipline ipa'>/suː-ʔ/</span> <span class='tooltipline ipa'>handkerchief-DEF</span> <span class='tooltipline lexentry'><b>Sū</b> <i>handkerchief</i>.</span></span> *the handkerchief*

### Clusters

Syllable-final /h/ or /ʔ/ combine with the first consonant of the next
styllable to form a cluster. Clusters sometimes have idiosyncratic
pronunciations and often have idiosyncratic spelling.

- <span class='tooltip'>a’</span><span class='tooltiptext'><span class='tooltipline ipa'>[ak]</span> <span class='tooltipline ipa'>/aʔ/</span> <span class='tooltipline ipa'>tree</span> <span class='tooltipline lexentry'><b>Aka</b> <i>tree</i>.</span></span> + <span class='tooltip'>wa</span><span class='tooltiptext'><span class='tooltipline ipa'>/wa/</span> <span class='tooltipline ipa'>hedge</span> <span class='tooltipline lexentry'><b>Wa</b> <i>hedge</i>.</span></span> = <span class='tooltip'>aqua</span><span class='tooltiptext'><span class='tooltipline ipa'>[aʔʍa]</span> <span class='tooltipline ipa'>/aʔ+wa/</span> <span class='tooltipline ipa'>bush</span> <span class='tooltipline lexentry'><b>Aqua</b> (from <b>aka</b> <i>tree</i>, <b>wa</b> <i>hedge</i>, ) <i>bush</i>.</span></span> *bush*
- <span class='tooltip'>ah</span><span class='tooltiptext'><span class='tooltipline ipa'>/ah/</span> <span class='tooltipline ipa'>fire</span> <span class='tooltipline lexentry'><b>Aha</b> <i>fire</i>.</span></span> + <span class='tooltip'>lo</span><span class='tooltiptext'><span class='tooltipline ipa'>/lo/</span> <span class='tooltipline ipa'>CRAN</span> <span class='tooltipline lexentry'><b>Lo</b> <i>CRAN</i>.</span></span> = <span class='tooltip'>ahlo</span><span class='tooltiptext'><span class='tooltipline ipa'>[aɬːo]</span> <span class='tooltipline ipa'>/ah+lo/</span> <span class='tooltipline ipa'>light</span> <span class='tooltipline lexentry'><b>Ahlo</b> (from <b>aha</b> <i>fire</i>, <b>lo</b> <i>CRAN</i>, ) <i>light</i>.</span></span> *light*

Glottal stops in clusters were heard by English-speakers as oral stops
in matching locations, and that is how they are written. In further
influence from English, the combination that would regularly be **kw**
is instead written **qu.**

- <span class='tooltip'>hette</span><span class='tooltiptext'><span class='tooltipline ipa'>/heʔte/</span> <span class='tooltipline ipa'>sit.INDIC</span> <span class='tooltipline lexentry'><b>Hette</b> <i>sit</i>.</span></span> *sit.INDIC*, not **he’te**
- <span class='tooltip'>katlama’e</span><span class='tooltiptext'><span class='tooltipline ipa'>[kaʔlamaʔe]</span> <span class='tooltipline ipa'>/kaʔ+lamaʔe/</span> <span class='tooltipline ipa'>wandering</span> <span class='tooltipline lexentry'><b>Katlama’e</b> (from <b>kada</b> <i>path</i>, <b>lama’e</b> <i>trail</i>, ) <i>wandering</i>.</span></span> *wandering*, not **ka’lama’e**
- <span class='tooltip'>poquē</span><span class='tooltiptext'><span class='tooltipline ipa'>/poʔʍeː/</span> <span class='tooltipline ipa'>pot</span> <span class='tooltipline lexentry'><b>Poquē</b> <i>pot</i>.</span></span> *pot*, not **po’whē**

When a coda /h/ is followed by a fricative, it assimilates to it and is
written using the same letter.

- <span class='tooltip'>asshi</span><span class='tooltiptext'><span class='tooltipline ipa'>[aʃːi]</span> <span class='tooltipline ipa'>/ahsi/</span> <span class='tooltipline ipa'>drop.INDIC</span> <span class='tooltipline lexentry'><b>Asshi</b> <i>drop</i>.</span></span> *drop.INDIC*, not **ahsi**
- <span class='tooltip'>nawwhala</span><span class='tooltiptext'><span class='tooltipline ipa'>[naʍʍala]</span> <span class='tooltipline ipa'>/nahʍal-a/</span> <span class='tooltipline ipa'>eagle-INDEF</span> <span class='tooltipline lexentry'><b>Nawwhala</b> <i>eagle</i>.</span></span> *eagle-INDEF*, not **nahwhala**

The consonants /w/ and /ʍ/ are not distinguished in clusters. So
both /hw/ and /hʍ/ are pronounced [ʍʍ] and written **wwh**, and both
/ʔw/ and /ʔʍ/ are pronounced [ʔʍ] and written **qu**.

### All consonants

The full set of consonant sounds, alone and in clusters, looks like this.
The table reflects palatalization, assimilation of /h/ to fricatives, and
the partial merger of **w** and **wh,** as well as the simply irregular
spelling **qu.**

<table>
<tr><td></td><td>Alone</td><td>After /ʔ/</td><td>After /h/</td></tr>
<tr><td>/p/</td>
<td><b>p</b> [p]</td>
<td><b>pp</b> [ʔp]</td>
<td><b>hp</b> [hp]</td></tr>
<tr><td rowspan="2">/t/</td>
<td><b>t</b> [t]</td>
<td><b>tt</b> [ʔt]</td>
<td><b>ht</b> [ht]</td></tr>
<tr>
<td><b>ch</b> [tʃ]</td>
<td><b>tch</b> [ʔtʃ]</td>
<td><b>hch</b> [htʃ]</td></tr>
<tr><td>/k/</td>
<td><b>k</b> [k]</td>
<td><b>kk</b> [ʔk]</td>
<td><b>hk</b> [hk]</td></tr>
<tr><td>/b/</td>
<td><b>b</b> [b]</td>
<td><b>bb</b> [ʔb]</td>
<td><b>hb</b> [hb]</td></tr>
<tr><td rowspan="2">/d/</td>
<td><b>d</b> [d]</td>
<td><b>dd</b> [ʔd]</td>
<td><b>hd</b> [hd]</td></tr>
<tr>
<td><b>j</b> [dʒ]</td>
<td><b>dj</b> [ʔdʒ]</td>
<td><b>hj</b> [hdʒ]</td></tr>
<tr><td>/g/</td>
<td><b>g</b> [g]</td>
<td><b>gg</b> [ʔg]</td>
<td><b>hg</b> [hg]</td></tr>
<tr><td rowspan="2">/s/</td>
<td><b>s</b> [s]</td>
<td><b>ts</b> [ʔs]</td>
<td><b>ss</b> [ss]</td></tr>
<tr>
<td><b>sh</b> [ʃ]</td>
<td><b>tsh</b> [ʔʃ]</td>
<td><b>ssh</b> [ʃʃ]</td></tr>
<tr><td>/ʍ/</td>
<td><b>wh</b> [ʍ]</td>
<td rowspan="2"><b>qu</b> [ʔʍ]</td>
<td rowspan="2"><b>wwh</b> [ʍʍ]</td></tr>
<tr><td>/w/</td>
<td><b>w</b> [w]</td></tr>
<tr><td>/l/</td>
<td><b>l</b> [l]</td>
<td><b>tl</b> [ʔl]</td>
<td><b>hl</b> [hl]</td></tr>
<tr><td>/m/</td>
<td><b>m</b> [m]</td>
<td><b>pm</b> [ʔm]</td>
<td><b>hm</b> [hm]</td></tr>
<tr><td>/n/</td>
<td><b>n</b> [n]</td>
<td><b>tn</b> [ʔn]</td>
<td><b>hn</b> [hn]</td></tr>
</table>


## Morphology

Latu is not a highly inflected language. Nouns inflect for *state,* a 
feature that includes definiteness. Verbs inflect for mood and can
form a verbal noun that is like the English gerund. Other distinctions,
including person, number, tense, and aspect, are made by word choice
instead of inflection.

Words can be derived by prefixing and suffixing, 

- <span class='tooltip'>katlama’e</span><span class='tooltiptext'><span class='tooltipline ipa'>[kaʔlamaʔe]</span> <span class='tooltipline ipa'>/kaʔ+lamaʔe/</span> <span class='tooltipline ipa'>wandering</span> <span class='tooltipline lexentry'><b>Katlama’e</b> (from <b>kada</b> <i>path</i>, <b>lama’e</b> <i>trail</i>, ) <i>wandering</i>.</span></span> *wandering*
- <span class='tooltip'>katlama’ewī</span><span class='tooltiptext'><span class='tooltipline ipa'>[kaʔlamaʔewil]</span> <span class='tooltipline ipa'>/kaʔ+lamaʔe-wiː/</span> <span class='tooltipline ipa'>fixed</span> <span class='tooltipline lexentry'><b>Katlama’ewī</b> (from <b>kada</b> <i>path</i>, <b>lama’e</b> <i>trail</i>, ) <i>fixed</i>.</span></span> *fixed*

by reduplication, 

- <span class='tooltip'>se’</span><span class='tooltiptext'><span class='tooltipline ipa'>[set]</span> <span class='tooltipline ipa'>/seʔ/</span> <span class='tooltipline ipa'>round</span> <span class='tooltipline lexentry'><b>Se’</b> <i>round</i>.</span></span> *round*
- <span class='tooltip'>setse’</span><span class='tooltiptext'><span class='tooltipline ipa'>[seʔset]</span> <span class='tooltipline ipa'>/seʔ+seʔ/</span> <span class='tooltipline ipa'>spinning</span> <span class='tooltipline lexentry'><b>Setse’</b> (from <b>se’</b> <i>round</i>, <b>se’</b> <i>round</i>, ) <i>spinning</i>.</span></span> *spinning*

by noun incorporation, 

- <span class='tooltip'>hette</span><span class='tooltiptext'><span class='tooltipline ipa'>/heʔte/</span> <span class='tooltipline ipa'>sit</span> <span class='tooltipline lexentry'><b>Hette</b> <i>sit</i>.</span></span> *sit* 
- <span class='tooltip'>ka</span><span class='tooltiptext'><span class='tooltipline ipa'>/ka/</span> <span class='tooltipline ipa'>claw.CL</span> <span class='tooltipline lexentry'><b>Ka</b> <i>claw.CL</i>.</span></span> *claw.CL* 
- <span class='tooltip'>hette ka</span><span class='tooltiptext'><span class='tooltipline ipa'>/heʔte ka/</span> <span class='tooltipline ipa'>perch</span> <span class='tooltipline lexentry'><b>Hette ka</b> (from <b>hette</b> <i>sit</i>, <b>ka</b> <i>claw.CL</i>, ) <i>perch</i>.</span></span> *perch*, literally *sit with claws.*

or by compounding.

- <span class='tooltip'>ku’i</span><span class='tooltiptext'><span class='tooltipline ipa'>/kuʔi/</span> <span class='tooltipline ipa'>long</span> <span class='tooltipline lexentry'><b>Ku’i</b> <i>long</i>.</span></span> *long*
- <span class='tooltip'>nȳo</span><span class='tooltiptext'><span class='tooltipline ipa'>/nɨːo/</span> <span class='tooltipline ipa'>short</span> <span class='tooltipline lexentry'><b>Nȳo</b> <i>short</i>.</span></span> *short*
- <span class='tooltip'>ku’inȳo</span><span class='tooltiptext'><span class='tooltipline ipa'>[kuʔinɨːo]</span> <span class='tooltipline ipa'>/kuʔi+nɨːo/</span> <span class='tooltipline ipa'>length</span> <span class='tooltipline lexentry'><b>Ku’inȳo</b> (from <b>ku’i</b> <i>long</i>, <b>nȳo</b> <i>short</i>, ) <i>length</i>.</span></span> *length*


# What's going on here?<a name="wgoh"></a>
A preprocessor is a nice tool for conlanging. If I have code that derives and
inflects words, I can write source like this,

<pre>
The word &#123;&#123; perch-IMP &#125;&#125; is the 
imperative of &#123;&#123; perch | f &#125;&#125;.
</pre>

run it through Jinja, and have it render to HTML like this:

>   The word <span class='tooltip'>hette kaku’</span><span class='tooltiptext'><span class='tooltipline ipa'>[heʔte kakuʔ]</span> <span class='tooltipline ipa'>/heʔte ka-kuʔ/</span> <span class='tooltipline ipa'>perch-IMP</span> <span class='tooltipline lexentry'><b>Hette ka</b> (from <b>hette</b> <i>sit</i>, <b>ka</b> <i>claw.CL</i>, ) <i>perch</i>.</span></span> is the imperative of <span class='tooltip'>hette ka</span><span class='tooltiptext'><span class='tooltipline ipa'>/heʔte ka/</span> <span class='tooltipline ipa'>perch</span> <span class='tooltipline lexentry'><b>Hette ka</b> (from <b>hette</b> <i>sit</i>, <b>ka</b> <i>claw.CL</i>, ) <i>perch</i>.</span></span> *perch*.

The object `perch` is providing several things here. It represents a compound
noun, and I can automatically derive its form from its component words.

    sit = Verb("he7te", "sit")
    claw = Noun("ka", "claw")
    perch = Verb(sit+claw, "perch")

It inflects itself automatically: `perch-IMP` adds the correct imperative
suffix. And when it renders to HTML it adds extra context: hover over <span class='tooltip'>hette kaku’</span><span class='tooltiptext'><span class='tooltipline ipa'>[heʔte kakuʔ]</span> <span class='tooltipline ipa'>/heʔte ka-kuʔ/</span> <span class='tooltipline ipa'>perch-IMP</span> <span class='tooltipline lexentry'><b>Hette ka</b> (from <b>hette</b> <i>sit</i>, <b>ka</b> <i>claw.CL</i>, ) <i>perch</i>.</span></span> for
a tooltip that gives pronunciation details and so on.

