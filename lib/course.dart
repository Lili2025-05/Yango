import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({Key? key}) : super(key: key);

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  final LatLng ivoryCoastCenter = const LatLng(7.54, -5.55);
  final TextEditingController _searchController = TextEditingController();
  String _selectedVehicle = 'Chap Chap';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Carte
            Expanded(
              flex: 3,
              child: Stack(
                children: [
                  FlutterMap(
                    options: MapOptions(
                      initialCenter: ivoryCoastCenter,
                      initialZoom: 7.0,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                        subdomains: const ['a', 'b', 'c'],
                      ),
                    ],
                  ),
                  Positioned(
                    left: 10,
                    top: 10,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.red,
                        size: 30,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                ],
              ),
            ),

            // Contenu inférieur
            Expanded(
              flex: 4,
              child: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Titre
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'PLANIFIEZ VOTRE COURSE',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    // Onglets Course / Livraison
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.red),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(8.0),
                                  bottomLeft: Radius.circular(8.0),
                                ),
                                color: Colors.white,
                              ),
                              child: const Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 12.0),
                                  child: Text(
                                    'Course',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(8.0),
                                  bottomRight: Radius.circular(8.0),
                                ),
                              ),
                              child: const Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 12.0),
                                  child: Text(
                                    'Livraison',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Zone de saisie destination
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: Colors.red),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 12),
                            const Icon(Icons.search, color: Colors.grey),
                            Expanded(
                              child: TextField(
                                controller: _searchController,
                                decoration: const InputDecoration(
                                  hintText: 'Destination...',
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Options de véhicules
                    SizedBox(
                      height: 120,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildVehicleOption(
                            name: 'Chap Chap',
                            price: '2000F',
                            imagePath: 'assets/taxi_economique.jpeg',
                            isSelected: _selectedVehicle == 'Chap Chap',
                          ),
                          _buildVehicleOption(
                            name: 'Confort',
                            price: '3000F',
                            imagePath: 'assets/taxi_confort.webp',
                            isSelected: _selectedVehicle == 'Confort',
                          ),
                          _buildVehicleOption(
                            name: 'Class',
                            price: '4000F',
                            imagePath: 'assets/taxi_premium.jpg',
                            isSelected: _selectedVehicle == 'Class',
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Bouton commander
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Prêt à partir ?',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Choisissez votre style',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Action de commande
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24.0,
                                vertical: 12.0,
                              ),
                            ),
                            child: const Text(
                              'Commander',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVehicleOption({
    required String name,
    required String price,
    required String imagePath,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedVehicle = name;
        });
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: isSelected ? Border.all(color: Colors.red, width: 2) : null,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Image.asset(
              imagePath,
              height: 70,
              width: 100,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            name,
            style: TextStyle(
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            price,
            style: TextStyle(
              color: isSelected ? Colors.red : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
