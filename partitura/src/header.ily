\version "2.24.3"

#(define thispart part)

\include "../../fv-lib-lilypond/date-tools.ily"

myheader = \header {
  dedication = "***"
  title = "Nosebleed"
  subtitle = "per chitarra elettrica e voce recitante"
  instrument = "Partitura"
  composer = "Francesco Vitucci"
  tagline = ##f
}

myPartheader = \header {
  dedication = "***"
  title = "Nosebleed"
  subtitle = "per chitarra elettrica e voce recitante"
  instrument = #(cond
                ((equal? thispart 'guitar) "Chitarra elettrica")
                ((equal? thispart 'score) "")
                )
  composer = "Francesco Vitucci"
  tagline = ##f
}


\paper {
  bookTitleMarkup = \markup {
    \justify-line {
      ""
      \center-column {
        \vspace #12
        { \abs-fontsize #20 \bold \fromproperty #'header:composer }
        \vspace #4
        { \abs-fontsize #40 \bold\smallCaps { \fromproperty #'header:title } }
        \vspace #2
        { \abs-fontsize #18 \fromproperty #'header:subtitle }
        \vspace #2
        { \abs-fontsize #14 "2025" }
        \vspace #15
        \abs-fontsize #16 \italic \fromproperty #'header:instrument
      }
      ""
    }
  }
  scoreTitleMarkup = \markup {
    %\override #'(baseline-skip . 5)
    \column {
      \override #'(box-padding . 0.5)
      \override #'(thickness . 2)
      \fill-line { "" \box \italic \fromproperty #'header:instrument }
      %\fill-line { \italic \line { "a " \fromproperty #'header:dedication } }
      \vspace #0.5
      \fill-line { \override #'(font-size . 2) \bold \fromproperty #'header:composer }
      \vspace #0.2
      \fill-line { \override #'(font-size . 8) \bold\smallCaps \fromproperty #'header:title }
      \vspace #0.3
      \fill-line { \override #'(font-size . -1) \fromproperty #'header:subtitle }
      \fill-line { \override #'(font-size . -2) "2025" }
      \fill-line { \override #'(font-size . -3) " "%#(apply string-append (list "[ export: " dateHour " ]")) 
      }
      \vspace #0.5
    }
  }

  oddHeaderMarkup = \markup
  \fill-line {
    ""
    \unless \on-first-page-of-part \small \concat { \fromproperty #'header:composer " - " \bold \fromproperty #'header:title " - 2025 - " \italic \fromproperty #'header:instrument }
    \if \should-print-page-number \huge \fromproperty #'page:page-number-string
  }

  evenHeaderMarkup = \markup
  \fill-line {
    \if \should-print-page-number \huge \fromproperty #'page:page-number-string
    \unless \on-first-page-of-part \small \concat { \fromproperty #'header:composer " - " \bold \fromproperty #'header:title " - 2025 - " \italic \fromproperty #'header:instrument }
    ""
  }
}