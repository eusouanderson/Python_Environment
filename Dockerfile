# Usar a imagem base do Python
FROM python:3.13

# Instalar dependências e ferramentas necessárias
RUN apt-get update && apt-get install -y \
    curl \
    bash \
    nano \
    && rm -rf /var/lib/apt/lists/*  # Limpar cache do apt após instalação

# Instalar o Poetry 1.8.2
RUN curl -sSL https://install.python-poetry.org | python3 - --version 1.8.2

# Garantir que o Poetry esteja no PATH
ENV PATH="/root/.local/bin:$PATH"

# Verificar se o Poetry foi instalado corretamente
RUN poetry --version

# Definir diretório de trabalho
WORKDIR /app

# Copiar o arquivo .bashrc para o diretório correto
COPY .bashrc /root/.bashrc

# Adicionar o source no .bash_profile para carregar o .bashrc
RUN echo "source /root/.bashrc" >> /root/.bash_profile

# Configurar o comando para rodar ao iniciar o container (em modo interativo)
CMD ["/bin/bash"]

