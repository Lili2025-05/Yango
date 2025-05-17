import 'package:flutter/material.dart';

class repas extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const repas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'QUE VOULEZ VOUS ?',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          Icon(Icons.star_border, color: Colors.black),
          SizedBox(width: 8),
          Icon(Icons.favorite_border, color: Colors.black),
          SizedBox(width: 8),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildFoodCategoryCircle('assets/category_pizza.png'),
                  _buildFoodCategoryCircle('assets/category_burger.png'),
                  _buildFoodCategoryCircle('assets/category_sushi.png'),
                  _buildFoodCategoryCircle('assets/category_dessert.png'),
                  _buildFoodCategoryCircle('assets/category_drinks.png'),
                ],
              ), // Category Circles
              const SizedBox(height: 24),
              Image.asset(
                'assets/dessert_image.png', // Replace with your dessert image asset
                width: double.infinity, // Dessert Image
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/burger_king_burger_1.png', // Replace with your Burger King image asset
                    width: 120,
                    fit: BoxFit.contain,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Image.asset(
                      'assets/burger_king_logo.png', // Replace with your Burger King logo asset
                      height: 40,
                      fit: BoxFit.contain,
                    ),
                  ), // Burger King Logo
                  Image.asset(
                    'assets/burger_king_burger_2.png', // Replace with your Burger King image asset
                    width: 120,
                    fit: BoxFit.contain,
                  ), // Burger King Burger 2
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                'RESERVEZ-MAINTENANT !',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildReservationOption('assets/reservation_image_1.png'),
                  _buildReservationOption('assets/reservation_image_2.png'),
                  Icon(Icons.arrow_forward_ios, color: Colors.black),
                ], // Reservation Options
              ),
              const SizedBox(height: 24),
              _buildRedButton(
                context,
                'Saisir plus d\'informations',
                // ignore: deprecated_member_use
                Icons.add,
              ),
              const SizedBox(height: 16),
              _buildRedButton(
                context,
                'Ajouter un moyen de paiement',
                Icons.add,
              ), // Add payment method button

              const SizedBox(height: 24),
              _buildRedButton(context, 'PASSEZ VOTRE COMMANDE !'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFoodCategoryCircle(String imageAsset) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: Colors.grey[200],
      backgroundImage: AssetImage(imageAsset),
    );
  }

  Widget _buildReservationOption(String imageAsset) {
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(imageAsset, fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildRedButton(BuildContext context, String text, [IconData? icon]) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: () {
          // Handle button press
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) Icon(icon, color: Colors.white),
            if (icon != null) const SizedBox(width: 8),
            Text(
              text,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
