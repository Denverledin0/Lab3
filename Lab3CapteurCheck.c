#include <stdio.h>
#include <stdlib.h>

int main() {
    int ret = system("./Lab3CapteurCheck.sh");
    if (ret == 0) {
        printf("Le script Bash a été exécuté avec succès.\n");
    } else {
        printf("Erreur lors de l'exécution du script Bash.\n");
    }
    return 0;
}
