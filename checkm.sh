source activate gtdbtk
checkm lineage_wf -f checkm_out.txt --tab_table -x fna -t 14 --pplacer_threads 14  genomes/ checkm_out_808/
for i in $(less checkm_out.txt|cut -f 1);do j=$(less checkm_out.txt|sed -n "/$i/p"|cut -f 12);k=$(less checkm_out.txt|sed -n "/$i/p"|cut -f 13); if [[ "$j" > 90 ]] && [[ "$k" < 5 ]];then echo $i.fna >> hq_genome.txt; fi; done

