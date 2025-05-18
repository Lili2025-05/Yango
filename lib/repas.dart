import 'package:flutter/material.dart';



class RepasPage  extends StatelessWidget {
  const RepasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      onPressed: () {},
                    ),
                    const Expanded(
                      child: Text(
                        'QUE VOULEZ VOUS ?',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0x8B000000),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(width: 40), // Pour équilibrer le header
                  ],
                ),
              ),
              
              // Categories en haut (icônes circulaires)
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
              
              // Premier plat principal (dessert)
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
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
              
              // Burger King
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Image.asset(
                    'assets/burger.jpeg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 150,
                  ),
                ),
              ),
              
              const SizedBox(height: 16),
              
              // Texte "RÉSERVEZ MAINTENANT!"
              const Text(
                'RESERVEZ-MAINTENANT !',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0x8B000000),
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 16),
              
              // Images restaurant avec flèche à droite
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 16.0, right: 8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Image.asset(
                          'assets/restaurant1.jpg',
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Image.asset(
                          'assets/restaurant2.jpg',
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_forward),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 16),
              
              // Bouton "Saisir plus d'informations"
              _buildActionButton(
                text: 'Saisir plus d\'informations',
                icon: Icons.add,
              ),
              
              const SizedBox(height: 12),
              
              // Bouton "Ajouter un moyen de paiement"
              _buildActionButton(
                text: 'Ajouter un moyen de paiement',
                icon: Icons.add,
              ),
              
              const SizedBox(height: 12),
              
              // Bouton "PASSEZ VOTRE COMMANDE!"
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
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
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