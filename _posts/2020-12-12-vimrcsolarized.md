---
title: Showing what's reachable in Vim and Tmux (and Solarized)
series:
layout: post
draft: true
---
<style>
span.aside {display: inline; float: right; position: relative; width: 20vw; margin-right: -22vw;font-size: 14px; color: var(--comment); clear: both; margin-bottom: 1em;}
    .language-bash div, .language-bash div pre, .language-bash div pre code {background-color: #073642; }
    .language-vim div, .language-vim div pre, .language-vim div pre code {background-color: #073642; }
    body {background-color: #002b36; color: #93a1a1; }
    a {color: var(--blue); }
    code { background-color: #073642; }
    pre.highlight { color: #93a1a1; }
    span.k, span.nb, span.nt {color: #859900 !important; }
    span.m {color: #2aa198 !important; }
    span.s1 { color: #dc322f !important; }
    span.aside { color: #839496 !important; }
</style>

<span class="aside">This version of the post uses a low-contrast
color scheme called Solarized. It's also available in an accessible
high-contrast version. Flip the switch to try both.</span>

<div style="width: 300px; margin: 30px auto 30px;" >
<div style="display: inline; padding: 0.5em 1em; background-color: var(--solarized1); border-radius: 6px 0 0 6px; border: 1px solid var(--blue);">
<a href="{% post_url 2020-12-12-vimrc %}" style="color: var(--blue);">
  Accessible colors
</a>
</div>
<div style="display: inline; padding: 0.5em 1em; background-color: var(--blue); border-radius: 0 6px 6px 0; border: 1px solid var(--comment);">
<a href="{% post_url 2020-12-12-vimrcsolarized %}" style="color: var(--solarized1);">
Solarized
</a>
</div>
</div>

I use Tmux to manage terminal window real estate and Vim to edit text. A
year ago, my setup had a bunch of fancy status bars. Now it looks like this:

{% include img.html src="/assets/images/newvim.png"
      alt="A plain multi-pane terminal layout, with some panes on a darker background" %}

"Oh," you might think, "This is going to be a lecture about simplicity. She's going to tell me to make do with less information."

But this isn't less information. It's just **the right information.** It tells me,
moment by moment, 
**what is possible** from where I am.

## Confusing possibilities
Using Tmux and Vim together meant the answers to questions
like these were unpredictable:
- What keybindings do I use to navigate to that piece of text?
{% include sidenote.html n="1" id="keybindings" text="Vim and Tmux have
different keybindings for moving between regions.  All Tmux keybindings begin
with a leader, which it intercepts so that no Vim keybindings can use the same
leader." %}
- What macros can I use on it?
{% include sidenote.html n="2" id="macros" text="You can record a Vim macro
that travels to other Vim windows, does things there, and returns. You can't
record a macro that travels to other Tmux panes." %}
- Can I search in it from where I am?
{% include sidenote.html n="3" id="search" text="Vim search using `/`
highlights search results in other windows of the current session, but not in
other Tmux panes.  (Tmux search is similarly limited and less useful.)" %}
- What copy-and-paste features can I use to bring it to me?
{% include sidenote.html n="4" id="copy" text="Vim and Tmux use different clipboards. 
Now, ok, with enough cleverness, you can automatically take anything copied
into one clipboard and duplicate it into the other one. This means you
don't have to remember whether something is in the Vim clipboard or the
Tmux one.  But isn't a total solution. Vim actually has a much richer set of
copy-and-paste features than Tmux: multiple named registers, for instance.
So if you want to use a named register, you still have to know whether the
place you're copying to is in the same Vim session as the one you're
copying from." %}
- Could I accidentally hide it by doing something mundane where I'm working?
{% include sidenote.html n="5" id="suspend" text="If you suspend a Vim session
using `^Z`, all of its windows are hidden at once, but nothing in other Tmux
panes is hidden." %}
- Could I accidentally destroy data in it?
{% include sidenote.html n="6" id="destroy" text="If you quit a Vim session
without saving using `:qa!`, or if you kill its parent Tmux pane using `^B x`,
changes in all of its Vim windows are lost, but nothing in other Tmux panes is
lost." %}

These are the *very most important* pieces of information to have about 
something on my screen. Without knowing the answers, I can't work. 

Using Vim alone, or Tmux alone, the answers are consistent. Using them
together, the answers were different for different regions of my screen, and
changed every time I moved to a different region. And when they did change, I didn't
get any visual indication of the new answers.

It was like cooking while somehow being unable to judge the distance to my
tools. Sure, I could stop and *think* about whether that potholder was within
reach. But I couldn't just instinctively grab it when my pot boiled over.

## The new setup

With the new setup, the answers are right there.

This pane, with a black background and an emphasized cursor line, is my current Vim
pane. This is as far as I can "reach" with Vim editing commands and cursor movement
commands.

{% include img.html src="/assets/images/newvimcurrent.png"
      alt="A plain multi-pane terminal layout, with some panes on a darker background" %}


If there are other panes with black backgrounds, they're part of the same Vim
session as me. This is as far as I can "reach" with Vim pane-switching
commands (and macros that contain them), "carry" things with Vim registers, 
and so on.

{% include img.html src="/assets/images/newvimdark.png"
      alt="A plain multi-pane terminal layout, with some panes on a darker background" %}


Panes with faded gray backgrounds are outside my Vim session. I can only "reach" them
using Tmux commands.

{% include img.html src="/assets/images/newvimlight.png"
      alt="A plain multi-pane terminal layout, with some panes on a darker background" %}


To support this, I've **restyled nearly everything else** to make **background
color immediately legible.** 

This means that when I look at a screen region, its reachability is the first
thing I notice, before I even focus my eyes to read a word of text. And when
I'm working in one region, I can tell what other regions my actions might
affect without looking away, just by their color in my peripheral vision. 


## The details

`.vimrc` and `.tmux.conf` settings are *personal.* So I'm going to talk through 
this step-by-step and explain what the settings do. I think these work well as
a package deal, but you might disagree.

### Prerequisites
This setup works with any color scheme that has two usable background colors.
This version of this post is written for Solarized, which meets this criterion
but puts its terminal colors in "untraditional" locations. If you are
using a more traditional terminal color scheme, see the <a href="{% post_url
2020-12-12-vimrc %}">traditional version of the post</a>.


### Background colors

Give the current Tmux pane a higher-contrast color scheme: the darkest possible
background and the lightest forground color.  Give other Tmux panes a
lower-contrast color scheme, which will again show through.  In `.tmux.conf`:
```bash
set -g window-style 'fg=colour8, bg=colour7'
set -g window-active-style 'fg=colour0, bg=colour15'
```

Give Vim a transparent background so that the Tmux background colors
show through.  In `.vimrc`:
```vim
highlight Normal ctermfg=0 ctermbg=None
```

Only show the cursor line in the active Vim region.  This 
distinguishes it from inactive ones in the same Tmux pane. In `.vimrc`:
```vim
set cursorline
autocmd WinEnter,BufEnter,BufWinEnter * set cursorline
autocmd WinLeave,BufLeave,BufWinLeave * set nocursorline
highlight CursorLine cterm=None ctermbg=7
```


Since the lower-contrast color scheme means "you interact with this using
Tmux," also give it to the Tmux status bar — but use a brighter foreground
color for the name of the current window so that it stands out.  In `.tmux.conf`:
```bash
set -g status-style 'fg=colour8, bg=colour7'
set -g window-active-status-style 'fg=colour8, bg=colour7'
```

### Visual quiet

#### Faint borders
Traditional Vim windows are surrounded by a full character's worth of color.
Change it to something less eye-catching.

Vertically, the wide bar of color comes from the `VertSplit` highlight group.
Override that by blanking the (wide) background and making visible the (narrow)
foreground.  In `.vimrc`:
```vim
highlight VertSplit cterm=None ctermfg=8 ctermbg=None
```

Horizontally, it comes from the status line. 



#### Distinguish the status line
Traditionally, the status line has a strong background color. 

Often people use a fancy status line, like Airline or Lightline, that is even
more colorful than the default. If you're using one of those, you'll need
to disable or uninstall it.

Instead, give the status line a blank background, a low-contrast text color,
and underlined text. This underline forms the horizontal border for Vim windows.

![](/assets/images/statusbar.png)

In `.vimrc`:
```vim
highlight StatusLine cterm=underline ctermfg=8 ctermbg=None
highlight StatusLineNC cterm=underline ctermfg=8 ctermbg=None
```
Without a visible background, it's possible to mistake the status line for
a line of text or code. The low-contrast color helps some; but low-contrast
text is also sometimes used for things like code comments.

If your terminal allows for italicized text and you don't use it elsewhere,
italicizing the status line is a nice option. Otherwise, I find it's enough
to distinguish it using strings of text that never appear in my day-to-day
work. For instance, I never find myself editing a line of text that begins
and ends with two periods and a space. 

Write a bare-bones status line and style it with double periods.  


In `.vimrc`:
```vim
set statusline=..\ %F\ ..
set statusline+=%=
set statusline+=..\ %l/%L\ ..
```

(Writing your own statusline is its own topic. Here `%F` produces the full
path to the current file, `\ `  produces a literal space, `%=` produces a
horizontal gap, and `%l` and `%L` are the current line and the total line count.)


#### Line numbers, the sign column, and the fold column

To prevent swaths of misleading background color, specify a transparent background
for special columns that appear to the left of a Vim window. Instead, distinguish
them from surrounding text using the foreground color.  In `.vimrc`:
```vim
highlight LineNr ctermfg=8 ctermbg=None
highlight LineNrAbove ctermfg=8 ctermbg=None
highlight LineNrBelow ctermfg=8 ctermbg=None
highlight CursorLineNr ctermfg=8 ctermbg=None
highlight FoldColumn ctermfg=8 ctermbg=None
highlight SignColumn ctermfg=8 ctermbg=None
```
#### Fold lines

The horizontal marks used for folds are especially tricky for this style, because
by default they use both a background color and underlining. To prevent
swaths of misleading background color _or_ underlines that can be mistaken for
region boundaries, mark them with foreground color instead.

![](/assets/images/foldline.png)

In `.vimrc`:
```vim
highlight Folded cterm=bold ctermfg=2 ctermbg=None
```

## Accessibility

Solarized works well for people who can read low-contrast text and distinguish a 
wide range of colors. 

Getting the full benefit of this setup requires something additional: that you
be able to distinguish very similar colors in your peripheral vision;
otherwise, you might not get complete information about the reachability of
regions you're not working in. If you find that difficult with Solarized, a
higher-contrast color scheme may still be worth trying.




