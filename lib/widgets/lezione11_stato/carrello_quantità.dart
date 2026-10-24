/*
  Mini negozio: le quantità vivono solo nel padre; le righe sono Stateless
  e usano callback +/−.
    • Almeno 3 prodotti (nome + prezzo)
    • Figlio Stateless con bottoni + e −
    • − non scende sotto 0
    • Totale = somma prezzo × qty

  main()
    └─ runApp(const ShopApp())

  ShopApp (Stateless)
    ├─ const ShopApp({super.key})
    └─ build() → MaterialApp
        ├─ title: 'Negozio'
        ├─ debugShowCheckedModeBanner: false
        └─ home: ShopPage

  ShopPage (Stateful)
    ├─ const ShopPage({super.key})
    └─ State<ShopPage> createState() => _ShopPageState()

  _ShopPageState (extends State<ShopPage>)
    ├─ DATI (solo qui)
    │   ├─ prodotti: almeno 3, ognuno con nome + prezzo
    │   └─ quantità: una per ogni prodotto, tutte a 0 all'inizio
    ├─ METODI
    │   ├─ _increment(indice) → setState: quantità + 1
    │   ├─ _decrement(indice) → setState: quantità − 1, solo se > 0
    │   └─ totale → somma di prezzo × quantità di ogni prodotto
    └─ build()
        └─ Scaffold
            ├─ AppBar
            │   ├─ centerTitle: true
            │   └─ title: Text('Negozio')
            └─ body: Column
                ├─ Expanded
                │   └─ ListView (una riga per prodotto)
                │       └─ ProductRow
                │           ├─ name: nome del prodotto
                │           ├─ price: prezzo del prodotto
                │           ├─ qty: quantità di quel prodotto
                │           ├─ onAdd: () → _increment(indice)
                │           └─ onRemove: () → _decrement(indice)
                └─ Padding
                    └─ Text('Totale: ...')

  ProductRow (Stateless)
    ├─ campi final: name, price, qty, onAdd, onRemove
    ├─ const ProductRow({super.key, required ...})
    └─ build()
        └─ Row
            ├─ Expanded > Column
            │   ├─ Text(name)
            │   └─ Text(price)
            ├─ IconButton (−) → onPressed: onRemove
            ├─ Text(qty)
            └─ IconButton (+) → onPressed: onAdd

*/

import 'package:flutter/material.dart';

void main() {
  runApp(const ShopApp());
}

class ShopApp extends StatelessWidget {
  const ShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Negozio',
      debugShowCheckedModeBanner: false,
      home: ShopPage(),
    );
  }
}

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class Prodotti {
  final String nome;
  final double prezzo;
  int quantita;

  Prodotti({required this.nome, required this.prezzo, required this.quantita});
}

class _ShopPageState extends State<ShopPage> {
  final List<Prodotti> _prodotti = [
    Prodotti(nome: 'Laptop', prezzo: 500, quantita: 0),
    Prodotti(nome: 'Sedia', prezzo: 20, quantita: 0),
    Prodotti(nome: 'Maglietta', prezzo: 50, quantita: 0),
    Prodotti(nome: 'Smartphone', prezzo: 799, quantita: 0),
    Prodotti(nome: 'Cuffie', prezzo: 35, quantita: 0),
    Prodotti(nome: 'Mouse', prezzo: 15, quantita: 0),
    Prodotti(nome: 'Tastiera', prezzo: 45, quantita: 0),
    Prodotti(nome: 'Monitor', prezzo: 180, quantita: 0),
    Prodotti(nome: 'Tablet', prezzo: 250, quantita: 0),
    Prodotti(nome: 'Zaino', prezzo: 40, quantita: 0),
    Prodotti(nome: 'Scarpe', prezzo: 75, quantita: 0),
    Prodotti(nome: 'Jeans', prezzo: 40, quantita: 0),
    Prodotti(nome: 'Felpa', prezzo: 35, quantita: 0),
    Prodotti(nome: 'Libro', prezzo: 18, quantita: 0),
    Prodotti(nome: 'Lampada', prezzo: 25, quantita: 0),
    Prodotti(nome: 'Zerbino', prezzo: 12, quantita: 0),
    Prodotti(nome: 'Borraccia', prezzo: 15, quantita: 0),
    Prodotti(nome: 'Orologio', prezzo: 120, quantita: 0),
    Prodotti(nome: 'Fotocamera', prezzo: 350, quantita: 0),
    Prodotti(nome: 'Stampante', prezzo: 90, quantita: 0),
  ];

  void _increment(int index) {
    setState(() {
      _prodotti[index].quantita++;
    });
  }

  void _decrement(int index) {
    if (_prodotti[index].quantita > 0) {
      setState(() {
        _prodotti[index].quantita--;
      });
    }
  }

  double totale() {
    double tot = 0;
    for (var i = 0; i < _prodotti.length; i++) {
      tot += _prodotti[i].prezzo * _prodotti[i].quantita;
    }

    return tot;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Negozio')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _prodotti.length,
              itemBuilder: (context, index) {
                final product = _prodotti[index];
                return ProductRow(
                  name: product.nome,
                  price: product.prezzo,
                  qty: product.quantita,
                  onAdd: () => _increment(index),
                  onRemove: () => _decrement(index),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Totale: €${totale().toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductRow extends StatelessWidget {
  final String name;
  final double price;
  final int qty;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  const ProductRow({
    super.key,
    required this.name,
    required this.price,
    required this.qty,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text('€${price.toStringAsFixed(2)}'),
              ],
            ),
          ),
          IconButton(onPressed: onRemove, icon: const Icon(Icons.remove)),
          Text('$qty'),
          IconButton(onPressed: onAdd, icon: const Icon(Icons.add)),
        ],
      ),
    );
  }
}
