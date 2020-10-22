The hard part(s)
================

In the last section I imagined a Fancy Linguistic Resource that would
let you automate linguistic examples the way we already automate API
examples --- so you might write this

> {% for word in \["luo", "gignomai", "ekho"\] %} {{ word.pp1 }}, {{
> \_.pp2 }}, {{ \_.pp3 }}, {{ \_.pp4 }}, {{ \_.pp5 }}, {{ \_.pp6 }} {%
> endfor %}

and get this

> luo, luein... ... ...

There's a few obvious challenges here.

One hard part is **the entire %\*&\#$% field of computational
linguistics.** I mean, I'm exaggerating. Sort of. The kind of Fancy
Linguistic Resource I'm imagining in the last section is hardly
cutting-edge. It does exist in free versions for some languages, and in
proprietary versions for a lot more. But writing one is nontrivial.
There are things that might make it easier, and I may write about some
of them in a future section, but even with the best tools it's going to
be a Real Programming Task, requiring thought and effort and testing and
debugging and time.

So okay. Programming is hard. I've got this idea that we can make it a
bit easier by **building a nice framework.** I think there's a gap here
that could stand to be filled:

-   I've seen lots of nice libraries that do morphological analysis for
    specific languages, or specific types of language, but fail in the
    general case.[^1]
-   There's SIL's tools, which are Great both in the sense of
    'wonderful' and in the sense of 'massive' --- most recently FLEx,
    which is a sort of turnkey solution for fieldworkers that bakes in
    half of linguistics and linguistic anthropology but won't really let
    you look under the hood.
-   There's the old-fashioned tough-guy approach where you chug five
    Mountains Dew, download XFST or FOMA, and start stringing together
    massive regexps with nothing to protect you but your knife, your
    wits, and your copy of Beesley and Karttunen.

What I dream of is a programming framework for computational morphology
that supports you rather than getting in the way: gives nice error
messages, makes testing and modularity easy, offers one or two Obvious
Right Ways to deal with a lot of common things (including the so-called
"irregular" things that every damn language does, like suppletion and
defectiveness) and still gives you room to code up custom solutions to
the truly weird edge cases that inevitably arise.

I think theoretical morphology has some useful things to say about how
to do this.[^2] That'll be another post too.

The last hard part is **gluing all the pieces together** --- and, in
particular, finding a combination of finite state, templating, and
document markup libraries that interoperate nicely. With the release of
Pynini and better Unicode support coming to Jinja, Python is now looking
pretty good for this, and I think a system like the one I handwaved at
in the examples up above would be pretty easy to bash together out of
existing parts. That'll be yet another post.

Dog food for conlangers
-----------------------

[^1]: One way this happens is geographical or typological
    overspecialization. FOO has a delightful syntax for dealing with the
    sort of complicated vowel contraction you get in Classical Greek,
    but it just won't do reduplication or infixes, so for Tagalog or
    Arabic it's a non-starter.

    Another way it happens is by baking in too many ideas about what
    levels of representation you might need. Spelling, morpheme
    segmentation, morpheme-by-morpheme gloss, and free translation are
    all pretty standard. But hard-coding that hierarchy is a mistake.
    What happens when you're working with Mandarin and you want these as
    your levels of representation?

    <table>
    <tbody>
    <tr class="odd">
    <td>一本書</td>
    <td>Traditional characters</td>
    </tr>
    <tr class="even">
    <td>一本书</td>
    <td>Simplified characters</td>
    </tr>
    <tr class="odd">
    <td>/i⁵⁵ pən²¹⁴ ʂu⁵⁵/</td>
    <td>IPA pronunciation</td>
    </tr>
    <tr class="even">
    <td><em>i1 pên3 shu1</em></td>
    <td>Wade-Giles romanization</td>
    </tr>
    <tr class="odd">
    <td><em>yīběn shū</em></td>
    <td>Mandarin Pinyin romanization</td>
    </tr>
    <tr class="even">
    <td>‘one book’</td>
    <td>Free translation</td>
    </tr>
    </tbody>
    </table>

[^2]: Computational linguistics has a reputation for just straight-up
    ignoring theoretical linguistics. In particular, theoretical syntax
    and semantics have constructed incredibly concise and elegant formal
    tools which actual software developers pretty much always just chuck
    aside in favor of big, sloppy, ugly machine learning models trained
    on a big, sloppy, ugly pile of real-world data. (This annoys some
    people and delights others, but whatever, it turns out *it's what
    works.*) Interestingly, though, morphological tools --- things like
    stemmers LINK and word generators LINK --- don't follow this
    pattern. The computational tools follow the same approaches that the
    theorists argue about: EXPLAIN.
