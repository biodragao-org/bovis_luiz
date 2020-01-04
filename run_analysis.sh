#==============================================
# Unzip 
#==============================================
#gzip -dc ${oldR1Name} > ${newR1Name}.fastq


#==============================================
# Trimmomatic
#==============================================
# DONE

#java -jar /opt/Trimmomatic-0.36/trimmomatic-0.36.jar PE -phred33  23_R1.fastq  23_R2.fastq   23_R1_p.fastq  23_R1_s.fastq  23_R2_p.fastq   23_R2_s.fastq   LEADING:3 TRAILING:3 SLIDINGWINDOW:4:20 MINLEN:36 

#==============================================
# Snippy
#==============================================

# snippy --cpus 4 --outdir G04868 --ref ./ NC000962_3 . gbk-- R1./G04868_1.fastq.gz --R2 ./ G04868_2 . fastq.gz


#==============================================
# TB_Profiler
#==============================================
# DONE

#gzip 23_R1.fastq 
#gzip 23_R2.fastq

#tb-profiler profile -1 23_R1.fastq.gz -2 23_R2.fastq.gz -t 4 -p 23


#==============================================
# Prokka
# NOTE: prokka requires spades to run first
# Check in the manual or here
# https://github.com/BioDragao-org/tese-nf/blob/master/_resources/G04868_scratch/G04868_vm.nf
#==============================================


## cd ./ G04868_49 && prokka-- outdir./G04868_prokka --prefix G04868 contigs.fa_NC000962_3.fasta.fasta


#==============================================
# RD_Analyzer
#==============================================

#==============================================
# Spotyping
#==============================================


#gzip -dc 23_R1.fastq.gz > 23_R1.fastq 
#gzip -dc 23_R2.fastq.gz > 23_R2.fastq 
gzip -dc 23_R1_p.fastq.gz > 23_R1_p.fastq

python2.7 SpoTyping.py ./23_R1_p.fastq -o 23.txt

