#controle de qualidade com fastqc com saida em pasta especificada e sem descompactar os arquivos de saida

fastqc -o /caminho/dapasta -t 4 --noextract arquivo1.fastq.gz arquivo2.fastq.gz

#-t = numero de nucleos do processador a serem utilizados

#trimmar adaptadores e qualidade abaixo de 20
#adicionado alias trimmomatic='java -jar /usr/share/java/trimmomatic-0.36.jar' no bashrc

trimmomatic PE -phred33 /home/bioinfo/Desktop/pool\ 1/Pool_1_S1_ALL_R1.fastq /home/bioinfo/Desktop/pool\ 1/Pool_1_S1_ALL_R2.fastq paired1.fq.gz unpaired1.fq.gz paired2.fq.gz unpaired2.fq.gz ILLUMINACLIP:TruSeq2-PE.fa:2:30:10:1:true TRAILING:20 MINLEN:20


