\version "2.24.3"
    
note = \markuplist {
  {
      \justify-line {
        " "
        \center-column {
          \override #'(span-factor . 1/2)
          \draw-hline
          \vspace #0.7
          \large\concat { \caps"Commissione di " \caps\bold "SIMC"  \caps" (Società Italiana Musica Contemporanea)" }
          \vspace #0.5
          %\caps\huge "Festival ArteScienza 2023 - Roma"
          \override #'(span-factor . 1/2)
          \draw-hline
          \vspace #1.5
        }
        " "
      }
    }
    \vspace #5
    \concat { \huge\caps"Note da " \huge\caps\bold"Programma" }
    \vspace #1
    % \justify {
%       \italic"In Human Memories" è un brano per voci preregistrate e generate da intelligenza artificiale, 
%       quattro violoncelli e live electronics. Esso esplora l'archetipo dell'abbandono, ispirandosi 
%       alle tragiche storie di tre diverse Didoni, tratte dalle opere liriche di Niccolò Piccinni, 
%       Domenico Sarro, Henry Purcell. Ciascuna di esse rappresenta un aspetto unico dell'amore, 
%       della perdita e della desolazione, pur ripercorrendo, decine di volte nella storia della 
%       musica, uno schema noto: l'innamoramento, l'abbandono di Enea, la morte di Didone. 
%       Come nella tragedia greca, il pubblico è chiamato a mettere in discussione l'autenticità 
%       delle emozioni e dei ricordi in un'epoca in cui l'intelligenza artificiale può replicare e 
%       generare espressioni simili a quelle umane. Mentre il pezzo si sviluppa, sottili caratteristiche 
%       nei testi generati e nelle voci clonate dall'IA possono rivelare la natura artificiale 
%       dei finti ricordi impiegati, suggerendo infine un tema intrinseco: l'intrusione 
%       dell'intelligenza artificiale nell'esperienza profondamente umana dell'emotività.
%     }
    \vspace #5
    \concat { \huge\smallCaps"Note per gli " \huge\smallCaps\bold"Interpreti" }
    \vspace #1
    \large "Durata: 7' ca."
    \vspace #1
    \large\justify-string#"Le alterazioni valgono solo per le note davanti alle quali sono poste ad eccezione delle note ribattute per le quali vale l'alterazione della prima. Sono presenti alterazioni precauzionali."
    \vspace #1
    \line { \large \concat { " "\musicglyph #"scripts.ushortfermata" "  " \musicglyph #"scripts.ufermata" "  " \musicglyph #"scripts.ulongfermata" "  Corone, dalla più breve alla più lunga." } }
    \vspace #1
    \line \large { "◼ ◻ ◧ : Indicazioni di \"intenzione\" della recitazione, dalla più violenta e irritata a quella più piatta." }
    \vspace #1
    \large\justify-string#"Altre indicazioni tecniche sono riportate, in partitura e nelle parti, nelle note a piè di pagina."
}