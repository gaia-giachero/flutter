import 'dart:io';

// menu CLI con if/switch
void main() {
  stdout.write('Inserisci un numero: ');
  String? input = stdin.readLineSync();

  if(input == '1'){
    print('Ciao.');
  } else if(input == '2'){
    print('Buongiorno.');
  } else {
    print('Buonanotte.');
  }

  switch(input){
    case '1': 
      print('Ciao.');
    case '2': 
      print('Buongiorno');
    default:
      print('Buonanotte');
  }
}