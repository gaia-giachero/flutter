// Gaia Giachero - 06/10/2026 

// OPZIONE 1
// abstract class Animal {
//   String verso();
//   void stampaVerso() => print(verso());
// }

// class Dog extends Animal {
//   Dog();

//   @override
//   String verso() => 'bau bau';
// }

// class Cat extends Animal {
//   Cat();

//   @override
//   String verso() => 'miao miao';
// }

// void main(){
//   final abbaia = Dog();
//   final miagola = Cat();

//   abbaia.stampaVerso();
//   miagola.stampaVerso();
// }

// OPZIONE 2
abstract class Animal {
  String verso();
  void stampaVerso() => print(verso());
}

class Dog extends Animal {
  final String ilSuoVerso;
  Dog(this.ilSuoVerso);

  @override
  String verso() => ilSuoVerso;
}

class Cat extends Animal {
  final String ilSuoVerso;
  Cat(this.ilSuoVerso);

  @override
  String verso() => ilSuoVerso;
}

void main(){
  final abbaia = Dog('bau bau');
  final miagola = Cat('miao miao');

  abbaia.stampaVerso();
  miagola.stampaVerso();
}