![Logo da EBAC](image.png)
# Projeto Calculadora
Projeto do curso da EBAC - Calculadora com Python

### Verifique a permissão de execução:
ls -l arquivo.sh

### Caso não tenha permissão, executar o comando:
chmod +x arquivo.sh

### Para executar o SCRIPT:
./arquivo.sh

### Se o script não tiver permissão de execução ou se você preferir, também pode executá-lo usando o interpretador bash diretamente:
bash arquivo.sh

===========================================================================================================================

# Explicação do Código Python

### 1. Entrada de Dados:
O código solicita duas entradas do usuário (input_1 e input_2).

### 2. Verificação de Tipos:
Tenta converter as entradas em números (float ou int).
Se a conversão for bem-sucedida, o valor é armazenado como int (se for um número inteiro) ou float (se for um número decimal).
Se a conversão falhar, o valor é tratado como texto.

### 3. Operações com Números:
Se ambas as entradas forem números, o usuário pode escolher uma operação matemática (soma, subtração, multiplicação ou divisão).
O código realiza a operação escolhida e exibe o resultado.
Caso a operação seja inválida (por exemplo, divisão por zero), uma mensagem de erro é exibida.

### 4. Operações com Textos:
Se ambas as entradas forem textos, o código as concatena e exibe o resultado.
Se uma entrada for número e a outra texto, o código também as concatena.

### 15. Saída:
O resultado da operação ou concatenação é exibido no terminal.