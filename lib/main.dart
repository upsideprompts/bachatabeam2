import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bachata Music Venues',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const BachataVenuesPage(),
    );
  }
}

class Venue {
  final String name;
  final String location;
  final String description;
  final bool isTexas;

  Venue(this.name, this.location, this.description, {this.isTexas = true});
}

class BachataVenuesPage extends StatelessWidget {
  const BachataVenuesPage({super.key});

  static const List<Venue> venues = [
    // Texas Venues
    Venue("Club Tropicana", "Houston, TX", "Popular spot known for vibrant bachata scenes with live DJs playing weekends."),
    Venue("Metropolis", "Houston, TX", "Multi-level venue with dedicated bachata nights and themed dance events."),
    Venue("El Big Bad", "Houston, TX", "Latin entertainment complex featuring nightly bachata music and dance competitions."),
    Venue("Soleil Dallas", "Dallas, TX", "New venue with wood floors and two stages, playing salsa and bachata early in the night."),
    Venue("Inside Avalon", "Dallas, TX", "Latin music venue featuring hiphop, reggeton, merengue, salsa, and bachata."),
    Venue("Café Pacifico", "Austin, TX", "Cozy restaurant and bar with regular bachata nights and Latin poetry events."),
    Venue("La Fogata", "San Antonio, TX", "Authentic Mexican restaurant with weekend bachata DJ sets and dance floor."),
    Venue("Club 313", "Detroit, MI (seasonal Texas events)", "Hosts special bachata nights during Texas festivals and conferences."),
    Venue("The Alley Bar", "Fort Worth, TX", "Underground bar with intimate bachata acoustic sets on Wednesdays."),
    Venue("Rio Nightclub", "Plano, TX", "Latin-focused nightclub with themed bachata weekends and VIP sections."),
    // Michigan Venues
    Venue("The Annex", "Detroit, MI", "Upscale venue hosting dedicated bachata nights with professional DJs.", isTexas: false),
    Venue("Club Bleu", "Detroit, MI", "Known for high-energy bachata and Latin nights with dance workshops.", isTexas: false),
    Venue("Club 313", "Detroit, MI", "Popular spot for bachata dance competitions and social dancing.", isTexas: false),
    Venue("The Norwood", "Detroit, MI", "Sleek underground lounge with exclusive bachata nights and craft cocktails.", isTexas: false),
    Venue("The Eastern", "Detroit, MI", "The Norwood's sister venue, hosting the hottest bachata night in Michigan.", isTexas: false),
    Venue("Bachata Nights at The Norwood", "Detroit, MI", "Weekly upscale Latin night experience with DJ Tony Toca and themed events.", isTexas: false),
    Venue("Bachata Nights at The Eastern", "Detroit, MI", "Newer venue offering fresh bachata experiences with open-concept design.", isTexas: false),
    Venue("Detroit Bachata Oasis", "Livonia, MI", "Community-focused venue specializing in bachata sensual and traditional workshops.", isTexas: false),
    Venue("Latin Vibes Lounge", "Warren, MI", "Suburban favorite with regular bachata classes and social dance nights.", isTexas: false),
    Venue("Casa de Musica", "Sterling Heights, MI", "Family-owned venue with live bands playing bachata and other Latin genres.", isTexas: false),
  ];

  @override
  Widget build(BuildContext context) {
    final texasVenues = venues.where((v) => v.isTexas).toList();
    final michiganVenues = venues.where((v) => !v.isTexas).toList();
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('🎸 Bachata Music Venues'),
        subtitle: const Text('Texas & Michigan'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF667eea),
              Color(0xFF764ba2),
              Color(0xFF667eea),
            ],
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            const Card(
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  'Top 20 clubs and venues for bachata music in Texas & Michigan',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              '🇹🇽 Texas',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 10),
            ...texasVenues.map((v) => VenueCard(venue: v)).toList(),
            const SizedBox(height: 20),
            const Text(
              '🏫 Michigan',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 10),
            ...michiganVenues.map((v) => VenueCard(venue: v)).toList(),
            const SizedBox(height: 20),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      '🎧 Bachata Mixtapes',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Best of Bachata 2025',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Icon(Icons.youtube_browser, size: 50),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text('Classic Bachata Vibes', style: TextStyle(fontWeight: FontWeight.bold)),
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Icon(Icons.youtube_browser, size: 50),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text('Bachata Sensual Mix', style: TextStyle(fontWeight: FontWeight.bold)),
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Icon(Icons.youtube_browser, size: 50),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text('Romantic Bachata Collection', style: TextStyle(fontWeight: FontWeight.bold)),
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Icon(Icons.youtube_browser, size: 50),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              '🎸 Find your rhythm in the heart of bachata music • Texas & Michigan',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}

class VenueCard extends StatelessWidget {
  final Venue venue;

  const VenueCard({super.key, required this.venue});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              venue.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              venue.location,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 4),
            Text(
              venue.description,
              style: const TextStyle(height: 1.4),
            ),
          ],
        ),
      ),
    );
  }
}