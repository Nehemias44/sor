#include <stdio.h>
#include <unistd.h>
#include <time.h>
#include <pthread.h>

void *calculo_aritmetico()
{
	int contador = 0;
	while(contador < 2147483647) {
		contador=contador+1;
	}
	return NULL;
}

int main()
{
	time_t inicio, final;
	double sin_pthread, con_pthread, mejora;
	
	inicio = time(NULL);
	calculo_aritmetico();
	calculo_aritmetico();
	calculo_aritmetico();
	calculo_aritmetico();
	calculo_aritmetico();
	final = time(NULL);
	sin_pthread = difftime(final, inicio);
	printf("Prueba de ejecucion sin pthread: %2.f segundos\n", sin_pthread);

	pthread_t h1, h2, h3, h4, h5;
	inicio = time(NULL);
	pthread_create(&h1, NULL, calculo_aritmetico, NULL);
	pthread_create(&h2, NULL, calculo_aritmetico, NULL);
	pthread_create(&h3, NULL, calculo_aritmetico, NULL);
	pthread_create(&h4, NULL, calculo_aritmetico, NULL);
	pthread_create(&h5, NULL, calculo_aritmetico, NULL);
	pthread_join(h1, NULL);
	pthread_join(h2, NULL);
	pthread_join(h3, NULL);
	pthread_join(h4, NULL);
	pthread_join(h5, NULL);
	final = time(NULL);
	con_pthread = difftime(final, inicio);
	mejora = (((sin_pthread - con_pthread)/con_pthread)*100);
	printf("Prueba de ejecucion con pthread: %2.f segundos\n", con_pthread);
	printf("Diferencia de %2.f segundos, una mejora del %2.f%% en tiempo de ejecucion.\n", sin_pthread - con_pthread, mejora);
	return 0;
}
