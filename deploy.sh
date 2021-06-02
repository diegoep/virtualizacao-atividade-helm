#!/usr/bin/env bash

set -euo pipefail
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"


helmBinary="helm3" ## altere para o nome do binário do helm utilizado na sua máquina

## Adiciona repositório helm da Bitnami
$helmBinary repo add bitnami https://charts.bitnami.com/bitnami  

## Podemos usar upgrade com o argumento --install para instalar e atualizar novas releases conforme necessário
$helmBinary upgrade redis bitnami/redis --values redis/values.yaml --install
$helmBinary upgrade -f guestbook/values.yaml guestbook guestbook --install