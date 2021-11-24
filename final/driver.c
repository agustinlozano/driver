#include <stdio.h>

int calc_det(int, int, int, int) __attribute__((cdecl));

int main(void) {
  int a, b, c, d;

  printf("\nInicializar valores");
  printf("\n\ta: ");
  scanf(" %d", &a);
  printf("\n\tb: ");
  scanf(" %d", &b);
  printf("\n\tc: ");
  scanf(" %d", &c);
  printf("\n\td: ");
  scanf(" %d", &d);

  printf("Finalmente, det = %d\n\n", calc_det(a, b, c, d));

  return 0;
}