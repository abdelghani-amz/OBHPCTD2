set style data histograms
set style histogram clustered
set style fill solid border -1
set boxwidth 0.8 relative
set xtics rotate by -45
set ytics nomirror
set ylabel "Speed"

outfile = sprintf('clang.png')
set output outfile
set terminal png size 800,600
set title 'CLANG for DGEMM'
plot 'clang0.data' using 14:xtic(1) title 'O0', 'clang1.data' using 14:xtic(1) title 'O1', 'clang2.data' using 14:xtic(1) title 'O2', 'clang3.data' using 14:xtic(1) title 'O3', 'clangf.data' using 14:xtic(1) title 'OFast'
  


  outfile = sprintf('gcc.png')
  set output outfile
  set terminal png size 800,600
  set title 'GCC for DGEMM '
  plot 'gcc0.data' using 14:xtic(1) title 'O0', 'gcc1.data' using 14:xtic(1) title 'O1', 'gcc2.data' using 14:xtic(1) title 'O2', 'gcc3.data' using 14:xtic(1) title 'O3', 'gccf.data' using 14:xtic(1) title 'OFast'
exit
 

