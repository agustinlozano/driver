#include <stdio.h>

/* prototipo para la rutina de ensamblador */
int calc_det(int, int, int, int) /*__attribute__((cdecl))*/;

int main(void) {
  int a, b, c, d;

  printf("Inicializar valores");
  printf("\n\ta: ");
  scanf("%d", &a);
  printf("\n\tb: ");
  scanf("%d", &b);
  printf("\n\tc: ");
  scanf("%d", &c);
  printf("\n\td: ");
  scanf("%d", &d);

  printf("Det: %d\n", calc_det(a, b, c, d));

  return 0;
}

int calc_det(int a, int b, int c, int d) {
  int EAX;
  int pseudoPila[3];

  EAX = a;
  EAX = EAX * c;

  pseudoPila[3] = EAX;

  EAX = d * d;
  EAX = EAX * b;

  EAX = pseudoPila[3] - EAX;

  return EAX;
}