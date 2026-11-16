#!/bin/bash
#SBATCH --job-name=NVDDDH
#SBATCH --output=job.out
#SBATCH --error=job.err
#SBATCH --time=12:30:00
#SBATCH --partition=gagalli-csl2
#SBATCH --account=pi-gagalli
#SBATCH --qos=gagalli-csl2
#SBATCH --nodes=4
#SBATCH --ntasks-per-node=48

module load intel/19.1.1
module load intelmpi/2019.up7+intel-19.1.1
module load mkl/2020.up1
module load python/anaconda-2020.11

export I_MPI_PMI_LIBRARY=/software/slurm-current-$DISTARCH/lib/libpmi.so
export LD_LIBRARY_PATH=/software/python-anaconda-2020.11-el8-x86_64/lib:$LD_LIBRARY_PATH
export OMP_NUM_THREADS=1

BINDIR=/project/gagalli/svillani/WEST-devel-origin/QEdir/bin

NP=192
NB=4

# mpirun -n $NP ${BINDIR}/pw.x -nb $NB -i pw.in > pw.out
# sleep 10
# mpirun -n $NP ${BINDIR}/wbse_init.x -ni $NB -i wbse_init.in > wbse_init.out
# sleep 10
mpirun -n $NP ${BINDIR}/wbse.x -nb $NB -i wbse_nac42_force2.in > wbse_nac42_force2.out
mpirun -n $NP ${BINDIR}/wbse.x -nb $NB -i wbse_nac43_force3.in > wbse_nac43_force3.out
