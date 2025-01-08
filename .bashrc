# ~/.bashrc: executed by bash(1) for non-login shells.

# Cores do Python
YELLOW='\[\033[38;5;226m\]'
BLACK='\[\033[38;5;16m\]'
GREEN='\[\033[38;5;46m\]'
BLUE='\[\033[38;5;32m\]'
CYAN='\[\033[38;5;51m\]'
RESET='\[\033[0m\]'

# Definir o prompt do terminal com o nome personalizado (Anderson)
PS1="${YELLOW}anderson${BLACK}:${CYAN}\w${RESET} (Desenvolvimento Python)\$ "

# Alias para comandos úteis com cores e precauções
alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias l='ls -lA --color=auto'
alias rm='rm -i'       # Evitar exclusões acidentais
alias cp='cp -i'       # Evitar sobreescrita acidental
alias mv='mv -i'       # Evitar movendo arquivos sem confirmação

# Exibindo diretório atual com o prompt com cores Python
export PS1="${YELLOW}anderson${BLACK}:${CYAN}\w${RESET} (Desenvolvimento Python)\$ "

# Configurações de cores para o ls
export LS_OPTIONS='--color=auto'
eval "$(dircolors)"

# Habilitar histórico do bash com um tamanho maior e melhor visualização
HISTSIZE=5000
HISTCONTROL=ignoredups:erasedups
shopt -s histappend

# Ativar Python Virtualenv automaticamente ao entrar em diretórios com virtualenv
export VIRTUAL_ENV_DISABLE_PROMPT=1

# Condição para verificar o ambiente virtual e modificar o PS1
if [[ -n "$VIRTUAL_ENV" ]]; then
    PS1="(${CYAN}$(basename "$VIRTUAL_ENV")${RESET}) $PS1"
fi

# Usar o comando 'python' como apelido para 'python3'
alias python='python3'

# Função para ativar e desativar venv automaticamente
function venv_activate() {
    if [ -d "venv" ]; then
        source venv/bin/activate
        echo -e "${GREEN}Ambiente virtual ativado: venv${RESET}"
    else
        echo -e "${YELLOW}Nenhum ambiente virtual encontrado${RESET}"
    fi
}

# Função para limpar cache do Python (pyc)
alias cleanpy='find . -name "*.pyc" -exec rm -f {} \;'

# Habilitar autocompletar para git
source /usr/share/bash-completion/completions/git

# Exibir quando comandos de longo tempo de execução estão rodando
export PS1="${PS1}\[\033[38;5;208m\] ${RESET}"

# Comandos para instalação rápida de pacotes para projetos Python
alias pipinstall="pip install --upgrade pip && pip install"
alias pipfreeze="pip freeze > requirements.txt"
alias pipupdate="pip install --upgrade -r requirements.txt"

# Definir um alias para o comando que sempre deve ser executado como superusuário
alias sudo='sudo '

# Configurar o diretório de trabalho como o diretório atual
cd ~

# Ativar a personalização quando o terminal for aberto
echo -e "${YELLOW}Ambiente de desenvolvimento Python!${RESET}"

# Configuração do histórico de comandos
PROMPT_COMMAND="history -a; history -r"

