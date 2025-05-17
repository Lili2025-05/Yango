import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  final List<String> serviceTitles = [
    'Course',
    'Location',
    'Repas',
    'Bon plans',
  ];

  final List<String> serviceAssets = [
    'assets/course_image.avif',
    'assets/location_image.avif',
    'assets/repas_image.avif',
    'assets/bonplans_image.jpeg',
  ];

  final List<String> verticalImages = [
    'assets/news_item_1.jpeg',
    'assets/news_item_2.png',
    'assets/bruch.jpg',
    'assets/restaurant.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            // Top Row: Logo + Icones
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage('assets/yango_logo_red.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Image.asset('assets/yango_pay_icon.jpg', height: 40),
                Spacer(),
                Icon(Icons.menu),
              ],
            ),
            SizedBox(height: 4),
            Text('> Bingerville', style: TextStyle(fontSize: 12)),
            SizedBox(height: 12),

            // Search Bar
            Container(
              decoration: BoxDecoration(
                color: Colors.red.shade100,
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Icon(Icons.search),
                  SizedBox(width: 10),
                  Expanded(child: Text('Où allons-nous ?')),
                  Icon(Icons.mic),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: StadiumBorder(),
                    ),
                    child: Text('Search'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Services Grid
            GridView.builder(
              shrinkWrap: true,
              itemCount: serviceTitles.length,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (context, index) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 100,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Image.asset(serviceAssets[index], height: 50),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      serviceTitles[index],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: 20),

            // Section Populaire
            Text(
              'POPULAIRE',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: 4),
                  ...[
                    'assets/news_item_1.jpeg',
                    'assets/news_item_2.png',
                    'assets/bruch.jpg',
                    'assets/restaurant.jpg',
                  ].map(
                    (img) => Container(
                      margin: EdgeInsets.only(right: 12),
                      width: 200,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: AssetImage(img),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 6,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Images verticales
            ...verticalImages.map(
              (img) => Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(img),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 4),
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
}
