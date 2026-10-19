/*
  Mostra un catalogo a griglia (almeno 6 prodotti). 
  Ogni cella: icona/colore, nome, prezzo. 
  Al tap: SnackBar o pagina dettaglio.
    • GridView.builder con crossAxisCount: 2
    • Celle con Card (o Container decorato)
    • Dati in una lista tipizzata (classe Prodotto)
    • Feedback al tap (SnackBar minimo)

    main()
      └─ runApp(const CatalogoApp())

    Prodotto
      ├─ final IconData icona
      ├─ final String nome
      ├─ final double prezzo 
      └─ const Prodotto({required this.icona, required this.nome, required this.prezzo})

    CatalogoApp (StatelessWidget)
      ├─ const CatalogoApp({super.key})
      └─ build() → MaterialApp
          ├─ title: 'Prodotti'
          ├─ debugShowCheckedModeBanner: false
          ├─ theme: ThemeData
          │   ├─ colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal)
          │   └─ useMaterial3: true
          └─ home: CatalogoPage

    CatalogoPage (StatelessWidget)
      ├─ static const _prodotti = [Prodotto(...), ... almeno 6]
      └─ build() → Scaffold
          ├─ AppBar
          │   └─ title: Text('Catalogo')
          └─ body: GridView.builder
              ├─ padding: EdgeInsets.all(12)
              ├─ gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
              │   ├─ crossAxisCount: 2
              │   ├─ mainAxisSpacing: 12
              │   ├─ crossAxisSpacing: 12
              │   └─ childAspectRatio: 0.9
              ├─ itemCount: _prodotti.length
              └─ itemBuilder: (context, index)
                  ├─ final prodotto = _prodotti[index]
                  └─ Card
                      └─ InkWell
                          ├─ onTap: () { ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Prodotto cliccato: ${prodotto.nome} - ${prodotto.prezzo.toStringAsFixed(2)} €'))); }
                          └─ child: Column
                              ├─ mainAxisAlignment: MainAxisAlignment.center
                              └─ children:
                                  ├─ Icon(prodotto.icona)
                                  ├─ Text(prodotto.nome)
                                  └─ Text('${prodotto.prezzo.toStringAsFixed(2)} €'))
*/