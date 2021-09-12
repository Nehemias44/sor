#include <stdio.h>
#include <unistd.h>
#include <time.h>
 
int main()
{
	unsigned long long limite = ~0;
	char letra;
	printf("Si desea continuar ingrese la letra [S/s],\npara salir ingrese cualquier letra.\n");
	printf("Para cancelar la ejecucion presione [Ctrl+c].\n ");
	scanf("%c",&letra);
	
	if(letra == 'S' || letra == 's' ){
		for (unsigned long long i = 0; i < limite; ++i) {
			usleep(1);
			printf("Numero %llu y contando.\n", i);
		}
	}
	return 0;
}
