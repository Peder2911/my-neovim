FROM debian:11
RUN apt update
RUN adduser neovim 

RUN apt-get install git -y
RUN apt-get install python3 -y
RUN apt-get install python3-pip -y

RUN mkdir /home/neovim/bin
ENV PATH="/home/neovim/bin/:${PATH}"

RUN apt-get install wget -y


RUN wget https://github.com/neovim/neovim/releases/download/v0.8.3/nvim.appimage -O /home/neovim/bin/nvim.appimage

RUN chmod +x -R /home/neovim/bin/
RUN chown 1000:1000 -R /home/neovim/bin/
RUN chown 1000:1000 -R /opt

RUN python3 -m pip install python-lsp-server[all]
RUN python3 -m pip install pynvim

ENV \
   WORKDIR="/mnt/workdir"\
   APPIMAGE_EXTRACT_AND_RUN=1\
   TGT="."

RUN mkdir -p "${WORKDIR}"

WORKDIR "${WORKDIR}"
USER neovim 

RUN git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 /home/neovim/.local/share/nvim/site/pack/packer/start/packer.nvim

RUN mkdir -p /home/neovim/.config/nvim/lua
COPY install.vim /home/neovim/.config/nvim/init.vim
COPY install-plugins.lua /home/neovim/.config/nvim/lua/install-plugins.lua

RUN /home/neovim/bin/nvim.appimage --headless \
   -c 'autocmd User PackerComplete quitall' \
   -c 'PackerSync'

COPY config/init.vim /home/neovim/.config/nvim/init.vim
COPY config/lua /home/neovim/.config/nvim/lua

RUN mkdir -p /home/neovim/.config/nvim/colors
COPY ./my_256_colors.vim /home/neovim/.config/nvim/colors/my_256_colors.vim

COPY bashrc /home/neovim/.bashrc
CMD tail -f /dev/null 
