#define DEBUG

//Configurações do jogo:
#define MAX_JOGADAS 5
#define NUM_BOTOES 3

//Não mexa daqui para baixo!
int jogadas[MAX_JOGADAS];

void sorteiaJogadas() {
    randomSeed(analogRead(0));
    for (int i = 0; i < MAX_JOGADAS; i++) {
        jogadas[i] = random(NUM_BOTOES); //0, ..., NUM_BOTOES - 1
        #ifdef DEBUG
        Serial.print("  Jogada sorteada: ");
        Serial.println(jogadas[i]);
        #endif
    }
}

void setup() {
    #ifdef DEBUG
    Serial.begin(9600);
    #endif
}

void loop() {
    #ifdef DEBUG
    delay(1000);
    Serial.println("Sorteando jogadas...");
    #endif
    sorteiaJogadas();

    #ifdef DEBUG
    Serial.println("Iniciando jogadas...");
    #endif
    for (int i = 1; i <= MAX_JOGADAS; i++) {
        #ifdef DEBUG
        Serial.print("  Piscando LEDs da jogada ");
        Serial.print(i);
        Serial.println("...");
        #endif
    }
}
