\version "2.24.3"

\include "../../fv-lib-lilypond/accArrow.ily"
\include "../../fv-lib-lilypond/Bow_Pressure_Engraver.ily"
\include "../../fv-lib-lilypond/custom-script-articulations.ily"

deflayout = \layout {

  #(layout-set-staff-size 20)

  #(define fonts
     (make-pango-font-tree "EB Garamond"
       "Nimbus Sans,Nimbus Sans L"
       "Luxi Mono"
       (/ staff-height pt 20)))

  \enablePolymeter

  \context {
    \Score
    %\remove "Mark_engraver"
    \accepts TimeSig
    %proportionalNotationDuration = #(ly:make-moment 1/8)
    %\override SpacingSpanner.strict-note-spacing = ##t
    %\override SpacingSpanner.uniform-stretching = ##t
    
    \override SectionLabel.font-size = #3
    \override SectionLabel.font-series = #'bold
    \override SectionLabel.padding = #1.6
    
    \override StaffGrouper.staff-staff-spacing.padding = #1
    \override StaffGrouper.staff-staff-spacing.basic-distance = #8
    \override StaffSymbol.layer = #4
    \override MetronomeMark.font-size = #1
    
    \override SectionLabel.stencil = #(make-stencil-boxer 0.2 0.5 ly:text-interface::print)
  }

  \context {
    \ChoirStaff
    \remove "Bar_engraver"
    %\remove "Mark_engraver"
    \override StaffGrouper.staff-staff-spacing.basic-distance = #10
    \override StaffGrouper.staff-staff-spacing.minimum-distance = #7
    \override VerticalAxisGroup.nonstaff-unrelatedstaff-spacing.padding = #2
    \override InstrumentName.self-alignment-X = 1
    \override InstrumentName.padding = 1
  }

  \context {
    \StaffGroup
    \remove "Bar_engraver"
  }

  \context {
    \Staff
    \remove Ottava_spanner_engraver
    %\remove "Time_signature_engraver"
    \consists "Bar_number_engraver"
    %\consists "Mark_engraver"
    \override InstrumentName.self-alignment-X = 1
    \override InstrumentName.padding = 1
    pedalSustainStyle = #'mixed
    \override VerticalAxisGroup.default-staff-staff-spacing.basic-distance = #7
    \override TimeSignature.layer = #3
    \override TimeSignature.whiteout = ##t
    \remove Ottava_spanner_engraver
    \override OttavaBracket.font-name = "EB Garamond Bold"
    \override ClefModifier.font-name = "EB Garamond Bold"
    \override ClefModifier.font-size = #-3
  }

  \context {
    \PianoStaff
    \override InstrumentName.self-alignment-X = 1
    \override InstrumentName.padding = 1
  }

  \context {
    \RhythmicStaff
    \remove "Time_signature_engraver"
    \remove "Bar_engraver"
    \consists "Bar_number_engraver"
  }

  \context {
    \Voice
    \consists \Bow_pressure_engraver
    \consists Ottava_spanner_engraver
    \consists "Duration_line_engraver"
    \consists Ottava_spanner_engraver
    \consists Horizontal_bracket_engraver
    \override NoteHead.font-size = #-0.5
    \override TupletBracket.bracket-visibility = ##t
    \override TupletNumber.font-name = "EB Garamond Bold"
    \override Glissando.breakable = ##t
    \override Glissando.thickness = #2
    \override Glissando.minimum-length = #5
    \override Glissando.springs-and-rods = #ly:spanner::set-spacing-rods
    \override Hairpin.minimum-length = #7
    \override Hairpin.to-barline = ##f
    \override StemTremolo.shape = #'beam-like
    \override TextSpanner.minimum-length = #25
    \override TextSpanner.springs-and-rods = #ly:spanner::set-spacing-rods
    \override TextSpanner.minimum-length-after-break = #7
    \override TextSpanner.springs-and-rods = #ly:spanner::set-spacing-rods
    \override Slur.avoid-slur = #'inside
    \override TrillPitchAccidental.avoid-slur = #'inside
    \override TrillPitchHead.font-size = #'-2
    \override TrillPitchGroup.minimum-space = #3
    \override TrillPitchGroup.horizon-padding = #0.5
    \override Beam.damping = #+inf.0
    subdivideBeams = ##t
    baseMoment = #(ly:make-moment 1/4)
    %beatStructure = 2,2,2,2
    \romanStringNumbers
    \override StringNumber.font-shape = #'upright
    \override StringNumber.text = #(lambda (grob)
                                     #{ \markup \whiteout \concat {
                                       #(markup->string (string-number::calc-text grob))
                                       "c"
                                        }
                                     #})
    \override StringNumber.layer = 10
    \override DurationLine.arrow-length = #1.5
    \override DurationLine.arrow-width = #1
    
    \override HorizontalBracket.direction = #UP
    \override HorizontalBracket.thickness = #2
    \override HorizontalBracket.padding = 1
    \override HorizontalBracket.bracket-flare = #'(0 . 0)
  }

  \context {
    \Lyrics
    \override LyricText.self-alignment-X = #-1
    \override VowelTransition.arrow-length = #1
    \override VowelTransition.minimum-length = #7
    \override VowelTransition.springs-and-rods = #ly:vowel-transition::set-spacing-rods
  }

  \context {
    \name Tactus
    \alias Dynamics
    \type "Engraver_group"
    \accepts Voice
    \defaultchild "Voice"
    \consists "Beam_engraver"
    \consists "Stem_engraver"
    \consists "Axis_group_engraver"
    \consists "Dynamic_align_engraver"
    \consists "Dynamic_engraver"
    \override NoteHead.transparent = ##t
    \override NoteHead.Y-offset = #1
    \override NoteHead.X-offset = #0
    \override Dots.X-offset = #0.7
    \override Stem.length = #4
    \override Stem.direction = #UP
    \override Stem.X-offset =#0.5
    \override Flag.font-size = #-7
    \override TupletNumber.font-size = #-5
    \override TupletBracket.thickness = #1.3
    \override VerticalAxisGroup.nonstaff-relatedstaff-spacing = #'((basic-distance . 3) (padding . 0.5))
    \override DynamicLineSpanner.outside-staff-priority = ##f
    \override DynamicText.outside-staff-priority = ##f
    \override VerticalAxisGroup.staff-affinity = #0
    \override DynamicLineSpanner.Y-offset = #0

  }
  \inherit-acceptability "Tactus" "Dynamics"

  \context {
    \type "Engraver_group"
    \consists "Time_signature_engraver"
    \consists "Axis_group_engraver"
    \name "TimeSig"
    \alias "Staff"
    \override TimeSignature.font-size = #2
    \override TimeSignature.break-align-symbol = ##f
    \override TimeSignature.X-offset = #ly:self-alignment-interface::x-aligned-on-self
    \override TimeSignature.self-alignment-X = #CENTER
    \override TimeSignature.after-line-breaking = #shift-right-at-line-begin
  }

}

defpartlayout = \layout {

  #(layout-set-staff-size 20)

  #(define fonts
     (make-pango-font-tree "EB Garamond"
       "Nimbus Sans,Nimbus Sans L"
       "Luxi Mono"
       (/ staff-height pt 20)))

  \enablePolymeter

  \context {
    \Score
    %proportionalNotationDuration = #(ly:make-moment 1/128)
    %\override SpacingSpanner.uniform-stretching = ##t
    
    \override SectionLabel.font-size = #3
    \override SectionLabel.font-series = #'bold
    \override SectionLabel.padding = #1.6
    
    \override StaffGrouper.staff-staff-spacing.padding = #0
    \override StaffGrouper.staff-staff-spacing.basic-distance = #10

    \override StaffSymbol.layer = #4
    
    \override SectionLabel.stencil = #(make-stencil-boxer 0.2 0.5 ly:text-interface::print)
  }

  \context {
    \ChoirStaff
    \remove "Bar_engraver"
    \override StaffGrouper.staff-staff-spacing.basic-distance = #13
    \override StaffGrouper.staff-staff-spacing.minimum-distance = #7
    \override VerticalAxisGroup.nonstaff-unrelatedstaff-spacing.padding = #2
  }

  \context {
    \Staff
    \remove Ottava_spanner_engraver
    \consists "Bar_number_engraver"
    \remove Ottava_spanner_engraver
    \override InstrumentName.self-alignment-X = 1
    \override InstrumentName.padding = 1
    pedalSustainStyle = #'mixed
    \override VerticalAxisGroup.default-staff-staff-spacing.basic-distance = #12
    \override TimeSignature.layer = #3
    \override TimeSignature.whiteout = ##t
    \override OttavaBracket.font-name = "EB Garamond Bold"

  }

  \context {
    \PianoStaff
    \override InstrumentName.self-alignment-X = 1
    \override InstrumentName.padding = 1
  }

  \context {
    \Voice
    \consists \Bow_pressure_engraver
    \consists Ottava_spanner_engraver
    \consists "Duration_line_engraver"
    \consists Ottava_spanner_engraver
    \consists Horizontal_bracket_engraver
    \override TupletBracket.bracket-visibility = ##t
    \override Glissando.breakable = ##t
    \override Glissando.thickness = #2
    \override Glissando.minimum-length = #5
    \override Glissando.springs-and-rods = #ly:spanner::set-spacing-rods
    \override Hairpin.minimum-length = #7
    \override Hairpin.to-barline = ##f
    \override StemTremolo.shape = #'beam-like
    \override TextSpanner.minimum-length = #20
    \override TextSpanner.springs-and-rods = #ly:spanner::set-spacing-rods
    \override TextSpanner.minimum-length-after-break = #7
    \override TextSpanner.springs-and-rods = #ly:spanner::set-spacing-rods
    \override Slur.avoid-slur = #'inside
    \override TrillPitchAccidental.avoid-slur = #'inside
    \override TrillPitchHead.font-size = #'-2
    \override TrillPitchGroup.minimum-space = #3
    \override TrillPitchGroup.horizon-padding = #0.5
    \override Beam.damping = #+inf.0
    subdivideBeams = ##t
    baseMoment = #(ly:make-moment 1/4)
    %beatStructure = 2,2,2,2
    \romanStringNumbers
    \override StringNumber.font-shape = #'upright
    \override StringNumber.text = #(lambda (grob)
                                     #{ \markup \whiteout \concat {
                                       #(markup->string (string-number::calc-text grob))
                                       "c"
                                        }
                                     #})
    \override StringNumber.layer = 10
    \override DurationLine.arrow-length = #1.5
    \override DurationLine.arrow-width = #1
    %\override DurationLine.springs-and-rods = #ly:spanner::set-spacing-rods
    %\override DurationLine.breakable = ##f
    
    \override HorizontalBracket.direction = #UP
    \override HorizontalBracket.thickness = #2
    \override HorizontalBracket.padding = 1
    \override HorizontalBracket.bracket-flare = #'(0 . 0)
  }

  \context {
    \Lyrics
    \override LyricText.self-alignment-X = #-1
    \override VowelTransition.arrow-length = #1
    \override VowelTransition.minimum-length = #7
    \override VowelTransition.springs-and-rods = #ly:vowel-transition::set-spacing-rods
  }

  \context {
    \name Tactus
    \alias Dynamics
    \type "Engraver_group"
    \accepts Voice
    \defaultchild "Voice"
    \consists "Beam_engraver"
    \consists "Stem_engraver"
    \consists "Axis_group_engraver"
    \consists "Dynamic_align_engraver"
    \consists "Dynamic_engraver"
    \override NoteHead.transparent = ##t
    \override NoteHead.Y-offset = #1
    \override NoteHead.X-offset = #0
    \override Dots.X-offset = #0.7
    \override Stem.length = #4
    \override Stem.direction = #UP
    \override Stem.X-offset =#0.5
    \override Flag.font-size = #-7
    \override TupletNumber.font-size = #-5
    \override TupletBracket.thickness = #1.3
    \override VerticalAxisGroup.nonstaff-relatedstaff-spacing = #'((basic-distance . 5) (padding . 0.5))
    \override DynamicLineSpanner.outside-staff-priority = ##f
    \override DynamicText.outside-staff-priority = ##f
    \override VerticalAxisGroup.staff-affinity = #0
    \override DynamicLineSpanner.Y-offset = #0

  }
  \inherit-acceptability "Tactus" "Dynamics"

}