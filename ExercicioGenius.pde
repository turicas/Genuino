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

void acendeLeds() {
    for (int j = 0; j < NUM_BOTOES; j++) {
        digitalWrite(LEDS[j], HIGH);
    }
}

void apagaLeds() {
    for (int j = 0; j < NUM_BOTOES; j++) {
        digitalWrite(LEDS[j], LOW);
    }
}

void piscaLedsDeAcordoComAsJogadas(int numeroDeJogadas) {
    for (int i = 0; i < numeroDeJogadas; i++) {
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

bool verificaBotoes(int numeroDeJogadas) {
    return false;
}

void piscaLeds() {
    delay(INTERVALO_PISCA_LED);
    acendeLeds();
    delay(INTERVALO_PISCA_LED);
    apagaLeds();
}

void perdeuJogo() {
    #ifdef DEBUG
    Serial.println("  Piscando todos os LEDs 1x...");
    #endif
    piscaLeds();
}

void ganhouJogo() {
    #ifdef DEBUG
    Serial.println("      Piscando todos os LEDs 3x...");
    #endif
    piscaLeds();
    piscaLeds();
    piscaLeds();
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
        Serial.print("Jogada ");
        Serial.print(i + 1);
        Serial.println(":");
        Serial.print("  Piscando LEDs: ");
        #endif
        piscaLedsDeAcordoComAsJogadas(i + 1);

        #ifdef DEBUG
        Serial.println("  Verificando botões...");
        #endif
        if (verificaBotoes(i + 1)) {
            #ifdef DEBUG
            Serial.println("    Apertou os botões corretamente.");
            #endif
            if (i == MAX_JOGADAS - 1) {
                #ifdef DEBUG
                Serial.println("      Rodada final - ganhou!");
                #endif
                ganhouJogo();
            }
        }
        else {
            #ifdef DEBUG
            Serial.println("    Botões apertados incorretamente - perdeu!");
            #endif
            perdeuJogo();
            break;
        }
    }
}
