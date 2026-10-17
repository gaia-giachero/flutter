/* 
  ESERCIZIO: Operazioni asincrone (Future, async/await) con gestione eccezioni (try/catch/finally)
    1. Creare una funzione asincrona di simulazione:
        - Scrivere una funzione (es. Future<String> scaricaFile() async) che restituisca un Future.
        - All'interno usare Future.delayed(Duration(...)) per simulare l'attesa di un download dalla rete che impiega
            qualche secondo (es. 2 o 3 secondi).
    
    2. Introdurre la logica di fallimento (simulazione errore)
        - Usare una condizione (es. numero casuale con Random() o un parametro booleano di test) per decidere se il download 
            va a buon fine oppure fallisce.
        - Se fallisce sollevare un'eccezione usando l'istruzione throw Exception('Connessione interrotta o file non trovato').
    
    3. Gestire il flusso nel main()
        - Invocare la funzione usando la sintassi await dentro un blocco try.
        - Nel blocco catch (e) intercettare l'errore e stampare un messaggio chiaro per l'utente
            (evitando che l'applicazione vada in crash).
        - Nel blocco finally, stampare un messaggio finale che confermi che la sessione di download si è
            conclusa (sia in caso di successo che di errore).
*/

Future<String> scaricaFile(bool f) async {
  return Future.delayed(Duration(seconds: 2), 
  () {
    if (f) {
      throw Exception('Errore!');
    } else {
      return 'dati';
    }
  });
}

void main() async {
  bool fallimento = true;
  try {
    final d = await scaricaFile(fallimento);
    print(d);
  } catch (e) {
    print('Errore: $e');
  } finally {
    print('Sessione terminata');
  }
}
