/* Gaia Giachero - 29-09-2026 */

// Lista voti: media, max, promossi
void main() {
  final voti = [5, 8, 9, 3, 10];

  void media() {
    int somma = 0;
    for(var i=0; i<voti.length; i++){
      somma += voti[i];
    }

    double mediaVoti = somma/voti.length;
    
    print(mediaVoti);
  }

  void max() {
    int massimo = voti[0];
    for (var v in voti) {
      if(v > massimo){
        massimo = v;
      }
    }

    print(massimo);
  }

  void promossi() {
    final votiPromossi = voti.where((v) => v >= 6);
    votiPromossi.toList();
    print(votiPromossi);
  }

  media();
  max();
  promossi();
}
