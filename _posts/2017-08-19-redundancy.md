---
layout: post
title: Can linguists and doc writers share tools?
---

API documentation has lots of examples. Examples tend to be redundant
---you show a statement *and* the result of evaluating it, even though
the one can usually be predicted from the other.

```python
>>> print("You can guess what the next line will say.") 

You can guess what the next line will say.
```

Linguistic writing also has lots of examples. Usually those are also at
least a little redundant, at least if you speak the language.

    (1) Puedes adivinar lo que dirá la siguiente línea.  
        'You can guess what the next line will say.'

What if this means that linguists and doc writers can share tools?

Linguistic examples and doc examples
------------------------------------

Where does the redundancy in linguistic examples come from? For the
benefit of people who don't speak the language you're writing about, you
show the same form at several *levels of representation* — spelling,
pronunciation, segmentation, gloss, etc.

    (2) Así se hace un ejemplo lingüistico.
        [a.'si se 'a.se uŋ e.'χem.plo liŋ.'gwi.sti.ko]
        así  se   hac-e    un     ejemplo      lingüistic-o
        thus REFL make-3sg a.MASC example.MASC linguistic-MASC
        'This is how you make a linguistic example.'

You could easily write a program to generate the pronunciation line of
that example from the spelling line, just like Python generates output
from input in an interactive session. Going the other way would be
harder; you lose some information in Spanish when you go from spelling
to pronunciation --- despite its reputation for "phonetic spelling," it
has lots of word pairs, like *como* and
*cómo* or *casar* and *cazar*,
that are spelled differently but pronounced the same.

Software doc examples are similar. You could definitely think of the
input and output here as two representations of the same information:

```python
>>> sorted(set("aeiouy"))  

['a', 'e', 'i', 'o', 'u', 'y']
```

(And there already *is* a program that generates one from the other:
Python itself.) Going the other way is harder, because some information
is lost — you don't know whether `{'c', 'd', 'r', 'b', 'a'}` corresponds
to `set('abracadabra')` or `set('drab') + set('car')` or what — but
there's still enough redundancy there that people have found ways to
benefit from it.

Uses for redundancy
-------------------

Here are some things we do with that redundancy in the tech world:

-   **Type less/think less:** Use a runner like Dexy or Autorun that can
    auto-generate the output part of your examples, rather than entering
    it by hand.
-   **Test for consistency:** Enter the input and the output parts of
    your examples by hand, but use a tool like Doctest that will check
    one against the other and notify you if there is a discrepancy.
-   **Enrich UX:** There's lots of options here. Maybe you add a button
    to your examples that will launch the code in an interpreter. Maybe
    you make your example code editable, and update the displayed output
    after each edit.

I could see all three of these being useful in linguistics.

### Type less/think less

Here's a random linguistics-y sentence:

"Consider the form *llegues* (*lleg-ues*, 'come-SUBJ2sg'), pronounced
 `/'je.ges/`."

The **Type less/think less** option for generating it might look like
this:

{% raw %}
```python
>>> T = '''
    Consider the form {{ llegues|i }}, ({{ _|seg|i }},
    {{ _|gloss }}), pronounced {{ _|pron }}.
    '''
>>> jinja.Template(T).render(spelling)

"Consider the form <i>llegues</i> (<i>lleg-ues</i>, 
come-SUBJ2sg), pronounced /'je.ges/."
```
{% endraw %}

I'm imagining here that we have a Fancy Linguistic Resource in the form
of a `dict`-like object `spelling` that maps Spanish spellings onto
richer objects representing linguistic forms. I'm also imagining filters
`seg`, `gloss`, and `pron` that extract a segmentation, gloss, or
pronunciation from one of those objects, and a magic variable `_` that's
assigned to the last form we looked up.)

Assuming we trust our Fancy Linguistic Resource, this already saves us
thinking by reducing the chance that we'll mistype *lleg-ues* as *lelg-ues* or *lleg-eus* and not notice. (As a sometime
linguistics editor, let me tell you: proofreading segmentations and
glosses is a *real bear,* even in a language you yourself are fluent in,
because they aren't styled the way we're used to so our brains don't
spot discrepancies as fast.)

And it could save a lot of very error-prone typing in things like
conjugation paradigms. (Which again, let me tell you: *such* a pain to
proofread, *so* many sneaky errors...)

{% raw %}
```html
{% for word in ['andar','comer','vivir','pagar','traducir'] %}
  {% for features in presentparadigm %}
    <tr>
      <td> {{ features }} </td>
      <td> {{ word.inflect(features)|i }} </td>
    </tr>
  {% endfor %}
{% endfor %}
```
{% endraw %}

### Test for consistency

The **Test for consistency** option might look like this:
{% raw %}
```python
>>> T = '''
    Consider the form {{ llegues|i }}, 
    ({{ _|seg('lleg-ues')|i }},
    {{ _|gloss('come-SUBJ2sg') }}), 
    pronounced {{ _|pron("/'je.ges/") }}.
    '''
>>> jinja.Template(T).render(spelling)

"Consider the form <i>llegues</i> (<i>lleg-ues</i>, 
come-SUBJ2sg), pronounced /'je.ges/."
```
{% endraw %}

Now, instead of just trusting our `seg`, `gloss`, and `pron` filters to
give the right output, we're passing them an argument telling them what
their output should be. If their real output is different --- indicating
a typo in our document or a bug in the underlying linguistic resource
--- they could raise an error.

What does this get us? Again, it could save writer and editor time by
reducing the burden of proofreading. (I thought about titling this
section "Type *more*/think less.") It also sets up a situation where
time spent writing doc doubles as time spent debugging your Fancy
Linguistic Resource --- especially if, as is often the case for
low-resource languages, the person writing the paper and the person
maintaining the Fancy Linguistic Resource are the same person, or
colleagues on the same grant or in the same lab.

This is the scenario that got me thinking about this whole question.
During grad school I was working on a dissertation about K'ichee', a
heavily-inflected language where a single root might show up in
thousands of different forms and words regularly have a half-dozen
prefixes or suffixes. I was also working on a finite-state model of
K'ichee' morphology, because I wanted to do better OCR correction on
scans of K'ichee' manuscripts.

The Right Thing to do would have been to use my finite-state morphology
to spellcheck and consistency-test the examples in my dissertation. It
wouldn't have had great precision or recall, because it was perpetually
a work in progress. But it would have been better than no spellchecker
at all, *and* it would have turned every hour I spent on the
dissertation into at least ten or fifteen minutes of user-testing work
on the finite-state morphology.

### Enrich UX

The **Enrich UX** option might involve the same code as the other two,
but would take advantage of our Fancy Linguistic Resource to generate
extra HTML. Maybe now clicking the word *llegues* on the rendered page
takes us to its dictionary entry, or hovering over it brings up a
tooltip showing its tense, person, and number.

Is this realistic?
------------------

Someone on Twitter --- I wish I remembered who --- pointed out a while
ago that if people who learn LaTeX in grad school put the same time into
learning to do the same things with CSS, they'd have guaranteed fallback
jobs on graduation. Of course, a lot would have to change for that to
happen in a global way. But individual researchers or advisors could
always start heading in that direction….

This idea feels like it's in the same rough area of possibility space as
that one. Even if you had a Fancy Linguistic Resource for your language,
or had the inclination to make one, it would take some doing to switch
to a set of tools that would let you get the same value out of it that
doc writers get out of their runnable examples. If you already write in
LaTeX, one way to get off the ground with this sort of workflow would be
to start preprocessing your documents with a templating language like
Jinja or Mustache.

Another more drastic change would be to switch to writing in RST and
using Sphinx as a document processor, which can handle executable
examples with a little fiddling, and can output either HTML or LaTeX
code that you could submit to a journal. I'm working on a setup along
these lines for a conlanging project, to see how feasible it ends up
being.
