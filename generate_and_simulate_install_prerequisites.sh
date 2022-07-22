#!/bin/bash
# 
# 2022-07-22
# Copyright 2022 Murphy Lab, CMU

# Download CellOrganizer and some trained models

cd ~
git clone https://github.com/tebuck/cellorganizer.git
cd ~
git clone https://github.com/tebuck/cellorganizer-models.git
mv cellorganizer-models ~/cellorganizer/models


# Download and install MCell (requires CMake, which you will have to install on your own)

cd ~
git clone https://github.com/mcellteam/mcell.git
cd mcell
git checkout v3.4
cmake -S . -B build -DCMAKE_RELEASE_TYPE=Release
cmake --build build
mkdir -p ~/.local/bin
cp build/mcell ~/.local/bin
cd ~
# Add `~/.local/bin` to your PATH automatically in by copying the following line into `~/.bash_profile` if you are using bash. If you are using another shell, please consult its documentation.
PATH="${PATH}:$HOME/.local/bin"


# Download and install Python packages

if [ "$(hostname)" = 'lanec1.compbio.cs.cmu.edu' ]; then
    module load python36
fi

function exit_code_to_boolean()
{
    [[ "$1" -ne "0" ]]
    echo "$?"
}

function install_module_if_unavailable()
{
    python3 -m pip show "$1" >/dev/null 2>&1 ; python_module_available=$(exit_code_to_boolean "$?")
    #echo "python_module_available='$python_module_available'" # Debug
    
    if (( ! python_module_available )); then
        #echo python3 -m pip install --user "${1}==${2}" # Debug
        python3 -m pip install --user "${1}==${2}"
    fi
}

install_module_if_unavailable numpy 1.18.4
install_module_if_unavailable pandas 1.0.3
install_module_if_unavailable scikit-learn 0.23.1
install_module_if_unavailable xarray 0.15.1
install_module_if_unavailable scipy 1.4.1
install_module_if_unavailable scikit-learn 0.23.1
install_module_if_unavailable sklearn_pandas 1.8.0
install_module_if_unavailable matplotlib 3.2.1
install_module_if_unavailable seaborn 0.10.1
install_module_if_unavailable trimesh 3.6.43
# Works with scipy 1.4.1, incompatible with scipy 1.8.0
#install_module_if_unavailable statsmodels 0.11.1
install_module_if_unavailable statsmodels 0.13.2
