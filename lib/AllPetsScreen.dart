import 'package:flutter/material.dart';
import 'package:pet_adopt/petDetailScreen.dart';

class AllPetsScreen extends StatefulWidget {
  @override
  _AllPetsScreenState createState() => _AllPetsScreenState();
}

class _AllPetsScreenState extends State<AllPetsScreen> {
  // Listas de pets
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
    // Adicione mais imagens conforme necessário
  ];

  final List<String> petNames = [
    'Samantha',
    'Tigris',
    'Bido',
    'Thor',
    'Bella',
    'Max',
    'Phoebe',
    'Marshal',
    'Joey',
    // Adicione mais nomes conforme necessário
  ];

  final List<String> petLocations = [
    'California (2,5km)',
    'Boston (1,2km)',
    'Itajubá (5km)',
    'Rio de Janeiro (10km)',
    'São Paulo (3km)',
    'Curitiba (4km)',
    'São Bernardo (2km)',
    'Carapicuiba (8km)',
    'Mirante (8km)',
    // Adicione mais localizações conforme necessário
  ];

  final List<String> petGenders = [
    '♀️',
    '♂️',
    '♂️',
    '♀️',
    '♀️',
    '♂️',
    '♂️',
    '♀️',
    '♀️',
    // Adicione mais gêneros conforme necessário
  ];

  // Variável para manter a categoria selecionada
  String selectedCategory = 'Todos';

  @override
  Widget build(BuildContext context) {
    // Filtra os pets com base na categoria selecionada
    List<int> filteredPetIndexes = [];
    for (int i = 0; i < petNames.length; i++) {
      if (selectedCategory == 'Todos' || petNames[i].toLowerCase().contains(selectedCategory.toLowerCase())) {
        filteredPetIndexes.add(i);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Todos os Pets'),
      ),
      body: Container(
        color: Colors.grey[100], // Fundo cinza claro
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Título "Categorias"
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Categorias',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              // Seção de categorias
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Botões de categorias
                    _categoryButton('Todos'),
                    _categoryButton('Cães'),
                    _categoryButton('Gatos'),
                    _categoryButton('Aves'),
                    _categoryButton('Roedores'),
                  ],
                ),
              ),
              // Título "Adote um Pet"
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Adote um Pet',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              // Lista de pets
              GridView.builder(
                padding: const EdgeInsets.all(8.0),
                physics: NeverScrollableScrollPhysics(), 
                shrinkWrap: true, 
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, 
                  childAspectRatio: 0.75, 
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: filteredPetIndexes.length,
                itemBuilder: (context, index) {
                  int petIndex = filteredPetIndexes[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PetDetailScreen(
                            petName: petNames[petIndex],
                            location: petLocations[petIndex],
                            gender: petGenders[petIndex],
                            imagePath: petImages[petIndex], description: '',
                          ),
                        ),
                      );
                    },
                    child: Container(
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
                              petImages[petIndex],
                              fit: BoxFit.cover,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.black.withOpacity(0.5),
                                    Colors.black.withOpacity(0.3),
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
                                    petNames[petIndex],
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    petLocations[petIndex],
                                    style: TextStyle(fontSize: 14, color: Colors.white),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    petGenders[petIndex],
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _categoryButton(String category) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = category; 
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: selectedCategory == category ? const Color.fromARGB(255, 242, 191, 252) : Colors.white, 
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: const Color.fromARGB(255, 242, 191, 252), width: 1.5),
        ),
        child: Text(
          category,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: selectedCategory == category ? Colors.black : const Color.fromARGB(255, 0, 0, 0), 
          ),
        ),
      ),
    );
  }
}
