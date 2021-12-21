FROM debian:11
RUN apt update
RUN adduser neovim 

RUN mkdir /home/neovim/bin
ENV PATH="/home/neovim/bin/:${PATH}"

RUN apt-get install wget -y

RUN wget https://packages.microsoft.com/config/debian/11/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN rm packages-microsoft-prod.deb

RUN apt-get update; \
  apt-get install -y apt-transport-https && \
  apt-get update && \
  apt-get install -y dotnet-sdk-6.0

RUN mkdir -p /opt/omnisharp-roslyn
WORKDIR /opt/omnisharp-roslyn
RUN wget https://github.com/OmniSharp/omnisharp-roslyn/releases/download/v1.38.0/omnisharp-linux-x64.tar.gz -O /opt/omnisharp-roslyn/omnisharp.tar.gz
RUN tar -xf omnisharp.tar.gz
RUN chmod u+x -R /opt/omnisharp-roslyn
RUN ln -s /opt/omnisharp-roslyn/run /home/neovim/bin/omnisharp

RUN mkdir -p /opt/sumneko-lua
WORKDIR /opt/sumneko-lua
RUN wget https://github.com/sumneko/lua-language-server/releases/download/2.5.5/lua-language-server-2.5.5-linux-x64.tar.gz -O /opt/sumneko-lua/sumneko.tar.gz
RUN tar -xf sumneko.tar.gz
RUN ln -s /opt/sumneko-lua/bin/lua-language-server /home/neovim/bin/lua-language-server

RUN wget https://github.com/neovim/neovim/releases/download/v0.6.0/nvim.appimage -O /home/neovim/bin/nvim.appimage

RUN chmod +x -R /home/neovim/bin/
RUN chown 1000:1000 -R /home/neovim/bin/
RUN chown 1000:1000 -R /opt

RUN apt-get install git -y
RUN apt-get install python3 -y
RUN apt-get install python3-pip -y

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

RUN mkdir -p /home/neovim/.config/nvim

RUN mkdir -p /home/neovim/.config/nvim/lua
COPY install-plugins.lua /home/neovim/.config/nvim/lua/install-plugins.lua
COPY configure-plugins.lua /home/neovim/.config/nvim/lua/configure-plugins.lua
COPY install.vim /home/neovim/.config/install.vim

RUN mkdir -p /home/neovim/.config/nvim/colors
COPY my_256_colors.vim /home/neovim/.config/nvim/colors/my_256_colors.vim

COPY install.vim /home/neovim/.config/nvim/init.vim

RUN /home/neovim/bin/nvim.appimage --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

COPY init.vim /home/neovim/.config/nvim/init.vim

CMD /home/neovim/bin/nvim.appimage $TGT
