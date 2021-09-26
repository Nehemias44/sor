#include <stdio.h>
#include <pthread.h>
#include <semaphore.h>

#define META 2147483647

struct Equipo {
	int   id, c1, c2;
	char  *a1,*a2;
	sem_t *s1,*s2,*sll;
};

static void correrA(struct Equipo *e)
{
	sem_wait(e->s1);
	while(e->c1 < META){ e->c1+=1; }
	sem_post(e->s2);
	printf("Athleta %s del equipo %d paso la posta\n", e->a1, e->id);
}

static void correrB(struct Equipo *e)
{
	sem_wait(e->s2);
	while(e->c2 < META){ e->c2+=1; }
	sem_post(e->s1);
	sem_wait(e->sll);
	printf("Athleta %s del equipo %d  llego a la meta.\n", e->a2, e->id);
	sem_post(e->sll);
}

int main()
{
	sem_t sem[7]; pthread_t thread[6];
	struct Equipo eq1 = {1, 0, 0, "A", "B", &sem[0], &sem[1], &sem[7]};
	struct Equipo eq2 = {2, 0, 0, "A", "B", &sem[2], &sem[3], &sem[7]};
	struct Equipo eq3 = {3, 0, 0, "A", "B", &sem[4], &sem[5], &sem[7]};
	
	sem_init(&sem[0], 0, 1); pthread_create(&thread[0], NULL, (void*)correrA, (void*)&eq1);
	sem_init(&sem[1], 0, 0); pthread_create(&thread[1], NULL, (void*)correrB, (void*)&eq1);
	sem_init(&sem[2], 0, 1); pthread_create(&thread[2], NULL, (void*)correrA, (void*)&eq2);
	sem_init(&sem[3], 0, 0); pthread_create(&thread[3], NULL, (void*)correrB, (void*)&eq2);
	sem_init(&sem[4], 0, 1); pthread_create(&thread[4], NULL, (void*)correrA, (void*)&eq3);
	sem_init(&sem[5], 0, 0); pthread_create(&thread[5], NULL, (void*)correrB, (void*)&eq3);
	sem_init(&sem[6], 0, 1);	
	
	printf("Inicio la carrera.\n");
	pthread_join(thread[0], NULL); pthread_join(thread[1], NULL);
	pthread_join(thread[2], NULL); pthread_join(thread[3], NULL);
	pthread_join(thread[4], NULL); pthread_join(thread[5], NULL);
	printf("Termino la carrera.\n");

	sem_destroy(&sem[0]); sem_destroy(&sem[1]);  sem_destroy(&sem[2]);
	sem_destroy(&sem[3]); sem_destroy(&sem[4]);  sem_destroy(&sem[5]);
	sem_destroy(&sem[7]); pthread_exit(NULL); return 0;
}
