
\version "2.20.0"
#(set-global-staff-size 15)
\paper{
    indent=0\mm
    #(define dump-extents #t)
    page-breaking = #ly:one-line-auto-height-breaking
    paper-width = 4\in
    left-margin = 3\mm
    right-margin = 3\mm
    top-margin = 0
    bottom-margin = 1\mm
    oddHeaderMarkup = ##f
    evenHeaderMarkup = ##f
    oddFooterMarkup = ##f
    evenFooterMarkup = ##f
    ragged-right = ##t
    system-count = #1
}
\layout {
  \context {
    \Lyrics
    \override LyricText #'font-size = #-1
    \override LyricText #'font-name = "Times New Roman,"
  }
}
         \new StaffGroup <<
   \new Staff = "treble" {
    \set shapeNoteStyles = ##(la mi fa #f la fa #f)
    \key e \minor \relative c'' {
        b2 b4 b4 | g2 g | a4 c b2| b b4 b | b2 a | g4 e b'2 b b4 e | d2 e | b4
        b d2 | d d4 c | b2 g4.( a8) | b4 b b2
   }
   }
   \new Staff = "alto" {
    \override Accidental #'color = #red
    \set shapeNoteStyles = ##(la mi fa #f la fa #f)
    \key e \minor \relative c'' {
        e,2 e4 e e2 \once\override NoteHead #'color = #red g fis4 e
        \once\override NoteHead #'color = #red fis2 \once\override NoteHead
        #'color = #red d2 e4 e e2 d2 \once\override NoteHead #'color = #red b4
        \once\override NoteHead #'color = #red cis \once\override NoteHead
        #'color = #red d2 g2 fis4 g d2 e d4 \once\override NoteHead #'color =
        #red d \once\override NoteHead #'color = #red d2 fis2 g4
        \once\override NoteHead #'color = #red fis e2 e \once\override
        NoteHead #'color = #red dis4 \once\override NoteHead #'color = #red
        dis  e2
    }
   }
   \new Staff = "tenor" {
    \override Accidental #'color = #red
    \set shapeNoteStyles = ##(la mi fa #f la fa #f)
    \key e \minor \relative c'' {
        g4.( fis8) e4 e | b'2 b | a4 g fis2 | g4.( fis8) e4 e | e'2  f4( e) |
        d c b2 e2 dis4 e | \afterGrace b2 { \once\override NoteHead #'color =
        #red a8 } g2 | d'4 \afterGrace b4 { \once\override NoteHead #'color =
        #red a8 } a2 a b4 e, | \afterGrace g2 { a4 } \afterGrace  b2 { a4 } |
        g4 fis e2
    }
   }
   \new Staff = "bass" {
    \set shapeNoteStyles = ##(la mi fa #f la fa #f)
    \key e \minor \clef bass \relative c {
        e2 e4 b | e2 e | d4 e b2 | b e4 e | g2 d | \once\override NoteHead
        #'color = #red d4 e b2  e b'4 b | g2 b | g4 e d2 | d g4 g8.[ fis16] |
        e2 e | b4 b e2
    }
   }
   \new Lyrics \lyricsto "alto" {\lyricmode {Thou man of grief re - mem - ber me}}
   >>

