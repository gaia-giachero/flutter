/* 
  ESERCIZIO: Generics<T>
    1. Scegliere una delle due strutture da implementare:
        - Opzione A (Box<T>): si deve creare una classe contenitore generica Box<T> che possa custodire 
            un valore di qualsiasi tipo T (un intero, una stringa, un oggetto personalizzato come User o Prodotto).
        - Opzione B (Repository<T>): se si vuole un appproccio più avanzato, creare una classe Repository<T> che simuli
            un archivio o database in memoria.
    
    2. Definire lo stato e la gestione dei dati
        - Per la Box<T>: definire un campo interno di tipo T o una lista List<T> per contenere più elementi.
        - Aggiungere metodi per inserire un elemento (es. add(T elemento)), recuperare o stampare il contenuto e verificarne 
            lo stato (es. se è vuoto o quanti elementi contiene).
    
    3. Nel main() (verifica a compile-time)
        - Istanziare la classe specificando tipi diversi in momenti diversi (es. creare una Box<int> e una Box<String>).
        - Verificare che Dart garantisca la sicurezza deltipo: provare a inserire un dato del tipo corretto e osservare come il 
            compilatore blocca subito se si prova ad aggiungere un tipo errato senza bisogno di fare conversione manuale (cast as).
*/

import 'dart:collection';

class Box<T> {
  List<T> lista = [];
  Box.add(T elemento);
  
  void stampaContenuto(){
    for(var i=0; i<lista.length; i++){
      print('Elemento: $i');
    }
  }

  void isEmpty(){
    if(lista.isEmpty){
      print('Lista vuota');
    }
  }

  void numeroElementi(){
    int n = lista.length;
    print(n);
  }
}

void main() {
  var bInt = Box<int>;
  
}
