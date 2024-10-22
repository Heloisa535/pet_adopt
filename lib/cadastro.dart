import 'package:flutter/material.dart';
import 'package:pet_adopt/home.dart';

class Cadastro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'), // Imagem de fundo
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 80), // Espaçamento no topo
                Image.asset(
                  'assets/images/logo.png', // Substitua pelo caminho correto da sua logo
                  width: 200,
                  height: 200,
                ),
                SizedBox(height: 30),
                Text(
                  'Crie sua Conta',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Usuário',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF007BFF), // Cor do botão
                    padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                 onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Home()),
  );
},

                  child: Text(
                    'Entrar',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white, // Cor do texto do botão
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
