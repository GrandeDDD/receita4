import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final navBarIcons = [
    Icons.arrow_back,
    Icons.house,
    Icons.table_bar,
    Icons.bathtub
  ];

  final List<Map<String, dynamic>> products = [
    {"name": "Tapete para sala", "sector": "Casa", "price": "R\$34,99"},
    {"name": "Toalha de mesa florida", "sector": "Mesa", "price": "R\$49,99"},
    {"name": "Kit toalhas corpo/rosto", "sector": "Banho", "price": "R\$59,00"},
    {"name": "Jogo de cama Queen", "sector": "Casa", "price": "R\$119,90"},
    {"name": "Cortina blackout", "sector": "Casa", "price": "R\$79,99"},
    {"name": "Tapete para sala", "sector": "Casa", "price": "R\$34,99"},
    {"name": "Porta-retrato decorativo", "sector": "Decoração", "price": "R\$29,90"},
    {"name": "Conjunto de panelas", "sector": "Mesa", "price": "R\$189,99"},
    {"name": "Toalha de mesa xadrez", "sector": "Mesa", "price": "R\$39,99"},
    {"name": "Almofada decorativa", "sector": "Casa", "price": "R\$49,90"},
    {"name": "Jogo de banho bordado", "sector": "Banho", "price": "R\$79,90"},
    {"name": "Espelho de parede", "sector": "Banho", "price": "R\$99,99"},
    {"name": "Kit de talheres", "sector": "Mesa", "price": "R\$29,99"},
    {"name": "Pano de prato estampado", "sector": "Mesa", "price": "R\$9,99"},
    {"name": "Porta-treco de cerâmica", "sector": "Casa", "price": "R\$19,90"},
    {"name": "Travesseiro de plumas", "sector": "Casa", "price": "R\$89,99"},
    {"name": "Luminária de mesa", "sector": "Casa", "price": "R\$59,90"},
    {"name": "Jogo americano de tecido", "sector": "Mesa", "price": "R\$19,99"},
    {"name": "Capa de almofada", "sector": "Casa", "price": "R\$19,99"},
    {"name": "Kit de toalhas para lavabo", "sector": "Banho", "price": "R\$29,90"},
    {"name": "Aparelho de jantar", "sector": "Mesa", "price": "R\$299,90"},
    {"name": "Tapete para banheiro", "sector": "Banho", "price": "R\$24,99"},
    {"name": "Vaso de plantas decorativo", "sector": "Casa", "price": "R\$69,90"}
  ];

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
                return [
                  PopupMenuItem(
                    child: Text("Vermelho"),
                  ),
                  PopupMenuItem(
                    child: Text("Verde"),
                  ),
                  PopupMenuItem(
                    child: Text("Azul"),
                  ),
                ];
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
          child: SingleChildScrollView(
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ListTile(
                  leading: Icon(Icons.shopping_cart),
                  title: Text(product['name'],),
                  subtitle: Text(product['sector']),
                  trailing: Text(product['price']),
                  onTap: () {
                    print('Tile ${product['name']} tocado');
                  },
                );
              },
            ),
          ),
        ),
        bottomNavigationBar: NewNavBar(navBarIcons),
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

class NewNavBar extends StatelessWidget {
  final List<IconData> navBarIcons;

  NewNavBar(this.navBarIcons);

  void botaoFoiTocado(int index) {
    print("Tocaram no botão $index");
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: botaoFoiTocado,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.green,
      backgroundColor: Colors.green,
      items: List.generate(navBarIcons.length, (index) {
        return BottomNavigationBarItem(
          icon: Icon(navBarIcons[index]),
          label: "Voltar",
        );
      }),
    );
  }
}
