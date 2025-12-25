#!/bin/bash
#SBATCH --account=def-asarkar
#SBATCH --nodes=40
#SBATCH --ntasks-per-node=40
#SBATCH --time=00:40:00
#SBATCH --mem-per-cpu=3700M
#SBATCH --job-name=NL_weak_mesh
#SBATCH --output=%x-%j.out
#SBATCH --mail-user=sudhipv@cmail.carleton.ca
#SBATCH --mail-type=ALL

#module load CCEnv
#module load StdEnv/2020

module load intelmpi


which mpiexec
which mpirun


/home/sudhipv/packages/FreeFem-sources/src/nw/FreeFem++-nw generate_NLprocess.edp -nRV 3 -ordOUT 3 >> macro.out

mpirun -np 1600 /home/sudhipv/packages/FreeFem-sources/src/mpi/FreeFem++-mpi poissonNL_process2L.edp -m 566 -n 566 -nw -log_view

echo "#############################################################################################################"
echo "#############################################################################################################"
echo "########     Finished Code with NL Processors    #################################################"
echo "#############################################################################################################"
echo "#############################################################################################################"


### 1600 - 566 x 566
### 2400 - 693 x 693
### 3200 - 800 x 800


exit
