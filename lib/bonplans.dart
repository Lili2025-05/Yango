import 'package:flutter/material.dart';
import 'dart:math' as math;

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

class EventsPage extends StatefulWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> with TickerProviderStateMixin {
  late final AnimationController _pulseController;
  late final AnimationController _shakeController;
  late final AnimationController _rotateController;
  late final AnimationController _fadeController;
  late final AnimationController _scaleController;
  late final AnimationController _slideController;
  
  final List<EventItem> _events = [
    EventItem(
      id: 1,
      image: 'assets/event1.jpeg',
      title: 'HIMKA',
      subtitle: 'KELANI\'S',
      date: 'Le 26/12/25',
      location: 'Rdv sur Tikerama',
      animationType: AnimationType.pulse,
    ),
    EventItem(
      id: 2,
      image: 'assets/event2.jpeg',
      title: 'GIMS',
      subtitle: 'Concert',
      date: 'Le 25/12/25',
      location: 'Rdv sur Tikerama',
      animationType: AnimationType.shake,
    ),
    EventItem(
      id: 3,
      image: 'assets/event3.jpg',
      title: 'TUKULA MBALO',
      subtitle: 'Concert',
      date: 'Le 26/12/25',
      location: 'Rdv sur Tikerama',
      animationType: AnimationType.rotate,
    ),
    EventItem(
      id: 4,
      image: 'assets/event4.jpeg',
      title: 'COMEDI DE LA KONNERIE',
      subtitle: 'FLORID MARCASSIN',
      date: 'Le 26/12/25',
      location: 'Rdv sur Tikerama',
      animationType: AnimationType.fade,
    ),
    EventItem(
      id: 5,
      image: 'assets/event5.jpeg',
      title: 'CONCERT',
      subtitle: 'Music Festival',
      date: 'Le 24/05/25',
      location: 'Majestic Ivoire',
      animationType: AnimationType.scale,
    ),
    EventItem(
      id: 6,
      image: 'assets/event6.jpg',
      title: 'DADJU',
      subtitle: 'ARSEENE',
      date: 'Le 26/12/25',
      location: 'Rdv sur Tikerama',
      animationType: AnimationType.slide,
    ),
    EventItem(
      id: 7,
      image: 'assets/event7.jpg',
      title: 'SINNERS',
      subtitle: 'Concert',
      date: 'Le 24/05/25',
      location: 'Majestic Ivoire',
      animationType: AnimationType.pulse,
    ),
    EventItem(
      id: 8,
      image: 'assets/event8.jpeg',
      title: 'SDM',
      subtitle: 'Concert',
      date: 'Le 26/12/25',
      location: 'Rdv sur Tikerama',
      animationType: AnimationType.shake,
    ),
  ];

  @override
  void initState() {
    super.initState();
    
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);
    
    _shakeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);
    
    _rotateController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat();
    
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);
    
    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);
    
    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _shakeController.dispose();
    _rotateController.dispose();
    _fadeController.dispose();
    _scaleController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  AnimationController _getControllerForType(AnimationType type) {
    switch (type) {
      case AnimationType.pulse:
        return _pulseController;
      case AnimationType.shake:
        return _shakeController;
      case AnimationType.rotate:
        return _rotateController;
      case AnimationType.fade:
        return _fadeController;
      case AnimationType.scale:
        return _scaleController;
      case AnimationType.slide:
        return _slideController;
    }
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
        title: Row(
          children: [
            Image.asset(
              'assets/yango_logo_red.png',
              height: 30,
            ),
            const SizedBox(width: 12),
            Text(
              'Alerte bon plan !',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none, color: Colors.white),
              label: const Text(
                'SUBSCRIBE',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            width: double.infinity,
            child: null, // Removed duplicate logo
          ),
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
    final controller = _getControllerForType(event.animationType);
    
    Widget animatedImage;
    switch (event.animationType) {
      case AnimationType.pulse:
        animatedImage = AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Transform.scale(
              scale: 1.0 + 0.05 * math.sin(controller.value * math.pi),
              child: child,
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              event.image,
              fit: BoxFit.cover,
              height: 100,
              width: double.infinity,
            ),
          ),
        );
        break;
        
      case AnimationType.shake:
        animatedImage = AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(3 * math.sin(controller.value * math.pi), 0),
              child: child,
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              event.image,
              fit: BoxFit.cover,
              height: 100,
              width: double.infinity,
            ),
          ),
        );
        break;
        
      case AnimationType.rotate:
        animatedImage = AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Transform.rotate(
              angle: 0.05 * math.sin(controller.value * math.pi),
              child: child,
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              event.image,
              fit: BoxFit.cover,
              height: 100,
              width: double.infinity,
            ),
          ),
        );
        break;
        
      case AnimationType.fade:
        animatedImage = FadeTransition(
          opacity: Tween<double>(begin: 0.7, end: 1.0).animate(controller),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              event.image,
              fit: BoxFit.cover,
              height: 100,
              width: double.infinity,
            ),
          ),
        );
        break;
        
      case AnimationType.scale:
        animatedImage = ScaleTransition(
          scale: Tween<double>(begin: 0.95, end: 1.05).animate(controller),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              event.image,
              fit: BoxFit.cover,
              height: 100,
              width: double.infinity,
            ),
          ),
        );
        break;
        
      case AnimationType.slide:
        animatedImage = SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-0.05, 0),
            end: const Offset(0.05, 0),
          ).animate(controller),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              event.image,
              fit: BoxFit.cover,
              height: 100,
              width: double.infinity,
            ),
          ),
        );
        break;
    }

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: animatedImage),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.date,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  event.location,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

enum AnimationType {
  pulse,
  shake,
  rotate,
  fade,
  scale,
  slide,
}

class EventItem {
  final int id;
  final String image;
  final String title;
  final String subtitle;
  final String date;
  final String location;
  final AnimationType animationType;

  EventItem({
    required this.id,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.date,
    required this.location,
    required this.animationType,
  });
}

// Event Detail Screen
class EventDetailScreen extends StatefulWidget {
  final EventItem event;

  const EventDetailScreen({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  _EventDetailScreenState createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isBookmarked = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
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
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: FadeTransition(
          opacity: _animation,
          child: Text(
            widget.event.title,
            style: TextStyle(color: Colors.black),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              _isBookmarked ? Icons.bookmark : Icons.bookmark_border,
              color: _isBookmarked ? Colors.red : Colors.black,
            ),
            onPressed: () {
              setState(() {
                _isBookmarked = !_isBookmarked;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.share, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeTransition(
              opacity: _animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 0.2),
                  end: Offset.zero,
                ).animate(_animation),
                child: Hero(
                  tag: 'event-${widget.event.id}',
                  child: Image.asset(
                    widget.event.image,
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeTransition(
                    opacity: _animation,
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0, 0.3),
                        end: Offset.zero,
                      ).animate(_animation),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.event.title,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(
                              widget.event.date,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  FadeTransition(
                    opacity: _animation,
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0, 0.4),
                        end: Offset.zero,
                      ).animate(_animation),
                      child: Text(
                        widget.event.subtitle,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  FadeTransition(
                    opacity: _animation,
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0, 0.5),
                        end: Offset.zero,
                      ).animate(_animation),
                      child: Row(
                        children: [
                          Icon(Icons.location_on, color: Colors.red),
                          const SizedBox(width: 8),
                          Text(
                            widget.event.location,
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  FadeTransition(
                    opacity: _animation,
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0, 0.6),
                        end: Offset.zero,
                      ).animate(_animation),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          minimumSize: Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: Text(
                          'Réserver des tickets',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}