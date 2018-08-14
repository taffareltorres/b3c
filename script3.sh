#juntar todos R1 e R2
cat /media/b3c/TaffaBackup/Pool3/Pool_3_S3_L00*_R1_001.fastq.gz > /media/b3c/TaffaBackup/Pool3/Pool_3_R1.fastq.gz
cat /media/b3c/TaffaBackup/Pool3/Pool_3_S3_L00*_R2_001.fastq.gz > /media/b3c/TaffaBackup/Pool3/Pool_3_R2.fastq.gz

fastqc /media/b3c/TaffaBackup/Pool3/Pool_3_R1.fastq.gz /media/b3c/TaffaBackup/Pool3/Pool_3_R2.fastq.gz

#descompactar pra poder usar o sortmerna
gunzip /media/b3c/TaffaBackup/Pool3/Pool_3_R1.fastq.gz
gunzip /media/b3c/TaffaBackup/Pool3/Pool_3_R2.fastq.gz

#juntar arquivos para poder usar o sortmerna
/home/b3c/Downloads/sortmerna-2.1b/scripts/merge-paired-reads.sh /media/b3c/TaffaBackup/Pool3/Pool_3_R2.fastq /media/b3c/TaffaBackup/Pool3/Pool_3_R2.fastq /media/b3c/TaffaBackup/Pool3/Pool_3_R1R2.fastq

#ir para a pasta que contem os scrips e pastas de bancos de dados indexados
cd /home/b3c/Downloads/sortmerna-2.1b/
./sortmerna --ref rRNA_databases/silva-bac-16s-id90.fasta,index/silva-bac-16s-db:rRNA_databases/silva-bac-23s-id98.fasta,index/silva-bac-23s-db:rRNA_databases/silva-arc-16s-id95.fasta,index/silva-arc-16s-db:rRNA_databases/silva-arc-23s-id98.fasta,index/silva-arc-23s-db:rRNA_databases/silva-euk-18s-id95.fasta,index/silva-euk-18s-db:rRNA_databases/silva-euk-28s-id98.fasta,index/silva-euk-28s-db:rRNA_databases/rfam-5s-database-id98.fasta,index/rfam-5s-db:rRNA_databases/rfam-5.8s-database-id98.fasta,index/rfam-5.8s-db --reads /media/b3c/TaffaBackup/Pool3/Pool_3_R1R2.fastq --num_alignments 1 --fastx --aligned /media/b3c/TaffaBackup/Pool3/Pool_3_rRNA --other /media/b3c/TaffaBackup/Pool3/Pool_3_nonrRNA --log --paired_in -v

#separar o arquivo de saida do sortmerna
/home/b3c/Downloads/sortmerna-2.1b/scripts/unmerge-paired-reads.sh /media/b3c/TaffaBackup/Pool3/Pool_3_nonrRNA.fastq /media/b3c/TaffaBackup/Pool3/Pool_3_nonrRNA-R1.fastq /media/b3c/TaffaBackup/Pool3/Pool_3_nonrRNA-R2.fastq

fastqc /media/b3c/TaffaBackup/Pool3/Pool_3_nonrRNA-R1.fastq /media/b3c/TaffaBackup/Pool3/Pool_3_nonrRNA-R2.fastq

#trimmar arquivo sem rRNA
#precisa declarar o comando como uma variavel, porque scripts nao reconhecem alias do bashrc
#tw2=trimmado com janela de 2 em 2
trimmomatic='java -jar /usr/share/java/trimmomatic-0.36.jar'
$trimmomatic PE -phred33 /media/b3c/TaffaBackup/Pool3/Pool_3_nonrRNA-R1.fastq /media/b3c/TaffaBackup/Pool3/Pool_3_nonrRNA-R2.fastq /media/b3c/TaffaBackup/Pool3/Pool_3_nonrRNA-R1_tw2.fastq /media/b3c/TaffaBackup/Pool3/Pool_3_nonrRNA-R1_unpaired.fastq /media/b3c/TaffaBackup/Pool3/Pool_3_nonrRNA-R2_tw2.fastq /media/b3c/TaffaBackup/Pool3/Pool_3_nonrRNA-R2_unpaired.fastq ILLUMINACLIP:TruSeq3-PE-2.fa:3:30:10 LEADING:20 TRAILING:20 SLIDINGWINDOW:2:20 MINLEN:21

fastqc /media/b3c/TaffaBackup/Pool3/Pool_3_nonrRNA-R1_tw2.fastq /media/b3c/TaffaBackup/Pool3/Pool_3_nonrRNA-R2_tw2.fastq
