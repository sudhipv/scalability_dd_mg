#!/bin/bash
#SBATCH --account=def-asarkar
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=40
#SBATCH --time=00:30:00
##SBATCH --mem-per-cpu=3700M
#SBATCH --job-name=NL_strong_mesh_test
#SBATCH --output=%x-%j.out
#SBATCH --mail-user=sudhipv@cmail.carleton.ca
#SBATCH --mail-type=ALL

module load CCEnv
module load StdEnv/2020


which mpiexec
which mpirun




/home/a/asarkar/sudhipv/software/FreeFem-sources/src/nw/FreeFem++-nw generate_NLprocess.edp -nRV 3 -ordOUT 3

mpirun -np 80 /home/a/asarkar/sudhipv/software/FreeFem-sources/src/mpi/FreeFem++-mpi poissonNL_process2L.edp -m 100 -n 100 -nw -log_view

echo "#############################################################################################################"
echo "#############################################################################################################"
echo "########     Finsihed Code with NL 10 Processors             #################################################"
echo "#############################################################################################################"
echo "#############################################################################################################"





exit
