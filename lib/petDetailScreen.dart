import 'package:flutter/material.dart';
import 'package:pet_adopt/favorites.dart';

class PetDetailScreen extends StatefulWidget {
  final String petName;
  final String location;
  final String gender;
  final String imagePath;

  PetDetailScreen({
    required this.petName,
    required this.location,
    required this.gender,
    required this.imagePath, required String description,
  });

  @override
  _PetDetailScreenState createState() => _PetDetailScreenState();
}

class _PetDetailScreenState extends State<PetDetailScreen> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = Favorites.isFavorite(widget.petName);
  }

  void toggleFavorite() {
    setState(() {
      if (isFavorite) {
        Favorites.removeFavorite(widget.petName);
      } else {
        Favorites.addFavorite(widget.petName);
      }
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.petName),
      ),
      body: Stack(
        children: [
          // Imagem de fundo
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.png', 
              fit: BoxFit.cover,
            ),
          ),
          // Conteúdo principal
          SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(widget.imagePath),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.petName,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.location,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        widget.gender,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Lorem ipsum dolor sit amet. Aut dolorem molestiae est voluptatem distinctio est accusantium facilis est numquam enim. Eos dolores fugit sed facilis ipsum vel nemo rerum ut tenetur consectetur et temporibus blanditiis. Ea perferendis unde qui internos eveniet est officiis inventore sed molestiae animi eos accusamus sapiente. Ut quam vitae vel repellat consectetur ea molestias velit cum doloribus magni!',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : null,
                  ),
                  onPressed: toggleFavorite,
                  tooltip: isFavorite ? 'Remover dos favoritos' : 'Adicionar aos favoritos',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
