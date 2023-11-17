set style data histograms
set style histogram clustered
set style fill solid border -1

set xtics rotate by -45
set ytics nomirror
set y2tics nomirror
set ylabel "Stability"
set y2label "Speed"

set ytics 
set yrange [0:*]
set y2tics
set y2range [0:*]

do for [t in "0 1 2 3 f"] {
  outfile = sprintf('clang%s.png',t)
  set output outfile
  set terminal png size 800,600
  set title 'CLANG optimisation level '.t
  plot 'clang'.t.'.data' using 13:xtic(1) title 'stddev (%)' axes x1y1, '' using 15:xtic(1) title 'MiB/s' axes x1y2
  
}

do for [t in "0 1 2 3 f"] {
  outfile = sprintf('gcc%s.png',t)
  set output outfile
  set terminal png size 800,600
  set title 'GCC optimisation level '.t
  plot 'gcc'.t.'.data' using 13:xtic(1) title 'stddev (%)' axes x1y1, '' using 15:xtic(1) title 'MiB/s' axes x1y2
  
}
exit
 

