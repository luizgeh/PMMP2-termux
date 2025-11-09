#!/bin/bash

# ooooo      ooooo  oooo ooooo ooooooooooo   ooooooo8 ooooooooooo ooooo ooooo
#  888        888    88   888  88    888   o888    88  888    88   888   888
#  888        888    88   888      888     888    oooo 888ooo8     888ooo888
#  888      o 888    88   888    888    oo 888o    88  888    oo   888   888
# o888ooooo88  888oo88   o888o o888oooo888  888ooo888 o888ooo8888 o888o o888o
# _____________________________________________________________________________
# PocketMine-MP 2.0.0 dependencies instalation (Termux version)
# Created by Luiz Guilherme (luizgeh)
# Linktree: https://linktr.ee/luizgeh
# _____________________________________________________________________________

echo "Iniciando instalação...";

# Basic verification for instalation
pkg update
pkg upgrade -y

# Extract binary
pkg install unzip
unzip PHP-7.0.14_Linux-x84_64.zip

# Install dependencies
pkg install make
pkg install autoconf
pkg install automake
pkg install cmake
pkg install libtool
pkg install m4
pkg install getconf
pkg install gzip
pkg install bzip2

# Start compile
./compile.sh

# Prepare to execute server
chmod 777 ./start.sh

echo "Servidor instalado com sucesso!"

while true; do
    read -p "Quer iniciar o servidor? [Y/n] " startServer

    if [[ "$startServer" =~ ^[Yy]$ || "$startServer" == "" ]]; then
        echo "Iniciando servidor..."
        ./start.sh
        break
    elif [[ "$startServer" =~ ^[Nn]$ ]]; then
        echo "Instalação finalizada!"
        break
    else
        echo "Opção inválida! Tente novamente."
    fi
done
