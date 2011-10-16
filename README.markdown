Genuino
=======

Genuino é uma implementação de um jogo da memória para Arduino, parecido com o
famoso (e antigo) [Genius](http://pt.wikipedia.org/wiki/Genius_%28jogo%29).


Como usar
---------

- Faça download do arquivo `Genuino.pde`;
- Crie um diretório chamado `Genuino` em sua pasta `sketchbook`;
- Coloque o arquivo `Genuino.pde` em `sketchbook/Genuino`;
- Abra a IDE do Arduino;
- Abra `File` -> `Sketchbook` -> `Genuino`;
- Edite informações referentes aos pinos dos LEDs e botões;
- Monte seu circuito - certifique-se de que está utilizando botões em pull-up;
- Clique no botão *Upload* (Ctrl-U);
- Divirta-se! \o/


Número de LEDs e botões
-----------------------

Por padrão, o jogo utiliza 3 LEDs e 3 botões, mas você pode alterar facilmente
para um número maior ou menor, basta alterar a constante `NUM_BOTOES` e as
varíaveis `LEDS` e `BOTOES`. Para 4 opções, por exemplo, você precisa alterar o
código de:

    #define NUM_BOTOES 3
    (...)
    int LEDS[NUM_BOTOES] = { LED_1, LED_2, LED_3 };
    int BOTOES[NUM_BOTOES] = { BOTAO_1, BOTAO_2, BOTAO_3 };

Para:

    #define NUM_BOTOES 4
    (...)
    #define LED_4 8
    (...)
    #define BOTAO_3 10
    (...)
    int LEDS[NUM_BOTOES] = { LED_1, LED_2, LED_3, LED_4 };
    int BOTOES[NUM_BOTOES] = { BOTAO_1, BOTAO_2, BOTAO_3, BOTAO_4 };

Nesse caso, o novo LED estará na porta digital 8 e o novo botão na porta
digital 10.


Por Fazer
---------

- Encapsular as funções referentes ao jogo em uma classe e gerar uma biblioteca
  a partir disso;
- Corrigir falha na função `verificaBotao` (atualmente ela retorna `true` mesmo
  quando você aperta um botão errado antes de apertar o correto);
- Adicionar *buzzer* no circuito e tocar sons em determinados eventos (quando
  usuário ganha o jogo, quando usuário perde o jogo etc.).


Licença
-------

Este software é __livre__ e está licenciado com a [licença
GPL](http://www.gnu.org/copyleft/gpl.html). Colabore!


Copyright
---------

Copyright &copy; [Álvaro Justen](http://blog.justen.eng.br) 2011
