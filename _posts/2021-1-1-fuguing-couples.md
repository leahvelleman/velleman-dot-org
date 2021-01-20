---
title: Couples
series: fuguing
layout: post
draft: false
description: Second post in a series on Sacred Harp fuguing tunes — pairing voices off for special effects
image: /assets/images/jubilee.png
---

Writing a Sacred Harp fuguing tune, composers are challenged to take voices
that are _staggered_ — singing words out of sync — and gather them into sync
again. 

<div class="aspectratio youtube">
<iframe type="text/html" class="youtube" src="https://www.youtube.com/embed/0tOAc6YC_rg" rel="0" frameborder="0"></iframe>
</div>

[In the last post in this series, I talked about gathering two voices]({%
post_url 2020-10-28-fuguing-basic-moves %}).  Gathering four is trickier, but
here I'm going to talk about one way to do it: having the voices move as couples.

In fact, **anything you can do with single voices, you can do with couples**,
which makes this trick useful in many situations.  Composers use it to
write quick, compact fugues that wrap up very tidily — like the one in Lenox
(<a href="https://sacredharpbremen.org/40-lenox/">SH 40</a>), the song in the
video above. They also use it in longer fugues for flashier effects — like in
Youthful Blessings (<a
href="https://sevenshapes.sacredharpbremen.org/64-youthful-blessings/">CH
64</a>), <a href="#youthful-blessings">which I discuss below</a>, and <a
href="whats-it-good-for">many other songs; I'll briefly mention some
examples</a>.


## "As couples"

As I said, getting two voices gathered is easy. For instance, here's
one way to do it. Suppose two of the voices are singing
two-measure phrases like these.

> The year of Jubilee is come;\\
> Return, ye ransomed sinners, home.

If they enter one measure apart, the phrases will be out of sync, like this:
![Two voices singing these words. The lower voice is ahead of the
higher.](assets/images/single_staggered.svg)
We saw in the last post that to sync them up, you can let the voice that's
ahead stretch out its rhythm, like this.
![The same diagram. The lower voice lets the higher catch up by singing
the second phrase slower.](assets/images/single_stretch.svg)

Here's the new idea in this post: we can get extra mileage out of this trick —
or any other — by using it on _pairs_ of voices.  If we have _pairs_ of voices
a measure apart, then the _pair_ that's ahead can stretch out its rhythm.
![The same diagram, but each voice is replaced by two voices singing
at the same time.](assets/images/double_stretch.svg)
Since we got two single voices gathered before, we get two pairs of voices
gathered now. And that's everyone — we're done with the whole fugue.

In square dancing, there's a concept called "as couples." Anything a single
dancer can do, two dancers can do by pretending they're a single dancer.
If one person can turn alone, two can turn as a couple. If two can dance
a do-si-do, four can do it as couples.

This is the same idea, so let's use the same word. We gathered all four
voices up using a trick originally designed for two, by having them move
"as couples."


## Practical details

Now, in a real fugue, the voices often don't start in couples. {%- include
sidenote.html n="1" text="Though sometimes they do: see McKay
(<a href='https://sacredharpbremen.org/433-mckay'>SH 433</a>), Sacred Mount
(<a href='https://sacredharpbremen.org/456-sacred-mount'>SH 456</a>), and lots of others."
id="startincouples" -%} Instead, they enter one at a time, and form couples
later. Well, that's ok, we know from the previous post how to pair two voices
off. One easy way is to start with voices two measures apart and let one of
them repeat a line of music, like in this picture:
![A pair of voices singing the text from the previous examples. The lower
voice repeats the first line, and the higher voice joins in on the
repeat.](assets/images/two_apart.svg)
If you time things right, you can get both your couples formed this way:
![Two pairs of voices. In each, the lower voice repeats the first line,
and the higher voice joins in on the repeat.](assets/images/accumulate.svg)

The other complication is that the couples aren't always close to each
other on the staff, or close in pitch. Maybe the red and orange voices are a couple
even though one is the treble and the other is the bass. Well, we can still
think of them as a couple even if we don't draw them next to each other
anymore:

![The same diagram again, but the voices are in a different order: voices
that form a couple might not be next to each other.](assets/images/final.svg)

## Lenox

This is, in fact, the pattern of the fugue for Lenox ([SH 40](https://sacredharpbremen.org/40-lenox/)) — the one in the video
above, one of the shortest and tidiest fugues in the book, and a popular choice
for the first one to teach a new singer.

Now that we've seen it in pictures, let's look at the notes.

### Forming couples

First of all, the voices come together as couples. The bass and treble, who
enter two measures apart, gather together as a couple when the bass repeats a
line.

```lilypond
<<

\new Staff = "tenor" {
\relative bf' { 

\key bf \major
\partial 4
\sacredHarpHeads
r4 | r1 | r2. bf4 | d d d bf | a c c
}
\addlyrics { "The year of jubilee is come;" _ _ _ _ _ _ _ } }
\new Staff = "bass" {
\relative bf { 
\key bf \major
\clef bass
\partial 4
\sacredHarpHeads
bf,4 | f' f f bf | g g g f | bf bf bf g | f f f
}
\addlyrics { 
"The year of jubilee is come;" _ _ _ _ _ _ _ 
"The year of jubilee is come;" _ _ _ _ _ _ _ 
}
}
>>
```

From there, they stay as a couple until the end, singing the same words at (almost) exactly
the same time.


```lilypond
 <<
\new Staff = "tenor" {
\relative bf' { 
\key bf \major
\partial 4
\sacredHarpHeads
r4 | r1 | r2. bf4 | d d d bf | a c c
\override NoteHead #'color = #red
bf | d2. d4 | bf2. bf4 | a2. a4 | bf1 \bar"|."
}
\addlyrics { 
"The year of jubilee is come;" _ _ _ _ _ _ _ 
"Return, ye ransomed sinners, home." _ _ _ _ _ _ _
}
}
\new Staff = "bass" {
\relative bf { 
\key bf \major
\clef bass
\partial 4
\sacredHarpHeads
bf,4 | f' f f bf | g g g f | bf bf bf g | f f f 
\override NoteHead #'color = #red
bf, | bf2 bf | ef2. ef4 | f2. f4 | bf,1
}
\addlyrics { 
"The year of jubilee is come;" _ _ _ _ _ _ _ 
"The year of jubilee is come;" _ _ _ _ _ _ _ 
"Return, ye ransomed sinners, home." _ _ _ _ _ _ _
}
}
>>
```


The tenor and alto make the same move, though they start
a little later: first, they gather.


```lilypond
 <<
\new Staff = "tenor" {
\relative bf { 
\key bf \major
\partial 4
\sacredHarpHeads
r4 | r1 | r1 | r2. d4 | f f f g | f f f 
}
\addlyrics { 
"The year of jubilee is come;" _ _ _ _ _ _ _ 
}
}
\new Staff = "bass" {
\relative bf' { 
\key bf \major
\partial 4
\sacredHarpHeads
r4 | r2. f4 | bf bf bf f | g g g bf | c c c d | bf bf bf
}
\addlyrics { 
"The year of jubilee is come;" _ _ _ _ _ _ _ 
"The year of jubilee is come;" _ _ _ _ _ _ _ 
"Return, ye ransomed sinners, home." _ _ _ _ _ _ _
}
}
>>
```

Then, they stay that way, singing the same words at exactly the same time.


```lilypond
 <<
\new Staff = "tenor" {
\relative bf { 
\key bf \major
\partial 4
\sacredHarpHeads
r4 | r1 | r1 | r2. d4 | f f f g | f f f 
\override NoteHead #'color = #blue
d | g g g g | f2. f4 | d1 \bar"|."
}
\addlyrics { 
"The year of jubilee is come;" _ _ _ _ _ _ _ 
"Return, ye ransomed sinners, home." _ _ _ _ _ _ _
}
}
\new Staff = "bass" {
\relative bf' { 
\key bf \major
\partial 4
\sacredHarpHeads
r4 | r2. f4 | bf bf bf f | g g g bf | c c c d | bf bf bf
\override NoteHead #'color = #blue
f | g g g bf | c2. a4 | bf1
}
\addlyrics { 
"The year of jubilee is come;" _ _ _ _ _ _ _ 
"The year of jubilee is come;" _ _ _ _ _ _ _ 
"Return, ye ransomed sinners, home." _ _ _ _ _ _ _
}
}
>>
```

### Gathering as couples

Now, for a minute, let's treat each couple as a single part.

We can even write them that way: melody and alto on the top staff, and the
other two on the bottom, as if it was a church hymnal or a piano score.

```lilypond
<<
\new Staff <<
\new Voice = "alto" {
\relative bf { 
\voiceTwo
\key bf \major
\partial 4
\sacredHarpHeads
s4 s2.  s4 | s1 | s2. d4 | f f f g | f f f 
\override NoteHead #'color = #blue
d | g g g g | f2. f4 | d1 \bar"|."
}
}
\new Voice = "tenor" {
\relative bf' { 
\voiceOne
\key bf \major
\partial 4
\sacredHarpHeads
r4 r2.
f4 | bf bf bf f | g g g bf | c c c d | bf bf bf
\override NoteHead #'color = #blue
f | g g g bf | c2. a4 | bf1
}
\addlyrics { 
"The year of jubilee is come;" _ _ _ _ _ _ _ 
"The year of jubilee is come;" _ _ _ _ _ _ _ 
"Return, ye ransomed sinners, home." _ _ _ _ _ _ _
}
}
>>
\new Staff <<
\new Voice = "treble" {
\relative bf { 
\voiceOne
\key bf \major
\partial 4
\sacredHarpHeads
s4 | s1 | s2. bf4 | d d d bf | a c c
\override NoteHead #'color = #red
bf | d2. d4 | bf2. bf4 | a2. a4 | bf1 \bar"|."
}
}
\new Voice = "bass" {
\relative bf { 
\voiceTwo
\key bf \major
\clef bass
\partial 4
\sacredHarpHeads
bf,4 | f' f f bf | g g g f | bf bf bf g | f f f 
\override NoteHead #'color = #red
bf, | bf2 bf | ef2. ef4 | f2. f4 | bf,1
}
\addlyrics { 
"The year of jubilee is come;" _ _ _ _ _ _ _ 
"The year of jubilee is come;" _ _ _ _ _ _ _ 
Re -- turn, ye ran -- somed sin -- ners, home.
}
}
>>
>>
```

Now, we're looking at the same problem of gathering two voices, only instead
of voices we're looking at couples.  The two *couples* have staggered
entrances. The bottom couple — the voices on the bottom staff — start a measure
before the top couple, and then have to stretch out their rhythm at the end to
let the top couple catch up.

Other songs that use this trick to wrap a fugue up tidily are Heavenly Dove ([SH 371](https://sacredharpbremen.org/371-heavenly-dove)), 
Conversion ([SH 297](https://sacredharpbremen.org/297-conversion), though with some almost-coupling), Sounding Joy ([SH 391](https://sacredharpbremen.org/391-sounding-joy)), and
New Bethany ([SH 431](https://sacredharpbremen.org/431-new-bethany)).

## Youthful Blessings

In a longer fugue, you can do a lot with couples. Youthful Blessings ([64](https://sevenshapes.sacredharpbremen.org/64-youthful-blessings) in the
Christian Harmony; also recently reprinted as 114 in the Shenandoah Harmony) is
a great example.

<div class="youtube aspectratio">
  <iframe type="text/html"
    class="youtube"
    src="https://www.youtube.com/embed/88X9F23nZko"
    rel="0"
    frameborder="0"></iframe>
</div>

This sounds satisfyingly complicated to sing — and it looks complicated in a
drawing.

![A complicated diagram showing the structure of Youthful Blessings. A more
detailed description of it comes in the paragraphs below.](assets/images/youthful.svg)

But it works the same way as Lenox: by forming the parts into two couples and
then gathering the couples. Once they're gathered, it splits them back out into
couples and gathers them again.

Here's the first step of that: forming the first set of couples.

```lilypond
<<

\new Staff = "treble" {
\relative bf' { 

\key a \major
\partial 4
\sacredHarpHeads
\autoBeamOff
r4 | r1 | r1 | r2. cs8[ d] | e4 cs8[ b] a4 a8[ b] | cs4 cs8[ d] e2~ 2.
}
\addlyrics {And make you use -- ful while you live,}
}
\new Staff = "alto" {
\relative a' { 
\key a \major
\partial 4
\sacredHarpHeads
\autoBeamOff
r4 | r2. a4 | e e8[ fs] e4 e8[ d] | cs4 e8[ fs] a2 | a a | a4 a8[ b] cs2( | a2.)
}
\addlyrics {And make you use -- ful while you live, Use -- ful while you live_}
}
\new Staff = "tenor" {
\relative a' { 
\key a \major
\partial 4
\sacredHarpHeads
\autoBeamOff
r4 | r1 | r2. a8[ b] | cs4 cs8[ b] a4 a8[ b] | cs4 cs8[ d] e2~ | e2. 
}
\addlyrics {And make you use -- ful while you live, }
}
\new Staff = "bass" {
\relative a { 
\key a \major
\clef bass
\partial 4
\sacredHarpHeads
\autoBeamOff
e8[ fs] | a4 e8[ d] cs4 e | a a a e | fs e cs cs8[ d] | e4 e a,2~ | 2.
}
\addlyrics {And make you use -- ful while you live, }
}
>>
```

Here those couples are gathering together — this time just by giving the lower
couple a long held note:

```lilypond
<<

\new Staff = "treble" {
\relative bf' { 

\key a \major
\partial 4
\sacredHarpHeads
\autoBeamOff
s4 | s2. cs8[ d] | e4 e8[ cs] a4 a8[ b] | cs4 cs8[ b] a4 e'4 | e e ds cs | b2.
}
\addlyrics {And make you use -- ful while you live, 
And save you at the end.}
}
\new Staff = "alto" {
\relative a' { 
\key a \major
\partial 4
\sacredHarpHeads
\autoBeamOff
s4 | s2. a4 | a e a a8[ gs] | fs4 a8[ gs] fs4 gs | a cs8[ b] a4 a | gs2.
}
}
\new Staff = "tenor" {
\relative a'' { 
\key a \major
\partial 4
\sacredHarpHeads
\autoBeamOff
e4 | cs e8[ cs] a4 a8[ b] | cs4 cs8[ b] a2~ | a2. b4 | cs a8[ gs] fs4 a8[ fs] | e2.
}
\addlyrics {And make you use -- ful while you live, 
And save you at the end.}
}
\new Staff = "bass" {
\relative a, { 
\key a \major
\clef bass
\partial 4
\sacredHarpHeads
\autoBeamOff
cs4 | a e'8[ fs] cs4 e | a a8[ gs] fs2~ | 2. e4 | e cs b b | e2.
}
}
>>
```

And here's the second set of couples:

```lilypond
<<

\new Staff = "treble" {
\relative bf { 

\key a \major
\partial 4
\sacredHarpHeads
\autoBeamOff
r4 r2.  e4 | fs fs8[ gs] a4 a8[ b] | cs4 e e e8[ fs] | e4 e e e8[ d] | cs1
}
\addlyrics {And make you use -- ful while you live, 
And save you at the end.}
}
\new Staff = "alto" {
\relative a' { 
\key a \major
\partial 4
\sacredHarpHeads
\autoBeamOff
a4 | a a8[ gs] fs4 e | a a a2~ | 2. a4 | a a a gs8[ fs] | e1
}
\addlyrics {And make you use -- ful while you live, 
And save you at the end.}
}
\new Staff = "tenor" {
\relative a' { 
\key a \major
\partial 4
\sacredHarpHeads
\autoBeamOff
e4 | fs fs8[ gs] a4 a8[ b] | cs4 d e2~ | 2. a,8[ b] | cs4 cs cs b | a1
}
\addlyrics {And make you use -- ful while you live, 
And save you at the end.}
}
\new Staff = "bass" {
\relative a { 
\key a \major
\clef bass
\partial 4
\sacredHarpHeads
\autoBeamOff
r4 | r2. e4 | a,4 a8[ b] cs4 e | a e8[ fs] a4 cs,8[ d] | e4 e e e | a,1
}
\addlyrics {And make you use -- ful while you live, 
And save you at the end.}
}
>>
```

Other songs with this sort of strong couple energy, at least for a stretch,
are My Brightest Days ([SH
546](https://sacredharpbremen.org/546-my-brightest-days)), The Better Land ([SH
454](https://sacredharpbremen.org/454-the-better-land)), and Leaning on Jesus'
Breast (Cooper 450, reprinted as [ShH 96](https://shenandoah.harmony.sacredharpbremen.org/96b-leaning-on-jesus-breast)).


## Approximately as couples

Composers sometimes have two voices work as an _approximate_ couple: they fall
out of sync by a few beats one way or the other, but they never stray far. 
This happened in older songs (in Lenox, one of the voices strays from its partner
for a beat), but it happens more in 20th Century ones, especially ones whose 
composers were connected to "convention song" gospel. 

Here are the alto and bass of Wondrous Cross ([SH 447](https://sacredharpbremen.org/447-wondrous-cross)) for the first half of the
fuguing part. They continue like this, approximately coupled, until the end of
the song.


```lilypond
<<
\new Staff {
\relative e' { 
\key e \minor
\partial 4
\sacredHarpHeadsMinor
\autoBeamOff
g4 | e e8[ fs] g4 g8[ fs] | e4 fs g2 | e2. g8 fs | g2. fs4 | g( e d) g8[ fs] | e2.
}
\addlyrics { 
For -- bid it, Lord, "that I should boast," _ _ _
Save in the death of Christ my God:
}

}
\new Staff {
\relative e { 
\clef bass
\key e \minor
\partial 4
\sacredHarpHeads 
\autoBeamOff
e4 | g g e e8[ d] | b4 b e2 | e2.( b4 | e) g8 a b4 a | g2 b,2 | e2. 
}
\addlyrics { 
For -- bid it, Lord, "that I should boast," _ _ _
Save "in the death of Christ my" _ _ _ _ _ God:
}
}
>>
```

And here are the treble and bass at the end of the fugue in The Better Land ([SH 454](https://sacredharpbremen.org/454-the-better-land)). 

```lilypond
<<
\new Staff {
\relative bf' { 
\key bf \major
\partial 4
\sacredHarpHeads
\autoBeamOff
d8[ c] | bf4 bf bf8[ f] g[ a] | f4 f f f | bf2. bf4 | d2 bf4( c) | d d c f | d1
}
\addlyrics { 
We'll sing a -- "round the throne In sweet accord," _ _ _ _ _ _
A -- dor -- ing "Jesus, our dear lord." _
}

}
\new Staff {
\relative bf { 
\clef bass
\key bf \major
\partial 4
\sacredHarpHeads 
\autoBeamOff
f8[ g] | bf4 bf f8[( ef] d[ c] | bf4) bf8[ c] d4 d | ef8[ f] g[ a] bf4 
bf | bf2 f4( ef) | d d f f | bf,1
\bar"|."
}
\addlyrics { 
We'll sing a -- round 
"the throne In sweet accord" _ _ _ _ _
A -- dor -- ing "Jesus, our dear lord." _
}
}
>>
```

Writing all four parts out hymnal-style shows the bigger pattern: the top couple keeping
perfect pace with each other, the bottom couple keeping approximate pace, and the two 
couples gathering together as if each was a single dancer.

```lilypond
<<
\new Staff <<
\new Voice {
\relative bf' { 
\key bf \major
\partial 4
\sacredHarpHeads
\autoBeamOff
\voiceOne
f8[ g] | bf4 bf bf c | d2. bf8[ c] | d2 f | ef2. d4 | f8[ g] f[ ef] d4 c | bf2 a | bf1
} 
}
\new Voice {
\relative bf' { 
\key bf \major
\partial 4
\sacredHarpHeads
\autoBeamOff
\voiceTwo
bf4 | f f f f | f2. f4 | bf2 af | g2. f4 | bf f g a | f2 f | f1
} 
\addlyrics {
We'll sing a -- round the throne
In sweet ac -- cord
A -- dor -- ing Je -- sus our dear lord.
}
}
>>
\new Staff <<
\new Voice {
\relative bf { 
\key bf \major
\partial 4
\sacredHarpHeads
\autoBeamOff
\clef bass
\voiceOne
r4 | r2.
d8[ c] | bf4 bf bf8[ f] g[ a] | f4 f f f | bf2. bf4 | d2 bf4( c) | d d c f | d1
}
\addlyrics { 
We'll sing a -- "round the throne In sweet accord," _ _ _ _ _ _
A -- dor -- ing "Jesus, our dear lord." _
}
}
\new Voice {
\relative bf { 
\clef bass
\key bf \major
\partial 4
\sacredHarpHeads 
\autoBeamOff
\voiceTwo
r4 | r2.
f8[ g] | bf4 bf f8[( ef] d[ c] | bf4) bf8[ c] d4 d | ef8[ f] g[ a] bf4 
bf | bf2 f4( ef) | d d f f | bf,1
\bar"|."
}
\addlyrics { 
We'll sing a -- round 
"the throne In sweet accord" _ _ _ _ _
A -- dor -- ing "Jesus, our dear lord." _
}
}
>>
>>
```

## What's it good for?

This has been a bunch of pictures and math. What is this trick actually good for?
What sorts of music can you make with it?

Here are some kinds of fugues that really take advantage of couples for a dramatic effect:

- Compact fugues that wrap up quickly: Lenox 
  ([SH 40](https://sacredharpbremen.org/40-lenox)), 
  Russia ([SH 107](https://sacredharpbremen.org/107-russia)), Heavenly Dove
  ([SH 371](https://sacredharpbremen.org/371-heavenly-dove))
- …or longer ones that get into sync quickly and then spend a long time
  there: New Bethany ([SH 431](https://sacredharpbremen.org/431-new-bethany))
- Fugues with call and response between couples, often in songs that feel like
  edge cases — we're not sure whether to call them fugues or not: Lawrenceburg
  ([SH 380](https://sacredharpbremen.org/380-lawrenceburg)), Never Part ([SH
  94](https://sacredharpbremen.org/94-never-part))
- Ones with Gospel-quartet-style playfulness: The Better Land ([SH
  454](https://sacredharpbremen.org/454-the-better-land))
- Ones that let one couple hold back so the other can sing a duet: The Last
  Words of Copernicus ([SH
  112](https://sacredharpbremen.org/112-the-last-words-of-copernicus)), Oxford
  ([SH 306](https://sacredharpbremen.org/306-oxford)), Present Joys ([SH
  318](https://sacredharpbremen.org/318-present-joys))

It's also common for longer fugues of all kinds to spend a little while in
couples at the very end — not for any dramatic effect, just as a means to an
end. Greenwich ([SH 183](https://sacredharpbremen.org/183-greenwich)) and
Calvary ([SH 300](https://sacredharpbremen.org/300-calvary)) are two well-known
fugues that do this.

And there are fugues of all kinds where two voices spend the whole thing
coupled up. Often the alto is one of the coupled voices. Sometimes this
is because the alto was written later, and fitted into an existing rhythm.
Other times, it seems to be because the composer wanted to make the fugue
entrances more compact.
