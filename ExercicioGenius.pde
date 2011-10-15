#define DEBUG
#define MAX_JOGADAS 5
#define NUM_BOTOES 3

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
}
