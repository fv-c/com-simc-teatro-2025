\version "2.24.3"

defmidi = \midi {
  \context {
    \Score
    \remove Timing_translator
    \accepts TimeSig
  }
  \context {
    \Staff
    \consists Timing_translator
    \accepts Tactus
  }
  \context {
    \name Bow_pressure_engraver
    \type Performer_group
  }
  \context {
    \name Tactus
    \type Performer_group
    \alias Dynamics
  }
  \context {
    \name TimeSig
    \type Performer_group
    \alias Staff
  }
}