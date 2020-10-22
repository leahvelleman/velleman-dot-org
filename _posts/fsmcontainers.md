Finite state machines are most often used as an abstract model of
computation, or as a concrete representation of a stateful process. But
another way of treating them is as container types: Finite state
acceptors correspond to *sets* --- sometimes very large, and indeed
potentially infinite ones. And finite state transducers correspond to
key--value *mappings* --- though with a few quirks.

I'm going to argue here that these correspondences can give us a
friendlier, more Pythonic way of interacting with FSMs than existing
Python FSM libraries offer.

Finite state machines as Python container types
===============================================

Finite state machines are most often used as an abstract model of
computation, or as a concrete representation of a stateful process. But
another way of looking at them is as *containers*:

-   Finite state acceptors correspond to *sets* --- sometimes very
    large, and indeed potentially infinite, ones.
-   Finite state transducers correspond to key--value *mappings* ---
    though with a few quirks that standard mapping types don't have:
    they're invertible; they're composable; in the general case, they
    can be one-to-many or many-to-many; and they have very different
    time characteristics than hash maps, sometimes for better and often
    for worse.

I'm going to argue here that these correspondences can give us a
friendlier, more Pythonic way of interacting with FSMs than existing
Python FSM libraries offer.

Things you might have wanted instead
------------------------------------

There's actually a bunch of other things you can do with these
correspondences instead. [This post by Andrew Gallant describes a Rust
package that uses them to efficiently handle very, very, VERY large sets
and maps](http://blog.burntsushi.net/transducers/). If you're looking
for similarly efficient sets and maps for Python, [his crate has Python
bindings](https://pypi.python.org/pypi/rust-fst). Interestingly, the
optimizations he makes for space and time efficiency end up taking away
some of the positive quirks of finite state machines: no more infinite
sets, no more one-to-many mappings, no more composition or inversion.

But what if we want to keep those quirks?

In fact, at that point you might not want to use FSMs after all. If you
just need an invertible mapping for Python, use
[bidict](https://pypi.python.org/pypi/bidict). If you just need a
one-to-many mapping, there are several actively maintained `multidict`
implementations. If you need to test strings (or things representable as
strings) for membership in an infinite set, you might want a regex
library ---albeit possibly [one that's implemented using FSMs under the
hood](https://github.com/facebook/pyre2/).

Still with me? Okay.

Pythonicity, interoperability, and explorability
------------------------------------------------

The other reason you might want to have FSM-based container types is
*Pythonicity* --- which, in the Python world, goes hand-in-hand with
interoperability and ease of explorations.

### Mappings and iterators are Python's swiss-army-knife types

Python uses mappings in a *lot* of places. Namespaces are `dict`s.
Keyword argument lists are `dict`s. In most template engines, contexts
for rendering templates are `dict`s. Half the time the answer to "How do
I do *X* if there's no `case` statement?" is "With a `dict`." Database
interfaces probably aren't literal `dict`s, but they're sometimes other
kinds of mapping class. Counters are non-`dict` mappings.

The upshot of all this is that, if you have a mapping in the form of a
finite state transducer, and you want to pass it along to some other
library, giving it the same `dict`-like interface as Python's other
mapping types goes a long way towards making that possible. But just
saying `dict(iteratorOverMyFST)` is wasteful at best, since it means
iterating over every possible path through the FST --- and impossible at
worst, since FSTs can have infinitely many paths. Better to wrap the FST
in a new mapping class that implements `__getitem__` and `__len__` and
`keys()` and friends.

### Iterators are explorable

Related to this is Python's special syntax for working with mappings and
especially with iterators --- which new users often learn very early on,
and which power users continue to rely on, especially when tinkering. I
wouldn't be surprised if most people learning Python as their first
language learn the syntax `for x in xs` before they learn
`x.someMethod()`. And even now, if you're in the Python shell and this
happens :

    >>> foo
    <InscrutableCollection object at 0xface1e55>

when you expected a readable representations of `foo`’s contents, I bet
the next thing you try is this:

    >>> list(foo) 

--- which relies on the tacit assumption that anything that *can* be
made iterable probably *will* be, even if nobody's bothered to give it a
useful `__repr__`.
