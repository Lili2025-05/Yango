import 'package:flutter/material.dart';

class RepasPage extends StatefulWidget {
  const RepasPage({Key? key}) : super(key: key);

  @override
  State<RepasPage> createState() => _RepasPageState();
}

class _RepasPageState extends State<RepasPage> {
  int _currentIndex = 0;

  final List<String> _restaurantImages = [
    'assets/restaurant1.jpg',
    'assets/restaurant2.jpg',
    'assets/restaurant3.jpg',
    'assets/restaurant4.jpg',
  ];

  void _goToPrevious() {
    setState(() {
      _currentIndex = (_currentIndex - 2).clamp(0, _restaurantImages.length - 1);
    });
  }

  void _goToNext() {
    setState(() {
      if (_currentIndex + 2 < _restaurantImages.length) {
        _currentIndex += 2;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final imagesToShow = _restaurantImages.skip(_currentIndex).take(2).toList();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header avec flèche retour et titre
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const Expanded(
                      child: Text(
                        'QUE VOULEZ VOUS ?',
                        style: TextStyle(
                          fontFamily: 'ProtestGuerrilla',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF480000),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(width: 40),
                  ],
                ),
              ),

              // Catégories circulaires
              SizedBox(
                height: 80,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  children: [
                    _buildCategoryCircle('assets/cat1.jpeg'),
                    _buildCategoryCircle('assets/cat2.jpg'),
                    _buildCategoryCircle('assets/cat3.jpg'),
                    _buildCategoryCircle('assets/cat4.jpg'),
                    _buildCategoryCircle('assets/cat5.jpeg'),
                    _buildCategoryCircle('assets/cat6.jpeg'),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Dessert
              ClipRRect(
                borderRadius: BorderRadius.circular(33.0),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Image.asset(
                    'assets/dessert.jpeg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 200,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Burger
              ClipRRect(
                borderRadius: BorderRadius.circular(33.0),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Image.asset(
                    'assets/burger.jpeg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 200,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              const Text(
                'RESERVEZ-MAINTENANT !',
                style: TextStyle(
                  fontFamily: 'ProtestGuerrilla',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF480000),
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 16),

              // Nouveau Row avec navigation gauche/droite
              Row(
                children: [
                  if (_currentIndex > 0)
                    Container(
                      margin: const EdgeInsets.only(left: 16.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: _goToPrevious,
                      ),
                    ),

                  for (var imagePath in imagesToShow)
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Image.asset(
                            imagePath,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),

                  if (_currentIndex + 2 < _restaurantImages.length)
                    Container(
                      margin: const EdgeInsets.only(right: 16.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_forward),
                        onPressed: _goToNext,
                      ),
                    ),
                ],
              ),

              const SizedBox(height: 16),

              _buildActionButton(
                text: 'Saisir plus d\'informations',
                icon: Icons.add,
              ),

              const SizedBox(height: 12),

              _buildActionButton(
                text: 'Ajouter un moyen de paiement',
                icon: Icons.add,
              ),

              const SizedBox(height: 12),

              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: const Text(
                    'PASSEZ VOTRE COMMANDE !',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCircle(String imagePath) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6.0),
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildActionButton({required String text, required IconData icon}) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(icon, color: Colors.white),
        label: Text(
          text,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          alignment: Alignment.centerLeft,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
    );
  }
}
