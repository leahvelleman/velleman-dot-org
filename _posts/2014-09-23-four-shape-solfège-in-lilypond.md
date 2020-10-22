---
layout: post
---

In [another post]({% post_url 2014-09-14-movable-do-in-lilypond %}) I wondered whether it would be
possible to enter notes using the four syllables used in Sacred Harp
singing, where an octave is not <span class="title-ref">do re mi fa sol
la ti do</span> but rather <span class="title-ref">fa so la fa so la mi
fa</span>. I guessed that the answer was no, because LilyPond assumes
that note names will repeat at the octave.

But @tychoish and @willf both pointed out that all you need is a way to
*distinguish* between the two <span class="title-ref">fa</span>'s, the
two <span class="title-ref">so</span>'s and the two <span
class="title-ref">la</span>'s in an octave. And of course there are
plenty of ways of doing that.

One nice way is using capitalization: LilyPond is case-sensitive, and so
it's perfectly possible for `fa` and `Fa` to represent two different
pitches. This lets us enter a C major scale as follows, without
confusing the parser: `Fa` is always the tonic, `fa` is always the
fourth degree; and similarly for `So` and `so`, or `La` and `la`; and so
there is never any ambiguity:

```
\include "fasola.ly"
\fasola c' { Fa So La fa so la mi Fa }
\fasola d' { Fa So La fa so la mi Fa }
```

Here is the lilypond source code which was included (as <span
class="title-ref">fasola.ly</span>) in that example:

```
fasola =
  #(define-music-function (parser location k m) ; take two real arguments: k and m.
                          (ly:pitch? ly:music?) ; k should be a pitch, m should be some music
    #{\key $k \major                            % set the key to k
      \transpose do $k { \relative $k { $m } }  % and transpose the music so that "do" is k
    #}
  )

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
  (Fa  . ,(ly:make-pitch -1 0 NATURAL))
  (So  . ,(ly:make-pitch -1 1 NATURAL))
  (La  . ,(ly:make-pitch -1 2 NATURAL))
  (fa  . ,(ly:make-pitch -1 3 NATURAL))
  (so  . ,(ly:make-pitch -1 4 NATURAL))
  (la  . ,(ly:make-pitch -1 5 NATURAL))
  (mi  . ,(ly:make-pitch -1 6 NATURAL))
)
pitchnames = \relativeDoPitchNames
#(ly:parser-set-note-names parser relativeDoPitchNames)
```
