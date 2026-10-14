// Gaia Giachero - 06/10/2026 

abstract class Shape {
  // firma
  double area();
  void stampa() => print(area());
}

class Cerchio extends Shape {
  double r;
  Cerchio(this.r);

  @override 
  double area() => 3.14*r*r; 
}

class Rettangolo extends Shape {
  final double base;
  final double altezza;
  Rettangolo(this.base, this.altezza);

  @override 
  double area() => base*altezza; 
}

void main(){
  final areaCerchio = Cerchio(2);
  final areaRettangolo = Rettangolo(2, 10);
  
  areaCerchio.stampa();
  areaRettangolo.stampa();
}