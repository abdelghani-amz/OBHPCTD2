set style data histograms
set style histogram clustered
set style fill solid border -1
set boxwidth 0.8 relative
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
  outfile = sprintf('comparison%s.png',t)
  set output outfile
  set terminal png size 800,600
  set title 'CLANG vs GCC optimisation level '.t
  plot 'clang'.t.'.data' using 13:xtic(1) title 'stddev clang(%)' axes x1y1, 'gcc'.t.'.data' using 13:xtic(1) title 'stddev gcc(%)' axes x1y1, 'clang'.t.'.data' using 15:xtic(1) title 'MiB/s clang' axes x1y2, 'gcc'.t.'.data' using 15:xtic(1) title 'MiB/s gcc' axes x1y2
  
}

exit
 

