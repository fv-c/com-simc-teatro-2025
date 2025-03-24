\version "2.24.3"

%\pointAndClickOff

#(ly:set-option 'relative-includes #t)

#(ly:set-option 'backend 'cairo)

#(define part 'score)

\include "src/layout.ily"
\include "src/musica.ily"
\include "src/header.ily"
\include "src/note.ily"
\include "src/midi.ily"

#(set-global-staff-size 18)
 
\book {
  \paper {
    #(set-paper-size "a4")
    #(define fonts
       (set-global-fonts
        #:music "emmentaler"
        #:brace "emmentaler"
        #:roman "EB Garamond"
        #:factor (/ staff-height pt 20)
        ))

    two-sided = ##t
    top-margin = 2.5\cm
    bottom-margin = 2.5\cm
    inner-margin = 2.5\cm
    outer-margin = 2\cm

    indent = 3\cm
    short-indent = 0.3\cm

    system-system-spacing.basic-distance = #10
    top-system-spacing.basic-distance = #8

    max-systems-per-page = 2
    
    system-separator-markup = \slashSeparator

    bookpart-level-page-numbering = ##t
  }

  \myheader
  \pageBreak

%   \bookpart {
%     \paper { bookTitleMarkup = "" }
%     \markup " "
%   }

  \bookpart {
    \paper { bookTitleMarkup = "" }
    \note
  }
  
  \bookpart {
    \paper {
      bookTitleMarkup = ""
      oddFooterMarkup = \markup \center-column{ " " \fill-line { \if \on-first-page-of-part " " }}
    }
    \score {
      \keepWithTag #'score \music
      \layout { \deflayout }
      %\midi { \defmidi }
    }
  }
}

