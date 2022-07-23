#!/bin/bash
# 
# 2022-07-22
# Copyright 2022 Murphy Lab, CMU

# Python packages and versions to install

declare -A python_packages_versions
python_packages_versions['numpy']='1.18.4'
python_packages_versions['pandas']='1.0.3'
python_packages_versions['scikit-learn']='0.23.1'
python_packages_versions['xarray']='0.15.1'
# System scipy version on test machine is 1.8.0, cannot override
#python_packages_versions['scipy']='1.4.1'
python_packages_versions['scipy']='1.8.0'
python_packages_versions['scikit-learn']='0.23.1'
python_packages_versions['sklearn_pandas']='1.8.0'
python_packages_versions['matplotlib']='3.2.1'
python_packages_versions['seaborn']='0.10.1'
python_packages_versions['trimesh']='3.6.43'
# Works with scipy 1.4.1, incompatible with scipy 1.8.0
#python_packages_versions['statsmodels']='0.11.1'
python_packages_versions['statsmodels']='0.13.2'


# Delete files to be overwritten

# Warn user
echo 'Warning: This script will attempt to install the following:'
echo '    https://github.com/tebuck/cellorganizer into ~/cellorganizer'
echo '    https://github.com/tebuck/cellorganizer-models into ~/cellorganizer/models'
echo '    https://github.com/mcellteam/mcell into ~/mcell'
echo '    Python packages to be installed for user:'
for package in "${!python_packages_versions[@]}"; do
    version="${python_packages_versions[$package]}"
    echo "        $package==$version"
done
echo '    Append a line to modify PATH in ~/.bashrc'
read -p 'Delete directories, uninstall packages, and proceed with install? [y/N] '
if [ "$REPLY" != 'y' ]; then
    exit
fi

# Uninstall
cd ~
for package in "${!python_packages_versions[@]}"; do
    version="${python_packages_versions[$package]}"
    python3 -m pip uninstall -y "$package"
done

# Delete
rm ~/.local/bin/mcell
rm -rf ~/mcell
rm -rf ~/cellorganizer


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
#echo 'Add `~/.local/bin` to your PATH automatically in by copying the following line into `~/.bashrc` if you are using bash. If you are using another shell, please consult its documentation.'
#PATH="${PATH}:$HOME/.local/bin"
echo 'Adding `~/.local/bin` to your path permanently by appending the following line to `~/.bashrc` (if not already present) as our scripts are designed to be used with bash. Please run the command `. ~/.bashrc`. If you are using another shell, please consult its documentation to add a directory to your path.'
if ! grep --quiet 'PATH="${PATH}:$HOME/.local/bin"' ~/.bashrc  ; then
    echo 'PATH="${PATH}:$HOME/.local/bin"' >> ~/.bashrc
fi
. ~/.bashrc


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
    if (( ! python_module_available )); then
        python3 -m pip install --user "${1}==${2}"
    fi
}

for package in "${!python_packages_versions[@]}"; do
    version="${python_packages_versions[$package]}"
    install_module_if_unavailable "$package" "$version"
done
