FROM ubuntu:latest
RUN apt update && apt upgrade -y

ENV DEBIAN_FRONTEND=noninteractive

# Ubuntu packages
RUN apt install -y curl wget unzip software-properties-common git gh btop gcc gdb binwalk wireguard wireshark tshark okteta cmatrix gnuradio gqrx-sdr steghide sagemath jupyter apktool python3 python3-pip python3-dev git libssl-dev libffi-dev build-essential openjdk-11-jdk openjdk-17-jdk

WORKDIR /opt/ctf

# Helix editor
RUN add-apt-repository ppa:maveonair/helix-editor -y
RUN apt update
RUN apt install helix -y
# GEF
RUN bash -c "$(curl -fsSL https://gef.blah.cat/sh)"
# Ghidra
RUN curl https://github.com/NationalSecurityAgency/ghidra/releases | grep -Po "https://.*expanded_assets[^\"]+" | head -1  | xargs curl | grep -Po "href=\"\K[^\"]+.zip" | head -1 | xargs -I {} wget https://github.com{} && unzip ghidra*.zip && rm ghidra*.zip
# Pwntools
RUN pip install --upgrade pip
RUN pip install --upgrade pwntools
# Stegoveritas
RUN pip install stegoveritas
RUN stegoveritas_install_deps
# jd-gui
RUN curl https://github.com/java-decompiler/jd-gui/releases | grep -Po "https://.*expanded_assets[^\"]+" | head -1  | xargs curl | grep -Po "href=\"\K[^\"]+.jar" | head -1 | xargs -I {} wget https://github.com{}
# Logisim Evolution
RUN curl https://github.com/logisim-evolution/logisim-evolution/releases | grep -Po "https://.*expanded_assets[^\"]+" | head -1  | xargs curl | grep -Po "href=\"\K[^\"]+.jar" | head -1 | xargs -I {} wget https://github.com{}
