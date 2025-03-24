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
  \once
  \once \override TextSpanner.minimum-length = #10
  %\once \override TextSpanner.bound-details.left.stencil-align-dir-y = #0.4
  %\once \override TextSpanner.bound-details.right.stencil-align-dir-y = #-0.2
  \once \override TextSpanner.style = #'line
  \once \override TextSpanner.bound-details.right.arrow = ##t
  %\once \override TextSpanner.bound-details.right.stencil-align-dir-y = #CENTER
  %\once \override TextSpanner.bound-details.left.stencil-align-dir-y = #CENTER
  % \override TextSpanner.bound-details.right.Y = #2
  \once \override TextSpanner.bound-details.left.text = \markup { \musicglyph "scripts.stopped" " "}
  \once \override TextSpanner.bound-details.right.text = \markup { \musicglyph "scripts.open"}
  \once \override TextSpanner.bound-details.left-broken.text = \markup \null
  \once \override TextSpanner.bound-details.right-broken.text = \markup \null
  \log \afterGrace 15/16 <e, a d g b e>4\startTextSpan\dal-niente { s32\stopTextSpan } 
  \tuplet 3/2 { e'''16[(\accent\sfz  cis b) } \tuplet 3/2 { b16( fis e)] }
  \tuplet 6/4 { fis16([ b,) cis( d,) \tuplet 3/2 { \xNotesOn fis,\staccato f\staccato e]\staccato \xNotesOff } }
  <<
    {\voiceOne
     \arpeggioArrowUp
     \xNotesOn <d' g b e>16\arpeggio \xNotesOff \arpeggioNormal
     s16 s8
    }
    \new Voice { \voiceTwo
                 \once \hide Stem
                 \pitchedTrill b8\accent^\startTrillSpan\glissando\> cis s16
                 \once \hide Stem
                 \parenthesize gis16\pp \breathe
    }
  >> \oneVoice
  
}

guitarPart = \new Staff = "guitar_staff" \with {
  instrumentName = "Chitarra elettrica"
  \remove "Time_signature_engraver"
  \remove "Bar_engraver"
  \consists "Bar_number_engraver"
} << \guitar \global >>

textPart = \new Staff = "text_staff" \with {
  instrumentName = "Voce recitante"
  \remove "Time_signature_engraver"
  \consists "Bar_number_engraver"
} << \text \global >>

music = {
  <<
    \tag #'score \tag #'text \textPart
    \tag #'score \tag #'guitar \guitarPart
  >>
}