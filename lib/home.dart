import 'package:flutter/material.dart';
import 'package:pet_adopt/AllPetsScreen.dart';
import 'package:pet_adopt/petDetailScreen.dart';
import 'package:pet_adopt/FavoriteScreen.dart';

class Home extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Home> {
  final List<String> petImages = [
    'assets/images/pet0.png',
    'assets/images/pet1.png',
    'assets/images/pet2.png',
    'assets/images/pet3.png',
    'assets/images/pet4.png',
    'assets/images/pet6.png',
    'assets/images/pet7.png',
    'assets/images/pet8.png',
    'assets/images/pet9.png',
  ];

  final List<String> petNames = [
    'Samantha',
    'Tigris',
    'Bido',
    'Thor',
  ];

  final List<String> petLocations = [
    'California (2,5km)',
    'Boston (1,2km)',
    'Itajubá (5km)',
    'Rio de Janeiro (10km)',
  ];

  final List<String> petGenders = [
    '♀️',
    '♂️',
    '♂️',
    '♀️',
  ];

  int selectedCategoryIndex = 0;

  List<String> categories = [
    'Geral',
    'Cães',
    'Gatos',
    'Aves',
    'Roedores',
  ];

  List<String> categoryIcons = [
    'assets/images/icon0.png',
    'assets/images/icon1.png',
    'assets/images/icon2.png',
    'assets/images/icon3.png',
    'assets/images/icon4.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adote um Pet'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite), 
            onPressed: () {
              Navigator.push(
                context,
               MaterialPageRoute(builder: (context) => FavoritesScreen())
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.grey[100],
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Pesquisar...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Categorias',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 60,
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategoryIndex = index;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 4.0),
                        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                        decoration: BoxDecoration(
                          color: selectedCategoryIndex == index
                              ? const Color.fromARGB(255, 189, 110, 178)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Image.asset(categoryIcons[index], width: 24, height: 24),
                            SizedBox(width: 8),
                            Text(
                              categories[index],
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Adote um Pet',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: petImages.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PetDetailScreen(
                              petName: petNames[index],
                              location: petLocations[index],
                              gender: petGenders[index],
                              imagePath: petImages[index], description: '',
                            ),
                          ),
                        );
                      },
                      child: Container(
                        width: 200,
                        margin: EdgeInsets.symmetric(horizontal: 8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Stack(
                            children: [
                              Image.asset(
                                petImages[index],
                                width: 200,
                                height: 300,
                                fit: BoxFit.cover,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.black.withOpacity(0.5),
                                      Colors.black.withOpacity(0.2),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                left: 8,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      petNames[index],
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      petLocations[index],
                                      style: TextStyle(fontSize: 14, color: Colors.white),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      petGenders[index],
                                      style: TextStyle(fontSize: 14, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AllPetsScreen()),
                    );
                  },
                  child: Text('See All Pets'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
