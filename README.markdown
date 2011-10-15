Genuino
=======

Implementação do jogo da memória para Arduino.


Como usar
---------

- Faça download do arquivo `Genuino.pde`
- Abra-o na IDE do Arduino
- Edite informações referentes aos pinos dos LEDs e botões
- Certifique-se de que está utilizando botões em pull-up
- Faça upload
- Divirta-se!


Número de LEDs e botões
-----------------------

Por padrão, o jogo utiliza 3 LEDs e 3 botões, mas você pode alterar facilmente
para um número maior ou menor, basta alterar a constante `NUM_BOTOES` e as
varíaveis `NUM_BOTOES`, `LEDS` e `BOTOES`.


Por Fazer
---------

- Encapsular as funções referentes ao jogo em uma classe
- Corrigir falha na função `verificaBotao` (atualmente ela retorna `true` mesmo
  quando você aperta um botão errado antes de apertar o correto)


Licença
-------

Este software é __livre__ e está licenciado com a [licença
GPL](http://www.gnu.org/copyleft/gpl.html). Colabore!


Copyright
---------

Copyright &copy; [Álvaro Justen](http://blog.justen.eng.br) 2011
