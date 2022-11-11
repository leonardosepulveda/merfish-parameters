#!/bin/bash
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -p zhuang,shared
#SBATCH -t 7-00:00:00
#SBATCH --mem 4000
#SBATCH --open-mode=append
#SBATCH -o /n/home13/sboersma/Software/merfish-parameters/slurm/out/BC220_sample_02.out
#SBATCH -e /n/home13/sboersma/Software/merfish-parameters/slurm/err/BC220_sample_02.err

date +'Starting at %R.'

source centos7-modules.sh
module load Anaconda3/5.0.1-fasrc01
source activate merlin_vLSD.06.20
module load gcc/8.2.0-fasrc01
module load fftw
which python
echo BC220_sample_02

merlin -k parameters_BC220_02.json \
       -a merlin_analysis_BC220_02_woutseq.json \
       -o data_organization_BC220_02_woutseq.csv \
       -p positions_BC220_sample_02.txt \
       -c C2v6_codebook_mplx.csv \
       -m MERFISH4.json \
       -n 1000 \
       -e /n/holyscratch01/zhuang_lab/Lab/shared \
       -s /n/holyscratch01/zhuang_lab/Lab/shared/BC220_sample_02_new_cellpose_params_merlin \
       BC220_sample_02_data

date +'Finished at %R.'
