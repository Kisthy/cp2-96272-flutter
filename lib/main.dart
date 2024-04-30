import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: const Color.fromARGB(255, 197, 178, 6),
        ),
      ),
      home: ContatosList(),
    );
  }
}

class Contato {
  String nome;
  String email;
  String imagemUrl;

  Contato({required this.nome, required this.email, required this.imagemUrl});
}

class ContatosList extends StatefulWidget {
  @override
  _ContatosListState createState() => _ContatosListState();
}

class _ContatosListState extends State<ContatosList> {
  final List<Map<String, dynamic>> data = [
    {
      "nome": "Camus",
      "email": "camus@cdz.com",
      "imagemUrl":
          "https://i0.wp.com/ovicio.com.br/wp-content/uploads/2023/05/20230508-camus-aquario.png?resize=768%2C432&ssl=1"
    },
    {
      "nome": "Hyoga",
      "email": "cygnushyoga@cdz.com",
      "imagemUrl":
          "https://static.wikia.nocookie.net/saintseya/images/9/9d/Hyoga_3_cloth.png/revision/latest?cb=20130331042305&path-prefix=pt"
    },
    {
      "nome": "Saga",
      "email": "geminigm@cdz.com",
      "imagemUrl":
          "https://static.wikia.nocookie.net/saintseya/images/2/2d/Saga_de_G%C3%AAmeos_%28Ouro%29.png/revision/latest?cb=20160321190429&path-prefix=pt"
    },
    {
      "nome": "Shion",
      "email": "shion@cdz.com",
      "imagemUrl":
          "https://saintseiyablog.files.wordpress.com/2013/02/02_6741.jpg"
    },
    {
      "nome": "Aiolos",
      "email": "aiolos@cdz.com",
      "imagemUrl":
          "https://static.wikia.nocookie.net/saintseya/images/f/fe/Aiolos_de_Sagit%C3%A1rio.png/revision/latest?cb=20160206224229&path-prefix=pt"
    },
  ];

  List<Contato> contatos = [];

  List<bool> favoritos = List.filled(5, false);

  int get likesCount {
    return favoritos.where((favorito) => favorito).length;
  }

  @override
  void initState() {
    super.initState();
    contatos = data
        .map((item) => Contato(
              nome: item['nome'],
              email: item['email'],
              imagemUrl: item['imagemUrl'],
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Crias de Athena mais chegados: $likesCount',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                'https://static.wikia.nocookie.net/ssu/images/e/e5/Zod%C3%ADaco_de_Ouro_Tencent.png/revision/latest?cb=20180129010137',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView.builder(
            itemCount: contatos.length,
            itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.all(8.0), // Margem ao redor do bloco de contato
            decoration: BoxDecoration(
              color: Colors.white, // Cor de fundo do bloco de contato
              borderRadius: BorderRadius.circular(8.0), // Borda arredondada do bloco de contato
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3), // Cor e opacidade da sombra
                  spreadRadius: 1, // Espalhamento da sombra
                  blurRadius: 4, // Desfoque da sombra
                  offset: Offset(0, 2), // Deslocamento da sombra (horizontal, vertical)
                ),
              ],
            ),
            child: ListTile(
              title: Text(
                contatos[index].nome,
                style: TextStyle(color: Colors.black), // Cor do texto do nome
              ),
                subtitle: Text(
                  contatos[index].email,
                  style: TextStyle(color: Colors.grey),
                ),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(contatos[index].imagemUrl),
                ),
                trailing: IconButton(
                  icon: Icon(
                    favoritos[index] ? Icons.account_balance_outlined : Icons.account_balance,
                    color: favoritos[index] ? const Color.fromARGB(255, 197, 178, 6) : null,
                  ),
                  onPressed: () {
                    setState(() {
                      favoritos[index] = !favoritos[index];
                    });
                  },
                ),
              ));
            },
          ),
        ));
  }
}
