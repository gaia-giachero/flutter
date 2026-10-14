// void main() {
//   print('Ciao, classe!');
// }

// funzione calcolatrice in base a 2 numeri inseriti manualmente
// void main() {
//   int a = 5;
//   int b = 10;

//   int somma = a + b;
//   int sottrazione = b - a;
//   int moltiplicazione = a * b;
//   double divisione = b / a;

//   print('Somma: $somma');
//   print('$b - $a = $sottrazione');
//   print('Moltiplicazione: $a x $b = $moltiplicazione');
//   print('Il risultato della divisione tra $b e $a è $divisione');
  
//   print('Usando come numeri a=$a e b=$b ho fatto la somma = $somma, la sottrazione = $sottrazione, la moltiplicazione = $moltiplicazione e la divisione = $divisione.');  
// }

// seconda versione: con if...else e operatori
// void main() {  
//   int a = 16;
//   int b = 2;
//   String operatore = '+';
//   String messaggio = '';
  
//   if(operatore == '+'){
//     int somma = a + b;
//     messaggio = 'La somma tra $a e $b è $somma';
//   } else if(operatore == '-'){
//     int sottrazione = a - b;
//     messaggio = 'La sottrazione tra $a e $b è $sottrazione';
//   } else if(operatore == '*'){
//     int moltiplicazione = a*b;
//     messaggio = 'La moltiplicazione tra $a e $b è $moltiplicazione';
//   } else {
//     double divisione = a/b;
//     messaggio = 'La divisione tra $a e $b è $divisione';
//   }
  
//   print(messaggio);
// }

// funzione che ritorna i dati
// void main(){
//   String nome = 'Gaia';
//   String cognome = 'Giachero';
//   int eta = 20;
//   int altezza = 160;

//   print('Ciao sono $nome $cognome, ho $eta e sono alta $altezza cm.');
// }

// funzione che ritorna i dati con costruttore
class Persona {
  String nome;
  String cognome;
  int eta;
  int altezza;

  Persona(this.nome, this.cognome, this.eta, this.altezza);

  void presentazione(){
    print('Ciao sono $nome $cognome, ho $eta e sono alta $altezza cm.');
  }
}

void main(){
  Persona p1 = Persona('Gaia', 'Giachero', 20, 160);
  p1.presentazione();
}