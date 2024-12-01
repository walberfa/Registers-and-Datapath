# Register and Datapath

Os códigos deste repositório implementam o seguinte circuito:
![datapath](https://github.com/user-attachments/assets/92fde71d-9b55-4211-b0b5-603f0ba0004e)

É um banco de registradores, com 8 registradores de 8 bits, uma ULA com 5 opções de operações e com saída de 8 bits, e um MUX que seleciona entre uma das saída do banco de registradores e uma constante.

## Entradas

- clk: relógio do sistema;
- rst: reseta em nível lógico baixo;
- we3: habilita a escrita nos registradores;
- ra1: aponta qual registrador vai para a saída rd1 do banco;
- ra2: aponta qual registrador vai para a saída rd2 do banco;
- wa3: indica qual registrador será escrito;
- wd3: dado de 8 bits a ser escrito no registrador;
- select_src: escolhe entre a saída rd2 do registrador ou a constante;
- constante: valor de 8 bits a ser inserido no sistema;
- ULAControl: indica qual operação a ser realizada.

## Saídas

- ULAResult: resultado da operação realizada na ULA;
- Z: é 1 quando ULAResult é igual a zero.
