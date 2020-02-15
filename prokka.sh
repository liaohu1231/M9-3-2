source activate roary
for i in $(ls hq_genome/*.fna|cut -d "/" -f 2);do prokka --cdsrnaolap --cpus 20 --outdir prokka/${i%%.*} --locustag ${i%%.*} --prefix ${i%%.*} hq_genome/$i;done
mkdir gff/
for i in $(ls prokka/);do cp prokka/$i/*.gff gff/;done
