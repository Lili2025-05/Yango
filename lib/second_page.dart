import 'package:flutter/material.dart';

import 'bonplans.dart';
import 'course.dart';
import 'location.dart';
import 'repas.dart';
// Import de la page Yangopay (à adapter selon ton fichier)
import 'yangopay.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.red,
        fontFamily: 'Roboto',
      ),
      home: const VangoHomePage(),
    );
  }
}

class VangoHomePage extends StatelessWidget {
  const VangoHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTopBar(context),  // <-- passé context ici
              _buildSearchBar(),
              _buildServiceCategories(context),
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                child: Text(
                  'POPULAIRE',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              _buildPopularSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/yango_logo_red.png',
                height: 40,
              ),
              const Text(
                '>Bingerville',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),

          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) =>  ProfileScreen()),
                  );
                },
                child: Image.asset(
                  'assets/yango_pay_icon.jpg', // <-- Logo Yangopay cliquable
                  height: 38,
                  width: 38,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(width: 12),
              const Icon(Icons.menu, size: 28),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.red[700]!, width: 1.5),
        ),
        child: Row(
          children: [
            const SizedBox(width: 15),
            const Icon(Icons.search, color: Colors.grey),
            const SizedBox(width: 10),
            const Expanded(
              child: Text(
                'Où allons-nous ?',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.red[700],
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: const Text(
                'Search',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceCategories(BuildContext context) {
    final List<Map<String, String>> services = [
      {'title': 'Course', 'image': 'assets/course_image.png'},
      {'title': 'Location', 'image': 'assets/location_image.png'},
      {'title': 'Repas', 'image': 'assets/repas_image.png'},
      {'title': 'Bon plans', 'image': 'assets/bonplans_image.jpeg'},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 1,
        children: services.map((item) {
          return _buildServiceItem(context, item['title']!, item['image']!);
        }).toList(),
      ),
    );
  }

  Widget _buildServiceItem(BuildContext context, String title, String image) {
    return GestureDetector(
      onTap: () {
        switch (title) {
          case 'Course':
            Navigator.push(context, MaterialPageRoute(builder: (_) => const CoursePage()));
            break;
          case 'Location':
            Navigator.push(context, MaterialPageRoute(builder: (_) => const LocationPage()));
            break;
          case 'Repas':
            Navigator.push(context, MaterialPageRoute(builder: (_) => const RepasPage()));
            break;
          case 'Bon plans':
            Navigator.push(context, MaterialPageRoute(builder: (_) => const EventsPage()));
            break;
        }
      },
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[200],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildPopularSection() {
    final List<Map<String, dynamic>> popularItems = [
      {
        'title': 'LUNCH MASTER',
        'image': 'assets/news_item_1.jpeg',
        'color': Colors.red[900],
      },
      {
        'title': 'FALLY IPUPA CONCERT',
        'image': 'assets/news_item_2.png',
        'color': Colors.amber[700],
      },
      {
        'title': 'CONCERT EVENT',
        'image': 'assets/news_item_3.jpeg',
        'color': Colors.blue[700],
      },
      {
        'title': 'PROMO SPÉCIALE',
        'image': 'assets/brunch.jpg',
        'color': Colors.green[700],
      },
    ];

    return SizedBox(
      height: 250,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        scrollDirection: Axis.horizontal,
        itemCount: popularItems.length,
        itemBuilder: (context, index) {
          return Container(
            width: 160,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: popularItems[index]['color'] ?? Colors.red[900],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    popularItems[index]['image'],
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                      color: Colors.black.withOpacity(0.5),
                    ),
                    child: Text(
                      popularItems[index]['title'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
