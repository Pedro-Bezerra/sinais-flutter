import 'package:flutter/material.dart';

class BuscarPage extends StatelessWidget {
  const BuscarPage({super.key});

  @override
  Widget build(BuildContext context) {
    // List of images and texts for the grid elements
    final List<Map<String, String>> gridItems = [
      {"image": "assets/images/viagem.png", "text": "Viagem"},
      {"image": "assets/images/comida.png", "text": "Comida"},
      {"image": "assets/images/animal.png", "text": "Animais"},
      {"image": "assets/images/plantas.png", "text": "Plantas"},
      {"image": "assets/images/corpo.png", "text": "Corpo"},
      {"image": "assets/images/vegetais.png", "text": "Vegetais"},
      {"image": "assets/images/filme.png", "text": "Filmes"},
      {"image": "assets/images/musica.png", "text": "Música"},
      {"image": "assets/images/arte.png", "text": "Arte"},
      {"image": "assets/images/numeros.png", "text": "Números"},
      {"image": "assets/images/cozinha.png", "text": "Cozinha"},
      {"image": "assets/images/doces.png", "text": "Doces"},
    ];

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 237, 228, 222),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 60),
                Expanded(
                  child: GridView.builder(
                    padding:
                        const EdgeInsets.only(top: 40.0, left: 30, right: 30),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                      childAspectRatio: 1.2,
                    ),
                    itemCount: gridItems.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Image.asset(
                                gridItems[index]['image']!,
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              gridItems[index]['text']!,
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 16.0,
            left: 16.0,
            right: 16.0,
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.5,
              child: TextField(
                decoration: InputDecoration(
                  hintStyle:
                      TextStyle(fontSize: 14, color: Colors.grey.shade300),
                  hintText: 'Buscar...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
