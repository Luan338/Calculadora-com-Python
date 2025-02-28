#!/bin/bash

echo "=========================================================================================================="
# Mensagem inicial
echo "Executando o SCRIPT da Calculadora.ipynb"
# Definir permissões do arquivo
echo "Definindo as permissões: Proprietário com permissão de Escrita, os demais com permissão de leitura."
chmod 744 calculadora.sh

# Ativar o ambiente Anaconda
echo "Ativando o ambiente Anaconda para acionar o Script Calculadora.ipynb"
source /home/pichau/Projeto_Calculadora/bin/activate

# Executar o notebook Jupyter
echo "Executando o notebook calculadora.ipynb..."
jupyter nbconvert --to notebook --execute C:/Users/pichau/OneDrive/Documentos/GitHub/Calculadora-com-Python/calculadora.ipynb

# Mensagem de Finalização
echo "Script da calculadora.ipynb finalizado."
echo "=========================================================================================================="

echo "=========================================================================================================="
echo "Executando o SCRIPT dentro do próprio ambiente"

# Arquivo de log
LOG_FILE="Calculadora.txt"

# Função para verificar se um valor é numérico
is_numeric() {
    if [[ $1 =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
        return 0  # Verdadeiro (é numérico)
    else
        return 1  # Falso (não é numérico)
    fi
}

# Recebendo os dados de input
read -p "1º Informação: " input_1
read -p "2º Informação: " input_2

# Verificando se input_1 e input_2 são números
is_numero_1=$(is_numeric "$input_1" && echo true || echo false)
is_numero_2=$(is_numeric "$input_2" && echo true || echo false)

# Tratando os dados com base nos tipos identificados
if $is_numero_1 && $is_numero_2; then
    echo -e "\nAmbos os inputs são números. Escolha a operação:" | tee -a "$LOG_FILE"
    echo "+ | Somar" | tee -a "$LOG_FILE"
    echo "- | Subtrair" | tee -a "$LOG_FILE"
    echo "* | Multiplicar" | tee -a "$LOG_FILE"
    echo "/ | Dividir" | tee -a "$LOG_FILE"

    read -p "Digite a operação desejada (+|-|*|/): " operacao_escolhida

    case $operacao_escolhida in
        "+")
            resultado=$(echo "$input_1 + $input_2" | bc)
            operacao_nome="Soma"
            ;;
        "-")
            resultado=$(echo "$input_1 - $input_2" | bc)
            operacao_nome="Subtração"
            ;;
        "*")
            resultado=$(echo "$input_1 * $input_2" | bc)
            operacao_nome="Multiplicação"
            ;;
        "/")
            if (( $(echo "$input_2 == 0" | bc -l) )); then
                resultado="Divisão por zero não permitida"
                operacao_nome="Divisão"
            else
                resultado=$(echo "scale=2; $input_1 / $input_2" | bc)
                operacao_nome="Divisão"
            fi
            ;;
        *)
            resultado="Opção inválida"
            operacao_nome="Operação"
            ;;
    esac

    # Exibindo o resultado e gravando no arquivo de log
    if [[ $resultado == "Opção inválida" || $resultado == "Divisão por zero não permitida" ]]; then
        echo "$operacao_nome: $resultado" | tee -a "$LOG_FILE"
    else
        echo "$operacao_nome: $resultado" | tee -a "$LOG_FILE"
    fi
elif ! $is_numero_1 && ! $is_numero_2; then
    # Se ambos forem textos, concatenar
    resultado="$input_1$input_2"
    echo "Concatenação dos textos: $resultado" | tee -a "$LOG_FILE"
else
    # Concatenação para tipos mistos ou texto
    resultado="$input_1$input_2"
    echo "Concatenação (tipos mistos ou texto): $resultado" | tee -a "$LOG_FILE"
fi
