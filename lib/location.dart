import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'YANGO Car Rental',
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: 'Roboto',
      ),
      home: const LocationPage(),
    );
  }
}

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  final TextEditingController _searchController = TextEditingController();
  int _selectedCarIndex = -1;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: Image.asset(
          'assets/yango_logo_red.png',
          height: 40,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.directions_car, color: Colors.red),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.person, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.grey[200],
            child: Column(
              children: [
                Row(
                  children: [
                    _buildTabButton('Véhicules', true),
                    _buildTabButton('Utilitaires', false),
                    _buildTabButton('Abonnement', false),
                  ],
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Adresse',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                _buildStaticButton('Selectionnez le lieu de retrait'),
                const SizedBox(height: 12),
                _buildStaticButton('Choisissez un moyen de paiement'),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "C'est parti !",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 0.9,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: [
                  _buildCarWidget(0, 'assets/car1.jpg', 'Model S'),
                  _buildCarWidget(1, 'assets/car2.jpg', 'Model 3'),
                  _buildCarWidget(2, 'assets/car3.jpg', 'Model X'),
                  _buildCarWidget(3, 'assets/car4.webp', 'Model Y'),
                  _buildCarWidget(4, 'assets/car5.webp', 'Model X'),
                  _buildCarWidget(5, 'assets/car6.jpg', 'Model Y'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(String title, bool isSelected) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (title == 'Véhicules') const Icon(Icons.directions_car, size: 18),
            if (title == 'Utilitaires') const Icon(Icons.local_shipping, size: 18),
            if (title == 'Abonnement') const Icon(Icons.card_membership, size: 18),
            const SizedBox(width: 4),
            Text(
              title,
              style: TextStyle(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStaticButton(String title) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildCarWidget(int index, String image, String model) {
    bool isSelected = _selectedCarIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCarIndex = index;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Colors.red : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(image, height: 80),
            ),
            Container(
              padding: const EdgeInsets.all(12),
              width: double.infinity,
              color: Colors.black,
              child: const Center(
                child: Text(
                  'KPANDJI',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
