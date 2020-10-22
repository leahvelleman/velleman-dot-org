---
layout: post
---
I've been fascinated for a while by the idea of generative poetry.
Recently I started tinkering with it myself, and my first experiment is
working well enough that I've set it up as a Twitter bot:
@watts\_ebooks, tweeting randomly generated hymn stanzas in the style of
Isaac Watts, such as this (ethically and theologically dubious!)
example:

> *with solemn fear, with deep*  
> *repentance drown mine eyes*  
> *to god most holy, just and true,*  
> *but deal in theft and lies.*

Who?
----

Watts is hardly a household name anymore, unless you're a Protestant
church musician or a Sacred Harp singer, but in his own way he was one
of the most influential poets in the English language. He wrote hymns
for church use, including English translations of many of the Psalms.
His best-known poems include *Joy to the World,* *O God Our Help in Ages
Past,* and *This is the Day the Lord Has Made.*

Why?
----

Watts's writing has a few features that make it especially convenient
for this sort of project:

1.  His poems have extremly *consistent meter.* The majority are in
    Common Meter (also known as "what Emily Dickinson wrote in" or "that
    kind of stanza that you can sing to the tune of the Gilligan's
    Island theme song"), and nearly all the rest are in some other
    iambic meter.
2.  Within his poems, the meter is *extremely regular.* This sets him
    apart from the other famous Common Meter author, Emily Dickinson,
    whose poetry stretches the rules quite a bit.
3.  He was *incredibly prolific,* credited with over 750 hymns.
4.  He *revisits the same imagery* again and again in his poems — mostly
    themes from the Bible and from nature.

The first two features make his poetic meter very easy for a computer to
imitate. The next two solve some problems with data sparseness that come
up when you try to generate text from a limited corpus.

How?
----

The easiest way to generate semi-coherent text is using a Markov chain.
The algorithm looks like this:

1.  Choose a *corpus* — a source text that you want to imitate.
2.  Start with a single, randomly chosen word — call it `w[1]`
3.  Given a word `w[n-1]`, generate the next word `w[n]` by consulting
    the corpus: find words which are present after `w[n-1]` in the
    corpus, and choose one of them randomly.

Step 3 can be repeated as long as you like, and the generated text can
be made more realistic by considering longer sequences of words. For
instance, you might generate `w[n]` based on `w[n-3:n]`.

Poetry raises two extra challenges: meter and rhyme.

### Dealing with meter

English poetry requires stressed and unstressed syllables to alternate
in a particular pattern. We need some way to make this alternation
happen in the text we generate.

One way to do this would be to use a pronouncing dictionary, like CMU's
free one. The CMU dictionary tells you, for any English word, how it is
broken up into syllables, and which syllables count as stressed. You can
use it to require stressed and unstressed syllables to alternate in a
particular way in your generated text. (The easiest way is by trial and
error: if the word you choose randomly in step 3 doesn't fit the meter,
throw it away and choose a different one.)

The way I did it in this project is slightly different. My algorithm
keeps track of its location in the line of poetry it is generating,
measured by how many syllables it is away from the beginning of the
line. It uses this information in choosing random words. For instance,
if it is choosing a word that will start on the third syllable of a
line, it looks for words that Watts used on the third syllable of one of
*his* lines, and chooses randomly from among *those* words.

This only works because of Watts's incredibly regular meter. It turns
out that, for instance, the third syllable in a line of Watts's poetry
is *always* unstressed — and the fourth syllable is always stressed, and
so on. If there were any variation there, this trick would fail.

This trick also turns out to do a very good job of imitating one of the
most recognizable qualities of Watts's poetry: its very square, stodgy
character, which comes from starting and ending sentences almost
exclusively at the beginnings and ends of lines. (In English-major
terms: he used very little *enjambment.*) Here's an example @wattsbot
poem showing off this property.

> *for thou alone dost wondrous things,*    
> *for thou alone dost thou not raise.*    
> *my panting heart cries out for god;*    
> *my god! how wondrous are his ways!*  
 
On the other hand, it also makes it harder to generate complete poems.
The algorithm often paints itself into a corner, ending up with no way
to go forward because there are too few possible words that occur after
a specific word combination and on a specific syllable. In the
twitterbot version, I've relaxed this constraint, so that it only tracks
whether it is on an even or an odd syllable. This raises the rate of
enjambment some, as in the example below, but makes it harder for the
algorithm to get bogged down.

> *nor shall my head be lifted high*  
> *above their utmost rage, and face*      
> *a sojourner below, as all*    
> *my trust; thou hast preserved my face*  

### Dealing with rhyme

The easiest way to deal with rhyme is to generate text backwards.

You can make rhyming poetry while generating text forwards, but you end
up wasting a lot of effort. If you want to generate a rhyming couplet,
what you have to do is generate two whole lines of poetry — and then
throw the second one out and generate it all over again if it does not
rhyme with the first. Generating and throwing away whole lines of poetry
makes the process slow.

Working backwards means less wasted effort. Here's how you generate a
rhyming couplet backwards. First, generate the second line. Then, start
choosing possible words for the end of the first line. If the word you
choose does not rhyme, throw it out and choose another one. Because
you're only generating and throwing away a single word, and not a whole
line, the process runs faster.

(But how do you tell if two words rhyme? Here, again, the CMU
pronouncing dictionary comes to the rescue.)

Lessons learned
---------------

The thing that surprised me most was that such a dumb algorithm could
work so well. (This is a common surprise in natural language processing
— to the point that it probably shouldn't surprise anyone anymore. And
yet it does!) I'd expected that the trick of keeping count of syllables
would fail miserably, but thought that seeing *how* it failed could be
interesting. Instead, it worked well enough to keep, and I was spared
the task of coming up with some deeper analysis of Watts's meter.
