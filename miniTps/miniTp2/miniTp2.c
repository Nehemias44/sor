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
	sem_t s1A, s2A, s3A, s1B, s2B, s3B, sll;
	pthread_t h1A, h2A, h3A, h1B, h2B, h3B;
	sem_init(&s1A, 0, 1); sem_init(&s2A, 0, 1); sem_init(&s3A, 0, 1);
	sem_init(&s1B, 0, 0); sem_init(&s2B, 0, 0); sem_init(&s3B, 0, 0);
	sem_init(&sll, 0, 1);

	struct Equipo eq1 = {1, 0, 0, "A", "B", &s1A, &s1B, &sll};
	struct Equipo eq2 = {2, 0, 0, "A", "B", &s2A, &s2B, &sll};
	struct Equipo eq3 = {3, 0, 0, "A", "B", &s3A, &s3B, &sll};

	pthread_create(&h1A, NULL, (void*)correrA, (void*)&eq1);
	pthread_create(&h1B, NULL, (void*)correrB, (void*)&eq1);
	pthread_create(&h2A, NULL, (void*)correrA, (void*)&eq2);
	pthread_create(&h2B, NULL, (void*)correrB, (void*)&eq2);
	pthread_create(&h3A, NULL, (void*)correrA, (void*)&eq3);
	pthread_create(&h3B, NULL, (void*)correrB, (void*)&eq3);
	
	printf("Inicio la carrera.\n");
	pthread_join(h1A, NULL); pthread_join(h1B, NULL);
	pthread_join(h2A, NULL); pthread_join(h2B, NULL);
	pthread_join(h3A, NULL); pthread_join(h3B, NULL);
	printf("Termino la carrera.\n");

	sem_destroy(&s1A); sem_destroy(&s2A);  sem_destroy(&s3A);
	sem_destroy(&s1B); sem_destroy(&s2B);  sem_destroy(&s3B);
	sem_destroy(&sll); pthread_exit(NULL); return 0;
}
