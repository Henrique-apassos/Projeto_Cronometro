# Projeto_Cronometro
Projeto da cadeira de Sistemas Digitais do curso de Engenharia da Computação na UFPE

## Descrição
O projeto consiste em fazer um cronômetro digital utilizando a linguagem de descrição de hadware Verilog.
Foi utilizado a conceuito de Máquna de Estados para controlar as funções do cronômetro. 
O cronômetro deve contar de 0 a 999.9 segundos
Para executar, usamos a placa de Prototipação Altera DE2-115 com o processador da série CycloneIV E.

## Grupo
* Antônio Lins Gomes Matos (algm)
* Henrique Alves Passos (hap)
* Matheus Barbosa Santos (mbs10)

## Projeto
Neste projeto da segunda Unidade deve ser desenvolvido um cronômetro digital utilizando Verilog com base de Máquina de Estados Finitos.

#### Comportamento
| Ações               | Comportamento   |
| ------------------ |  -----------------                         |
| Iniciar o sistema | O cronômetro deve estar parado com o valor 0 |
| Botão Reset | o cronômetro zerar, e parar a contagem |
| Botão Contar | O cronômetro deve iniciar a contagem |
| Botão Pausar | O cronômetro deverá parar de atualizar o display de segundos. E continuar a contar no background |
| Botão Parar | O cronômetro deve parar a contagem |

#### Siuações
*  Se o cronômetro estiver contando (pausado ou não), o usuário ao apertar a função o reset o display deve zerar e o relógio deve parar de contar
*  Se o cronômetro estiver parado, ou porque está no início, ou porque o usuário apertou o botão parar, e o botão Contar for pressionado,
  o display deve começar a contar do valor indicado no display.
*  Se estiver Pausado e o usuário apertar o botão Contar, o display volta a atualizar mostrando o valor da contagem feita no background.
*  Se o cronômetro estiver Pausado, e o usuário pressionar o botão Parar, o cronômetro deve parar,
 e o display exibir o valor da contagem feita no background.

#### Entradas
Botões *Reset*, *Contar*, *Pausar*, *Parar* que são comandos para executar as ações depois de apertados e soltos
Um clock da placa, que é tratado para contar déciomos de segundos a cada ciclo (utilizamos um contador para tratar isso)
#### Saídas
Displays de 7 segmentos para contagem. São utilizados 4 displays em que os 3 da esquerda para a direita são os segundos e o último da direita deve contar os décimos de segundo. <br>
4 Leds que representam os estados que estão executando.
