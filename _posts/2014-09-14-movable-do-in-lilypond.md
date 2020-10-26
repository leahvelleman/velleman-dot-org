---
layout: post
---

LilyPond understands note names in a lot of different languages. This code

    \include "english.ly"
    \relative c' { c d e f g a bf b c }

```lilypond
\relative c' { c d e f g a bes b c }
```

could also be written as

    \include "nederlands.ly"
    \relative c' { c d e f g a bes b c }

or as:

    \include "espanol.ly"
    \relative do' { do re mi fa sol la sib si do }

The note names in Spanish (and other Romance languages) look like the
solfège syllables that are familiar, if nothing else, from The Sound Of
Music. Lots of people learn to sight-sing using these syllables, either
in choirs or in congregational singing from a book that uses shape
notes.

But things aren't quite so familiar as they seem...

The problem
-----------

The Romance languages actually use what's called "fixed-do solfège"
---meaning that no matter what key the music is in, <span
class="title-ref">do</span> means C natural, <span
class="title-ref">re</span> means D natural, and so on. You can't get a
major scale in B major by typing this:

    \include "espanol.ly"
    \relative do' { \key si \major do re mi fa sol la si do }

Instead what you end up with is a B major key signature --- and then a
C-major scale, written with lots of accidentals.

include "espanol.ly" relative do' { key si major do re mi fa sol la si
do }

To get a B-major scale you have to type something like this instead:

    \include "espanol.ly"
    \relative do' { \key si \major si dos res mi fas sols las si }

This probably isn't what you're expecting if you've used solfège to
learn sight-singing in the English-speaking world, where we tend to use
"movable-do solfège" --- a system where <span
class="title-ref">do</span> always refers the the first note of the
major scale, no matter *what* key you're in.

Fixing it
---------

LilyPond is set up to be extensible by writing code in Scheme, but it's
rare in my experience to find situations where this is both easy and
useful. Most of the simple extensions I find myself wanting have already
been written by someone else, and complicated ones quickly get *very*
complicated (in part because LilyPond's interface for programmers is...
not as thoroughly documented as one might hope.)

But this is one of the pretty rare cases where a *simple* bit of Scheme
can help.

There are two basic things we'd want from a movable-do music mode: it
should set up the key signature for the key we're writing in, and it
should also transpose the music so that <span
class="title-ref">do</span> is the first note of the major scale in that
key signature.:

```scheme
relative-do =
    ; take two real arguments: k and m.
    ; k should be a pitch, m should be some music
    #(define-music-function (parser location k m) 
                            (ly:pitch? ly:music?) 
        % set the key to k
        % and transpose the music so that "do" is k
        #{\key $k \major                            
          \transpose do $k { \relative $k { $m } }  
        #}
    )
```

All that remains after that is to teach LilyPond the names of the notes.
I've chosen to give it *both* the English note names *and* their most
common names in movable-do solfège:

```scheme
relativeDoPitchNames = #`(
  (cf . ,(ly:make-pitch -1 0 FLAT))
  (c  . ,(ly:make-pitch -1 0 NATURAL))
  (cs . ,(ly:make-pitch -1 0 SHARP))
  (df . ,(ly:make-pitch -1 1 FLAT))
  (d  . ,(ly:make-pitch -1 1 NATURAL))
  (ds . ,(ly:make-pitch -1 1 SHARP))
  (ef . ,(ly:make-pitch -1 2 FLAT))
  (e  . ,(ly:make-pitch -1 2 NATURAL))
  (es . ,(ly:make-pitch -1 2 SHARP))
  (ff . ,(ly:make-pitch -1 3 FLAT))
  (f  . ,(ly:make-pitch -1 3 NATURAL))
  (fs . ,(ly:make-pitch -1 3 SHARP))
  (gf . ,(ly:make-pitch -1 4 FLAT))
  (g  . ,(ly:make-pitch -1 4 NATURAL))
  (gs . ,(ly:make-pitch -1 4 SHARP))
  (af . ,(ly:make-pitch -1 5 FLAT))
  (a  . ,(ly:make-pitch -1 5 NATURAL))
  (as . ,(ly:make-pitch -1 5 SHARP))
  (bf . ,(ly:make-pitch -1 6 FLAT))
  (b  . ,(ly:make-pitch -1 6 NATURAL))
  (bs . ,(ly:make-pitch -1 6 SHARP))
  (do . ,(ly:make-pitch -1 0 NATURAL))
  (di . ,(ly:make-pitch -1 0 SHARP))
  (ra . ,(ly:make-pitch -1 1 FLAT))
  (re . ,(ly:make-pitch -1 1 NATURAL))
  (ri . ,(ly:make-pitch -1 1 SHARP))
  (ma . ,(ly:make-pitch -1 2 FLAT))
  (me . ,(ly:make-pitch -1 2 FLAT))
  (mi . ,(ly:make-pitch -1 2 NATURAL))
  (fa . ,(ly:make-pitch -1 3 NATURAL))
  (fi . ,(ly:make-pitch -1 3 SHARP))
  (se . ,(ly:make-pitch -1 4 FLAT))
  (so . ,(ly:make-pitch -1 4 NATURAL))
  (si . ,(ly:make-pitch -1 4 SHARP))
  (le . ,(ly:make-pitch -1 5 FLAT))
  (le . ,(ly:make-pitch -1 5 FLAT))
  (lo . ,(ly:make-pitch -1 5 FLAT))
  (la . ,(ly:make-pitch -1 5 NATURAL))
  (li . ,(ly:make-pitch -1 5 SHARP))
  (ta . ,(ly:make-pitch -1 6 FLAT))
  (te . ,(ly:make-pitch -1 6 FLAT))
  (ti . ,(ly:make-pitch -1 6 NATURAL))
)
pitchnames = \relativeDoPitchNames
#(ly:parser-set-note-names parser relativeDoPitchNames)
```

With that code, we can write a major scale in any key as the familiar
<span class="title-ref">do re mi fa so la ti do</span>, and all we have
to do is specify first which pitch should count as \`do\`:

    \include "movable-do.ly"
    \relative-do c'  { do re mi fa so la ti do } % C major --- "do" is C
    \relative-do b'  { do re mi fa so la ti do } % B major --- "do" is B
    \relative-do bb' { do re mi fa so la ti do } % B-flat major --- "do" is Bb

In most traditions that use movable-do solfège, a minor scale is sung
starting on <span class="title-ref">la</span> rather than \`do\`:

    \include "movable-do.ly"
    \relative-do c'  { la ti do re mi fa so la } % A minor --- "do" is C
    \relative-do b'  { la ti do re mi fa so la } % G-sharp minor --- "do" is B
    \relative-do bb' { la ti do re mi fa so la } % G minor --- "do" is Bb

One more question
-----------------

In some shapenote traditions, there are *four* syllables instead of
seven: a major scale is <span class="title-ref">fa so la fa so la mi
fa</span>. This is how I learned to sight-sing, and it's still the
system I find easiest to use. So it was natural to start wondering
whether LilyPond could be extended to use four-syllable solfège.

The answer seems to be "not easily." The assumption that note names will
repeat after an octave --- no sooner and no later --- seems to be built
into LilyPond at a fairly deep level.
