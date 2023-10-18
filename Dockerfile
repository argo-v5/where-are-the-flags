FROM ubuntu:latest
RUN apt update && apt upgrade -y

ENV DEBIAN_FRONTEND=noninteractive

# Ubuntu packages
RUN apt install -y curl php wget unzip software-properties-common git gh btop gcc gdb binwalk gimp wireguard wireshark tshark okteta cmatrix gnuradio gqrx-sdr steghide sagemath jupyter apktool python3 python3-pip python3-dev git libssl-dev libffi-dev build-essential openjdk-11-jdk openjdk-17-jdk

WORKDIR /opt/ctf

# Helix editor
RUN add-apt-repository ppa:maveonair/helix-editor -y
RUN apt update
RUN apt install helix -y
# VSCodium
RUN wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | gpg --dearmor | dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg
RUN echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' | tee /etc/apt/sources.list.d/vscodium.list
RUN apt update && apt install codium
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
# PyShark
RUN pip install pyshark
# jd-gui
RUN curl https://github.com/java-decompiler/jd-gui/releases | grep -Po "https://.*expanded_assets[^\"]+" | head -1  | xargs curl | grep -Po "href=\"\K[^\"]+.jar" | head -1 | xargs -I {} wget https://github.com{}
# Logisim Evolution
RUN curl https://github.com/logisim-evolution/logisim-evolution/releases | grep -Po "https://.*expanded_assets[^\"]+" | head -1  | xargs curl | grep -Po "href=\"\K[^\"]+.jar" | head -1 | xargs -I {} wget https://github.com{}
# Ngrok
RUN  curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | tee /etc/apt/sources.list.d/ngrok.list && apt update && apt install ngrok
# TODO: Docker Desktop
# Stegsolve
RUN wget http://www.caesum.com/handbook/Stegsolve.jar -O stegsolve.jar && chmod +x stegsolve.jar
# John The Ripper
RUN git clone https://github.com/openwall/john -b bleeding-jumbo john && cd john/src && ./configure && make -s clean && make -sj4