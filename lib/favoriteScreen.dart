import 'package:flutter/material.dart';
import 'package:pet_adopt/favorites.dart';
import 'package:pet_adopt/petDetailScreen.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> favoritePets = Favorites.getFavorites();

    return Scaffold(
      appBar: AppBar(
        title: Text('Pets Favoritos'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'), // Substitua pelo caminho da sua imagem de fundo
            fit: BoxFit.cover,
          ),
        ),
        child: favoritePets.isEmpty
            ? Center(child: Text('Nenhum pet favorito ainda.', style: TextStyle(color: Colors.white)))
            : ListView.builder(
                itemCount: favoritePets.length,
                itemBuilder: (context, index) {
                  String petName = favoritePets[index];

                  return Card(
                    margin: EdgeInsets.all(8.0),
                    elevation: 5,
                    child: ListTile(
                      contentPadding: EdgeInsets.all(10.0),
                      leading: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/pet_placeholder.png'), // Substitua pela imagem real do pet se disponível
                      ),
                      title: Text(
                        petName,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        // Navegar para a tela de detalhes do pet
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PetDetailScreen(
                              petName: petName,
                              location: 'Localização desconhecida', // Substitua conforme necessário
                              gender: 'Gênero desconhecido', // Substitua conforme necessário
                              imagePath: 'assets/images/pet0.png', // Substitua conforme necessário
                              description: 'Descrição não disponível', // Substitua conforme necessário
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
      ),
    );
  }
}
