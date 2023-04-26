FROM debian:11
RUN apt update
RUN adduser neovim 

RUN apt update

RUN apt-get install git -y
RUN apt-get install python3 -y
RUN apt-get install python3-pip -y

RUN mkdir /home/neovim/bin
ENV PATH="/home/neovim/bin/:${PATH}"

# Install system utilities and requirements
RUN apt-get install wget curl -y

RUN wget https://github.com/neovim/neovim/releases/download/v0.8.3/nvim.appimage -O /home/neovim/bin/nvim.appimage

RUN chmod +x -R /home/neovim/bin/
RUN chown 1000:1000 -R /home/neovim/bin/
RUN chown 1000:1000 -R /opt

RUN python3 -m pip install neovim 

RUN apt install nodejs npm -y
RUN npm install -g pyright neovim

RUN wget https://go.dev/dl/go1.20.1.linux-amd64.tar.gz -O /home/neovim/go1.20.1.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf /home/neovim/go1.20.1.linux-amd64.tar.gz
ENV PATH=/usr/local/go/bin:$PATH

ENV \
   WORKDIR="/mnt/workdir"\
   APPIMAGE_EXTRACT_AND_RUN=1\
   TGT="."

RUN mkdir -p "${WORKDIR}"

WORKDIR "${WORKDIR}"
USER neovim 

RUN go install golang.org/x/tools/gopls@v0.11.0
RUN go install github.com/cosmtrek/air@latest
ENV PATH=/home/neovim/go/bin:$PATH

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
