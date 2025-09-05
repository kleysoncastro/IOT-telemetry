#!/bin/bash

# Versão do migrate a ser instalada
VERSION="4.9.0"

# Diretório de instalação
INSTALL_DIR="./"

# Cores para mensagens
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}Instalando migrate ${VERSION}...${NC}"

# Criar diretório bin se não existir
mkdir -p "${INSTALL_DIR}"

echo -e "${GREEN}Baixando e instalando migrate...${NC}"

# Baixar e extrair o migrate
curl -L "https://github.com/golang-migrate/migrate/releases/download/v${VERSION}/migrate.linux-amd64.tar.gz" | tar -xz

# Mover e renomear o binário para o diretório de instalação
mv migrate.linux-amd64 "${INSTALL_DIR}/migrate"

# Tornar o binário executável
chmod +x "${INSTALL_DIR}/migrate"

echo -e "\n${GREEN}Instalação concluída com sucesso!${NC}"
echo -e "O migrate foi instalado em: ${INSTALL_DIR}/migrate"
echo -e "\nPara usar o migrate, você pode adicionar o diretório bin ao seu PATH ou usar o caminho completo:"
echo -e "${INSTALL_DIR}/migrate --version"

# Verificar se o diretório bin está no PATH
if [[ ":$PATH:" != *":${INSTALL_DIR}:"* ]]; then
    echo -e "\n${GREEN}Dica:${NC} Adicione o diretório bin ao seu PATH adicionando esta linha ao seu ~/.bashrc ou ~/.zshrc:"
    echo -e "export PATH=\"\$PATH:${INSTALL_DIR}\""
fi
