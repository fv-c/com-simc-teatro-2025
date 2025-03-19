\version "2.24.3"

\include "../../fv-lib-lilypond/definizioni_personali.ily"
\include "../../fv-lib-lilypond/custom-script-articulations.ily"
\include "../../fv-lib-lilypond/custom-stencils.ily"
\include "../../fv-lib-lilypond/custom-spanners.ily"

global = {
  s1
}

text = \relative c' {
  \override Staff.TimeSignature.stencil = ##f
  \override Staff.Clef.stencil = #(lambda (grob) 
                                    (let* ()
                                      (grob-interpret-markup grob #{ \markup \general-align #Y #0 \sans \bold \tiny "T" #})
                                      )
                                    )
  \clef alto
  R1
}

guitar = \relative c' {
  \romanStringNumbers
  \override StringNumber.font-shape = #'upright
  \set stringNumberOrientations = #'(left)
  \set fingeringOrientations = #'(left)
  \clef G
  R1
}

guitarPart = \new Staff = "guitar_staff" \with {
  instrumentName = "Chitarra elettrica"
  \consists "Bar_number_engraver"
} << \guitar \global >>

textPart = \new Staff = "text_staff" \with {
  instrumentName = "Voce recitante"
  \consists "Bar_number_engraver"
} << \text \global >>

music = {
  <<
    \tag #'score \tag #'text \textPart
    \tag #'score \tag #'guitar \guitarPart
  >>
}