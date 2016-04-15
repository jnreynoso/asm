unsigned guess; /* La conjetura actual para el primo */
unsigned factor; /* El posible factor */
unsigned limit; /* Encontrar primos hasta el valor */

printf("Find primes up to: ");
scanf("%u", &limit);
printf("2\n"); /* Trata  los dos primeros primos */
printf("3\n"); /* Como caso especial */
guess = 5; /* Conjetura inicial */
while(guess <= limit){
  /* Busca un factor */
  factor = 3;
  while(factor*factor < guess && guess % factor != 0)
    factor += 2;
  if(guess % factor != 0)
    printf("%d\n, guess");
  guess += 2; /* solo busca en los numeros impares */

 }
