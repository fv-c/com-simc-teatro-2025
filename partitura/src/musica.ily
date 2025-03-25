\version "2.24.3"

\include "../../fv-lib-lilypond/definizioni_personali.ily"
\include "../../fv-lib-lilypond/custom-script-articulations.ily"
\include "../../fv-lib-lilypond/custom-stencils.ily"
\include "../../fv-lib-lilypond/custom-spanners.ily"

global = {
  \accidentalStyle neo-modern-voice
  \tempo "Serratissimo, indomito!" 4 = 118
  s1
  s2\break
  s2
  s2.. s8\break
  s1
  s1
  s4.\break
  s8 s2.. s8 s2\break
  s1 s4 \break
  s4^\markup "test"
}

text = \relative c' {
  \override Staff.TimeSignature.stencil = ##f
  \override Staff.Clef.layer = #999
  \override Staff.Clef.after-line-breaking = #(lambda (grob) 
                                    (let* 
                                     (
                                       (stil (ly:grob-property grob 'stencil))
                                       (newStil (box-stencil (grob-interpret-markup grob #{ \markup \override #'(thickness . 1.5) \whiteout \general-align #Y #0 \sans \bold \tiny "T" #}) 0.1 0))
                                       )
                                      (ly:grob-set-property! grob 'stencil (center-stencil-on-stencil stil newStil))
                                      )
                                    )
  \clef alto
  s1 s2
  \once \override TextSpanner.after-line-breaking = #(lambda (grob) 
                                                       (let* 
                                                        (
                                                          (stil (ly:grob-property grob 'stencil))
                                                          (stilExt (ly:stencil-extent stil X))
                                                          (stilLength (interval-length stilExt))
                                                          (newStil (box-stencil (grob-interpret-markup grob #{ \markup \with-color #white \filled-box #(cons 0 stilLength) #'(0 . 3) #0 #}) 0.1 0))
                                                          (textStil (grob-interpret-markup grob #{ \markup \upright "f1 ◼◻◧ : Non dovrei essere qui... ...rimescolando gli organi" #}))
                                                          (fullStil (ly:stencil-add newStil (center-stencil-on-stencil newStil textStil)))
                                                          ) 
                                                        (ly:grob-set-property! grob 'stencil fullStil)
                                                        )
                                                       )
  \once \override TextSpanner.outside-staff-priority = ##f
  \once \override TextSpanner.Y-offset = #-1.5
  \once \override TextSpanner.layer = #999
  s2\startTextSpan s2.. s8\stopTextSpan
  s1
  s1
  s8 s4
  \once \override TextSpanner.after-line-breaking = #(lambda (grob) 
                                                       (let* 
                                                        (
                                                          (stil (ly:grob-property grob 'stencil))
                                                          (stilExt (ly:stencil-extent stil X))
                                                          (stilLength (interval-length stilExt))
                                                          (newStil (box-stencil (grob-interpret-markup grob #{ \markup \with-color #white \filled-box #(cons 0 stilLength) #'(0 . 3) #0 #}) 0.1 0))
                                                          (textStil (grob-interpret-markup grob #{ \markup \upright "f2 ◧ : \"Signorina, quindi...\" \"...se sbaglio.\"" #}))
                                                          (fullStil (ly:stencil-add newStil (center-stencil-on-stencil newStil textStil)))
                                                          ) 
                                                        (ly:grob-set-property! grob 'stencil fullStil)
                                                        )
                                                       )
  \once \override TextSpanner.outside-staff-priority = ##f
  \once \override TextSpanner.Y-offset = #-1.5
  \once \override TextSpanner.layer = #999
  s2\startTextSpan s2... s16\stopTextSpan
}

guitar = \relative c' {
  \romanStringNumbers
  \override StringNumber.font-shape = #'upright
  \set stringNumberOrientations = #'(left)
  \set fingeringOrientations = #'(left)
  \clef G
  \clop
  \log \afterGrace 15/16 <e, a d g b e>4\startTextSpan\dal-niente { s32\stopTextSpan } 
  \tuplet 3/2 { e'''16[(\accent\sfz^\tapping  cis b) } \tuplet 3/2 { b16(^\tapping fis e)] }
  \tuplet 6/4 { fis16([^\tapping b,) cis(^\tapping d,) \palmmute \tuplet 3/2 { fis,\staccato\startTextSpan _\markup\italic\tiny"(rit.)" f\staccato e]\staccato\stopTextSpan } }
  <<
    {\voiceOne
     \arpeggioArrowUp
     \xNotesOn <d' g b e>16\arpeggio \xNotesOff \arpeggioNormal
     s16 s8
    }
    \new Voice { \voiceTwo
                 \once \hide Stem
                 \opcl
                 \pitchedTrill b8\accent^\startTrillSpan\startTextSpan\glissando\> cis s16
                 \once \hide Stem
                 \parenthesize gis16\pp\stopTextSpan \breathe
    }
  >> \oneVoice
  \once \hide Stem
  \clopcl
  \pitchedTrill b4\startTrillSpan\startTextSpan\< cis \afterGrace 15/16 s4\> { s32\stopTextSpan\! }
  \clopcl s16\startTextSpan\< s16\> s16\!\stopTextSpan s16
  \clopcl s16\startTextSpan\< s16\> s16\!\stopTextSpan s16_\markup\italic"nervoso! (continua, plettrata ad libitum)"
  s2
  s2
  \tuplet 3/2 { e,16[(\open\f\stopTrillSpan b' cis) } \tuplet 3/2 { e,16( cis' d]) }
  \pitchedTrill b8\startTrillSpan c
  \tuplet 3/2 { e,16[(\f\stopTrillSpan b' cis)] }
  \pitchedTrill b4\glissando\startTrillSpan cis \glissandoSkipOn b \glissandoSkipOff \once \hide Stem cis8
  \tuplet 3/2 { e,16[(\f\stopTrillSpan cis' d)] }
  \pitchedTrill cis4\glissando\startTrillSpan d \glissandoSkipOn cis \glissandoSkipOff dis4\stopTrillSpan-\bendAfter #4 \breathe s8
  e4\harmonic\laissezVibrer\6
  r4\fermata s2.
  s2
  \clop
  \log <e, a d g b e>8\startTextSpan\dal-niente
  \tuplet 3/2 { e'''16[(\accent\sfz^\tapping\stopTextSpan  cis b) } \tuplet 3/2 { b16(^\tapping fis e)] }
}

guitarPart = \new Staff = "guitar_staff" \with {
  instrumentName = \markup \general-align #Y #0 \right-column {"Chitarra" "elettrica"}
  \remove "Time_signature_engraver"
  \remove "Bar_engraver"
  \consists "Bar_number_engraver"
} << \guitar \global >>

textPart = \new Staff = "text_staff" \with {
  instrumentName = \markup \general-align #Y #0 \right-column {"Voce" "recitante"}
  \remove "Time_signature_engraver"
  \consists "Bar_number_engraver"
  \override StaffSymbol.line-count = #1
} << \text \global >>

music = {
  <<
    \tag #'score \tag #'text \textPart
    \tag #'score \tag #'guitar \guitarPart
  >>
}