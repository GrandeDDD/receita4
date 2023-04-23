import 'package:flutter/material.dart';

class MyTileWidget extends StatelessWidget {
  final String nome;
  final String categoria;
  final String preco;

  const MyTileWidget({
    required this.nome,
    required this.categoria,
    required this.preco,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(nome),
      subtitle: Text("$categoria - $preco"),
      trailing: Icon(Icons.arrow_forward),
      onTap: () {
        print("Tile foi tocado!");
      },
    );
  }
}

class MyApp extends StatelessWidget {
  MyApp();

  final navBarIcons = [
    Icons.arrow_back,
    Icons.house,
    Icons.table_bar,
    Icons.bathtub,
  ];

  final List<String> colorsList = ['Vermelho', 'Verde', 'Azul'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: Container(
            child: Text(
              "Decoração",
              style: TextStyle(color: Colors.white),
            ),
            alignment: Alignment.center,
          ),
          backgroundColor: Colors.green,
          actions: [
            PopupMenuButton(
              icon: Icon(Icons.more_vert),
              itemBuilder: (context) {
                return colorsList.map((color) {
                  return PopupMenuItem(
                    child: Text(color),
                    value: color,
                  );
                }).toList();
              },
              onSelected: (selectedColor) {
                print("Selecionaram a cor $selectedColor");
              },
            )
          ],
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.green.withOpacity(0.8),
                Colors.green.withOpacity(0.2),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            image: DecorationImage(
              image: NetworkImage(
                "https://i.imgur.com/QCDr6gq.jpeg",
              ),
              fit: BoxFit.cover,
              opacity: 0.5,
            ),
          ),
          child: ListView(
            children: [
              MyTileWidget(
                nome: 'Tapete para sala',
                categoria: 'Casa',
                preco: 'R\$34,99',
              ),
              MyTileWidget(
                nome: 'Toalha de mesa florida',
                categoria: 'Mesa',
                preco: 'R\$49,99',
              ),
              MyTileWidget(
                nome: 'Kit toalhas corpo/rosto',
                categoria: 'Banho',
                preco: 'R\$59,00',
              ),
              MyTileWidget(
                nome: 'Tapete para sala',
                categoria: 'Casa',
                preco: 'R\$34,99',
              ),
              MyTileWidget(
                nome: 'Toalha de mesa florida',
                categoria: 'Mesa',
                preco: 'R\$49,99',
              ),
              MyTileWidget(
                nome: 'Kit toalhas corpo/rosto',
                categoria: 'Banho',
                preco: 'R\$59,00',
              ),
              MyTileWidget(
                nome: 'Tapete para sala',
                categoria: 'Casa',
                preco: 'R\$34,99',
              ),
              MyTileWidget(
                nome: 'Toalha de mesa florida',
                categoria: 'Mesa',
                preco: 'R\$49,99',
              ),
              MyTileWidget(
                nome: 'Kit toalhas corpo/rosto',
                categoria: 'Banho',
                preco: 'R\$59,00',
              ),
              MyTileWidget(
                nome: 'Tapete para sala',
                categoria: 'Casa',
                preco: 'R\$34,99',
              ),
              MyTileWidget(
                nome: 'Toalha de mesa florida',
                categoria: 'Mesa',
                preco: 'R\$49,99',
              ),
              MyTileWidget(
                nome: 'Kit toalhas corpo/rosto',
                categoria: 'Banho',
                preco: 'R\$59,00',
              ),
              MyTileWidget(
                nome: 'Tapete para sala',
                categoria: 'Casa',
                preco: 'R\$34,99',
              ),
              MyTileWidget(
                nome: 'Toalha de mesa florida',
                categoria: 'Mesa',
                preco: 'R\$49,99',
              ),
              MyTileWidget(
                nome: 'Kit toalhas corpo/rosto',
                categoria: 'Banho',
                preco: 'R\$59,00',
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            print("Tocaram no botão $index");
          },
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.green,
          backgroundColor: Colors.green,
          items: List.generate(navBarIcons.length, (index) {
            return BottomNavigationBarItem(
              icon: Icon(navBarIcons[index]),
              label: "Voltar",
            );
          }),
        ),
        bottomSheet: Container(
          color: Colors.lightGreen,
          padding: EdgeInsets.all(16),
          child: Text(
            "Nova coleção chegando em breve!",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}
