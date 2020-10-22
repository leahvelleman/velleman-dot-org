---
title: How informative are shape notes?
layout: post
---

Shape note singers learn to sight-sing using a mnemonic system. Each
degree of the scale is associated with a *shape* and a *syllable*, and
before we sing a song we "sing the shapes" to remind ourselves how it
goes.

What's weird is that the most popular version of the system is
defective: it has too few shapes. There are seven notes to the diatonic
octave --- but only four shapes and four syllables.

![A full-octave major scale with only four syllables: fa so la fa so la mi fa](/assets/informative1.png)

What's really weird is that, despite this defect, a lot of singers seem
to pay more attention to the (ambiguous) shapes than to the
(unambiguous) staff notation when they sing. Some lifelong singers swear
they don't understand staff notation *at all.* A lot more can read it a
little but can't really write it, and so if they want to jot a melody
down will jot it down as shapes alone. I don't rely this purely on the
shapes, but I definitely do rely on them pretty heavily: If I'm trying
to sing something written in round notes, I need to imagine the shapes
on top of them or I get lost.

Another fun bit of anecdotal evidence: The version of the Sacred Harp I
first started singing from, the Cooper edition, was until 2012
absolutely *full* of typos. And the rule of thumb I was taught was "Just
look at the shape. Ignore the line of the staff it's on."
Right-shape-wrong-staff-line typos were rampant,
wrong-shape-right-staff-line typos were basically nonexistant. That's a
pattern that only makes sense in a world where people really are looking
at the shapes first.

Letters and words
-----------------

Up until about 2PM today, I had a theory, and it went like this: Okay,
sure, a single shape on its own is ambiguous. But Sacred Harp singers
don't look at single shapes, we look at *sequences* of shapes --- and
those are much clearer. This sat well with my intuitive experience of
sight-singing from shapes, where it felt like I'd learned syllable
sequences like "so-la-mi-fa" as *words* and then learned a tune for each
word.

Think of it like reading English words out loud. English is infamous for
having multiple pronunciations for most letters --- and yet most written
words are unambiguous. Ask me "Is the first letter I on page 87 of this
book short or long?" and I have no idea. Tell me it's part of the word
*with* and there's no longer any doubt.

There are some cases where this is clearly what's going on in the Sacred
Harp: *mi fa* is basically always
"pronounced" *7-1* rather than *7-4*, with only four exceptions in the book. I
think that makes it fair to say that *mi fa*-pronounced-*7-4* practically just
"isn't a word" in the Sacred Harp style (or in a lot of other American
vocal music).

![Two intervals with the same syllables: "mi fa" as a jump from B to C versus as a jump from B to F](/assets/informative2.png)


And there are lots of cases where context helps a bit: *so fa* is only rarely *2-4*, and is disproportionately likely to be
*2-1*.


Maybe this is like the case of ambiguous-but-guessable words like *minute*,
where the short-I pronunciation (meaning a unit of time) is
disproportionately likely --- and so is the
safe guess if you need to guess --- but the long-I pronunciation
(meaning "tiny") is possible. Or maybe these sequences need to be seen
as part of a longer word to be disambiguated.

Testing the theory
------------------

This seems easy enough to test!

Basically, what we as human singers have here is a classification task:
given a sequence of shapes, convert it into a sequence of pitches. The
letters-in-a-word hypothesis predicts that it's possible to get good
performance on this task just by looking at short local sequences of
shapes --- and in particular, that performance based on sequences of,
say, three or four shapes will be much better than performance based on
single shapes.

And if *humans* are getting good performance by looking at these very
simple features --- I mean, really *just* these features, not sneaking
in anything fancier --- then a computer should be able to do the same.

So, I got MIDI files for every song in the Sacred Harp (thanks, Cait!)
and trained me a classifier.

The details are a bit different, but the basic idea is like the one
behind a very simple autocorrect system:

-   The autocorrect system asks, "Given the last few words they've
    typed, and given the current word they typed is `i-d`, are they more
    likely to have meant *is* or *id*?"
-   A shape-to-pitch system asks, "Given the last *n* shapes we saw, and
    given the current shape is a *fa*, is it more likely to represent scale
    degree *1* or scale degree *4*?"

And if I'm right, performance for *n=3* or
*n=4* should be substantially better than
performance for *n=1*.

Being wrong
-----------

And after a pleasant morning of hacking, it turns out I am *super
wrong.*

<table style="width:21%;">
<colgroup>
<col style="width: 5%" />
<col style="width: 15%" />
</colgroup>
<thead>
<tr class="header">
<th>n</th>
<th>accuracy</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>1</td>
<td>73%</td>
</tr>
<tr class="even">
<td>2</td>
<td>74%</td>
</tr>
<tr class="odd">
<td>3</td>
<td>75%</td>
</tr>
<tr class="even">
<td>4</td>
<td>76%</td>
</tr>
<tr class="odd">
<td>5</td>
<td>75%</td>
</tr>
</tbody>
</table>

The high accuracy for *n* = 1 is not startling: shapes are, at worst,
two-ways ambiguous, so we could have beaten 50% accuracy *without even
looking at training data.* The disappointing part is that 2 ≤ *n* ≤ 5
are scarcely any better.

Despite my own intuitions about my own singing, it turns out that
grouping shapes into "words" does next to nothing to take away their
ambiguity.

So...?
------

What does this leave? What are people who "read shapes but not staff
notation" doing? Here's a few things I can think of:

-   Not really reading the shapes, but using them as a mnemonic for a
    tune they've memorized.
-   Reading staff notation better than they claim, and using the shapes
    as an extra boost. (I know this is how *I* use the shapes --- maybe
    the difference between me and them isn't that I'm better at reading
    staff notation, but that they're more modest than me?)
-   Grouping shapes into "words" after all, but doing it in a more
    sophisticated way, maybe taking rhythm or bar lines into account.
-   Ignoring most features of the staff notation, but using one or two
    to disambiguate the shapes.

I'm especially intrigued by that last possibility. For instance, maybe
shapes-plus-"is this a high note or a low note?" gives enough
information. Or maybe it's shapes-plus-direction, so that the "words"
singers recognize aren't just "fa-la-so" but "fa↗la↗so" or "fa↘la↘so"?
