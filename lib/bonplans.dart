import 'package:flutter/material.dart';

import 'second_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'YANGO Events',
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: 'Roboto',
      ),
      home: const EventsPage(),
    );
  }
}

class EventsPage extends StatelessWidget {
  const EventsPage({Key? key}) : super(key: key);

  final List<EventItem> _events = const [
    EventItem(id: 1, image: 'assets/event1.jpeg', title: 'HIMKA', subtitle: 'KELANI\'S', date: 'Le 26/12/25', location: 'Rdv sur Tikerama'),
    EventItem(id: 2, image: 'assets/event2.jpeg', title: 'GIMS', subtitle: 'Concert', date: 'Le 25/12/25', location: 'Rdv sur Tikerama'),
    EventItem(id: 3, image: 'assets/event3.jpg', title: 'TUKULA MBALO', subtitle: 'Concert', date: 'Le 26/12/25', location: 'Rdv sur Tikerama'),
    EventItem(id: 4, image: 'assets/event4.jpeg', title: 'COMEDI DE LA KONNERIE', subtitle: 'FLORID MARCASSIN', date: 'Le 26/12/25', location: 'Rdv sur Tikerama'),
    EventItem(id: 5, image: 'assets/event5.jpeg', title: 'CONCERT', subtitle: 'Music Festival', date: 'Le 24/05/25', location: 'Majestic Ivoire'),
    EventItem(id: 6, image: 'assets/event6.jpg', title: 'DADJU', subtitle: 'ARSEENE', date: 'Le 26/12/25', location: 'Rdv sur Tikerama'),
    EventItem(id: 7, image: 'assets/event7.jpg', title: 'SINNERS', subtitle: 'Concert', date: 'Le 24/05/25', location: 'Majestic Ivoire'),
    EventItem(id: 8, image: 'assets/event8.jpeg', title: 'SDM', subtitle: 'Concert', date: 'Le 26/12/25', location: 'Rdv sur Tikerama'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const SecondPage()),
                    (route) => false,
                  );
                },
              ),

        title: Row(
          children: [
            Image.asset('assets/yango_logo_red.png', height: 30),
            const SizedBox(width: 12),
            
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none, color: Colors.white),
              label: const Text('SUBSCRIBE', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8),
              color: Colors.grey[200],
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.85,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: _events.length,
                itemBuilder: (context, index) {
                  final event = _events[index];
                  return _buildEventCard(event);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventCard(EventItem event) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                event.image,
                fit: BoxFit.cover,
                height: 100,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.date,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const SizedBox(height: 2),
                Text(
                  event.location,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class EventItem {
  final int id;
  final String image;
  final String title;
  final String subtitle;
  final String date;
  final String location;

  const EventItem({
    required this.id,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.date,
    required this.location,
  });
}
