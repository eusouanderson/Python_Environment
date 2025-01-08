# Use a imagem Python 3.13 como base
FROM python:3.13

# Instalar dependências e ferramentas necessárias
RUN apt-get update && apt-get install -y curl bash

# Instalar o Nano
RUN apt-intall -y nano

# Instalar o Poetry 1.8.2
RUN curl -sSL https://install.python-poetry.org | python3 - --version 1.8.2

# Garantir que o Poetry esteja no PATH
ENV PATH="/root/.local/bin:$PATH"

# Verificar se o Poetry foi instalado corretamente
RUN poetry --version

# Definir diretório de trabalho
WORKDIR /app

# Copiar os arquivos do projeto
COPY .bashrc /root/.bashrc

RUN echo "source /root/.bashrc" >> /root/.bash_profile

# Configurar o comando para rodar ao iniciar o container (em modo interativo)
CMD ["/bin/bash"]

