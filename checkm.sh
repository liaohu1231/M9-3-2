source activate gtdbtk
checkm lineage_wf -f checkm_out.txt --tab_table -x fna -t 14 --pplacer_threads 14  genomes/ checkm_out_808/
for i in $(less checkm_out.txt|cut -f 1);do j=$(less checkm_out.txt|sed -n "/$i/p"|cut -f 12);k=$(less checkm_out.txt|sed -n "/$i/p"|cut -f 13)
	if [[ "$j" > 90 ]] && [[ "$k" < 5 ]];then echo $i.fna >> hq_genome.txt; fi; done

for i in $(less prokaryotes.csv|cut -d "," -f 6)
	do new=$(less prokaryotes.csv|sed -n "/$i/p"|cut -d "," -f 1|cut -d "_" -f 1,2);strain=$(less prokaryotes.csv|sed -n "/$i/p"|cut -d "," -f 3)
	echo $new $strain|sed "s/ /_/g" >> name.txt;done
	
for i in $(less hq_genome.txt|sed "s/.fna//g");do j=$(less table.txt|sed -n "/$i/p");echo $j >> table_s1.txt;done ###获得参考菌株信息
