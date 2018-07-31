#controle de qualidade com fastqc com saida em pasta especificada e sem descompactar os arquivos de saida

fastqc -o /caminho/dapasta -t 4 --noextract arquivo1.fastq.gz arquivo2.fastq.gz

#-t = numero de nucleos do processador a serem utilizados

#trimmar adaptadores e qualidade abaixo de 20
#adicionado alias trimmomatic='java -jar /usr/share/java/trimmomatic-0.36.jar' no bashrc

trimmomatic PE -phred33 Pool_6_ALL_R1.fastq.gz Pool_6_ALL_R2.fastq.gz P6-R1.fq.gz P6-R2.fq.gz unpaired1.fq.gz unpaired2.fq.gz ILLUMINACLIP:TruSeq3-PE-2.fa:2:30:10 LEADING:20 TRAILING:20 SLIDINGWINDOW:2:20 MINLEN:21



