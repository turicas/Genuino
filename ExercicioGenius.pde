#define DEBUG

//Configurações do jogo:
#define MAX_JOGADAS 5
#define NUM_BOTOES 3
#define INTERVALO_PISCA_LED 1000

//Configurações de hardware:
#define LED_1 5
#define LED_2 6
#define LED_3 7


//Não mexa daqui para baixo!
int jogadas[MAX_JOGADAS];
int LEDS[NUM_BOTOES] = { LED_1, LED_2, LED_3 };

void sorteiaJogadas() {
    randomSeed(analogRead(0));
    for (int i = 0; i < MAX_JOGADAS; i++) {
        jogadas[i] = random(NUM_BOTOES); //0, ..., NUM_BOTOES - 1
        #ifdef DEBUG
        Serial.print(jogadas[i]);
        Serial.print(" ");
        #endif
    }
    Serial.println();
}

void setup() {
    #ifdef DEBUG
    Serial.begin(9600);
    Serial.println("Colocando LEDs como OUTPUT...");
    #endif
    pinMode(LED_1, OUTPUT);
    pinMode(LED_2, OUTPUT);
    pinMode(LED_3, OUTPUT);
}

void apagaLeds() {
    for (int j = 0; j < NUM_BOTOES; j++) {
        digitalWrite(LEDS[j], LOW);
    }
}

void piscaLeds(int n) {
    for (int i = 0; i < n; i++) {
        #ifdef DEBUG
        Serial.print(jogadas[i]);
        Serial.print(" ");
        #endif
        delay(INTERVALO_PISCA_LED);
        for (int j = 0; j < NUM_BOTOES; j++) {
            digitalWrite(LEDS[j], jogadas[i] == j);
        }
        delay(INTERVALO_PISCA_LED);
        apagaLeds();
    }
    #ifdef DEBUG
    Serial.println();
    #endif
}

void loop() {
    #ifdef DEBUG
    delay(1000);
    Serial.print("Sorteando jogadas: ");
    #endif
    sorteiaJogadas();

    #ifdef DEBUG
    Serial.println("Iniciando jogadas...");
    #endif
    for (int i = 0; i < MAX_JOGADAS; i++) {
        #ifdef DEBUG
        Serial.print("  Piscando LEDs da jogada ");
        Serial.print(i + 1);
        Serial.print(": ");
        #endif
        piscaLeds(i + 1);
    }
}
