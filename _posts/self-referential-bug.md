May 14 2015

A bug that describes itself
===========================

Today I found a bug that describes itself. In fact, it tells you how to
fix itself.

It gives you this advice completely by accident: it is not in the form
of a helpful error message created by the programmer. What the bug does
is ---*accidentally,* instead of the desired behavior --- cause a Google
search to be run; and that Google search returns a number of blog posts
documenting the bug itself.

That means the bug is also arguably self-referential: the bug involves a
description of itself (or, more precisely, involves a search term that
is most commonly used in descriptions of the bug itself).

This blog uses Jekyll as a blog engine. \[Ed: Used to use, anyway.\]
Jekyll has a local server mode in which it puts your blog up at a fake
IP address, so that you can preview it in your web browser without
needing to upload it elsewhere.

The default fake IP address it uses is <span
class="title-ref">0.0.0.0:4000</span> — which is not a valid destination
IP address. Still, most browsers in the past have been happy enough to
treat it as one.

But the latest version of Google Chrome *doesn't* recognize it as an IP
address. Instead, it does what Chrome normally does with things that
aren't IP addresses: it runs a Google search for it!

And it turns out what you get when you Google "0.0.0.0:4000" is… a long
list of posts by people complaining about this very bug in Jekyll, and
offering solutions.

In other words...

*Bug \#12345*  
Expected behavior: Serves up a local version of my blog.  
Actual behavior: Shows me a list of posts by other people — most of
which describe, and explain how to fix, Bug \#12345.
