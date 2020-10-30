relativeFaPitchNames = #`(
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
  (Fa . ,(ly:make-pitch -1 0 NATURAL))
  (So . ,(ly:make-pitch -1 1 NATURAL))
  (La . ,(ly:make-pitch -1 2 NATURAL))
  (fa . ,(ly:make-pitch -1 3 NATURAL))
  (fi . ,(ly:make-pitch -1 3 SHARP))
  (so . ,(ly:make-pitch -1 4 NATURAL))
  (si . ,(ly:make-pitch -1 4 SHARP))
  (la . ,(ly:make-pitch -1 5 NATURAL))
  (mi . ,(ly:make-pitch -1 6 NATURAL))
)
pitchnames = \relativeFaPitchNames
#(ly:parser-set-note-names relativeFaPitchNames)


fasola =
  #(define-music-function (parser location k m)
                          (ly:pitch? ly:music?) 
    (let* ((transposePitch (if isMajor #{ Fa #} #{ la, #})))
     #{
       \transpose #transposePitch \pitch { \relative $k { $m } }
     #}
    )
  )

