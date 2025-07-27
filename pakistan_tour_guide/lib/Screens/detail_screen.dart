import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String placeName;
  const DetailScreen({
    super.key,
    required this.placeName,
    required String placeDescription,
    required String placeImage,
  });

  @override
  Widget build(BuildContext context) {
    final placeData = placesInfo[placeName];

    if (placeData == null) {
      return Scaffold(
        appBar: AppBar(title: Text(placeName)),
        body: const Center(child: Text("Details not available")),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(placeName),
        backgroundColor: const Color(0xff3280ef),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Main Image
            Image.asset(
              placeData['image']!,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Description
                  Text(
                    placeData['description']!,
                    style: const TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                  const SizedBox(height: 20),

                  // Visiting Spots
                  const Text(
                    "Famous Spots to Visit",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  ...placeData['spots']!.map<Widget>((spot) {
                    return sectionCard(
                      spot['name']!,
                      spot['image']!,
                      spot['desc']!,
                    );
                  }).toList(),

                  const SizedBox(height: 20),

                  // Hotels
                  const Text(
                    "Hotels & Stay Options",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  ...placeData['hotels']!.map<Widget>((hotel) {
                    return hotelCard(
                      hotel['name']!,
                      hotel['price']!,
                      hotel['desc']!,
                    );
                  }).toList(),

                  const SizedBox(height: 20),

                  // Transport Options
                  const Text(
                    "Transport Options",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  ...placeData['transport']!.map<Widget>((t) {
                    return infoCard(Icons.directions_car, t);
                  }).toList(),

                  const SizedBox(height: 20),

                  // Activities
                  const Text(
                    "Activities",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  ...placeData['activities']!.map<Widget>((a) {
                    return infoCard(Icons.hiking, a);
                  }).toList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------- Widgets ----------
  Widget sectionCard(String title, String image, String desc) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(12),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: Image.asset(
                image,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            ListTile(
              title: Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(desc),
            ),
          ],
        ),
      ),
    );
  }

  Widget hotelCard(String name, String price, String desc) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 4),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text("Price: $price", style: const TextStyle(color: Colors.green)),
          const SizedBox(height: 4),
          Text(desc, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget infoCard(IconData icon, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 4),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xff3280ef)),
          const SizedBox(width: 10),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}

// ---------- PLACE INFO DATABASE ----------

final Map<String, dynamic> placesInfo = {
  "Hunza Valley": {
    "image": "images/hunza.jpg",
    "description":
        "Hunza Valley is a breathtaking region in Gilgit Baltistan, famous for Attabad Lake, Karimabad Fort, and Passu Cones.",
    "spots": [
      {
        "name": "Attabad Lake",
        "image": "images/attabad.jpg",
        "desc": "Turquoise blue lake formed after a landslide in 2010.",
      },
      {
        "name": "Karimabad Fort",
        "image": "images/karimabad.jpg",
        "desc": "Historic fort with panoramic mountain views.",
      },
      {
        "name": "Passu Cones",
        "image": "images/passu.jpg",
        "desc": "Unique cone-shaped peaks of Hunza.",
      },
    ],
    "hotels": [
      {
        "name": "Hunza Serena Inn",
        "price": "PKR 12,000/night",
        "desc": "Luxury stay with mountain views.",
      },
      {
        "name": "Baltit Heritage Inn",
        "price": "PKR 6,000/night",
        "desc": "Traditional styled cozy hotel.",
      },
    ],
    "transport": [
      "Private car from Gilgit (2 hours)",
      "Local shared vans available",
    ],
    "activities": [
      "Boating at Attabad Lake",
      "Trekking to Ultar Glacier",
      "Shopping in Karimabad Bazaar",
    ],
  },

  "Skardu": {
    "image": "images/skardu.jpg",
    "description":
        "Skardu is home to stunning lakes, Deosai Plains, and famous Shangrila Resort.",
    "spots": [
      {
        "name": "Deosai Plains",
        "image": "images/deosai.jpg",
        "desc": "Known as the land of giants with endless grasslands.",
      },
      {
        "name": "Shangrila Lake",
        "image": "images/shangrila.jpg",
        "desc": "Famous for the Shangrila Resort and heart-shaped lake.",
      },
      {
        "name": "Upper Kachura Lake",
        "image": "images/kachura.jpg",
        "desc": "A beautiful lake with clear water and serenity.",
      },
    ],
    "hotels": [
      {
        "name": "Serena Shigar Fort",
        "price": "PKR 18,000/night",
        "desc": "Luxury heritage hotel in a historic fort.",
      },
      {
        "name": "Shangrila Resort",
        "price": "PKR 15,000/night",
        "desc": "Famous resort near Shangrila Lake.",
      },
    ],
    "transport": ["Flight from Islamabad to Skardu", "Private Jeep for Deosai"],
    "activities": [
      "Camping at Deosai",
      "Boating at Upper Kachura",
      "Photography at Manthoka Waterfall",
    ],
  },

  "Swat Valley": {
    "image": "images/swat.jpg",
    "description":
        "Swat Valley is called the Switzerland of Pakistan, with lush green valleys and waterfalls.",
    "spots": [
      {
        "name": "Malam Jabba",
        "image": "images/malamjabba.jpg",
        "desc": "Ski resort and adventure park.",
      },
      {
        "name": "Kalam Valley",
        "image": "images/kalam.jpg",
        "desc": "Beautiful valley with Ushu Forest.",
      },
      {
        "name": "Mingora",
        "image": "images/mingora.jpg",
        "desc": "Main city and shopping hub of Swat.",
      },
    ],
    "hotels": [
      {
        "name": "Pearl Continental Malam Jabba",
        "price": "PKR 20,000/night",
        "desc": "Luxury hotel with skiing facilities.",
      },
      {
        "name": "Hotel Swat Regency",
        "price": "PKR 7,500/night",
        "desc": "Affordable hotel in Mingora.",
      },
    ],
    "transport": [
      "Private car from Islamabad (4-5 hours)",
      "Public vans to Mingora",
    ],
    "activities": [
      "Skiing at Malam Jabba",
      "Trekking in Kalam",
      "Exploring Ushu Forest",
    ],
  },

  "Naran Kaghan": {
    "image": "images/naran.jpg",
    "description":
        "Naran Kaghan Valley is known for Saif-ul-Malook Lake, lush greenery, and fresh air.",
    "spots": [
      {
        "name": "Saif-ul-Malook Lake",
        "image": "images/saif.jpg",
        "desc": "Magical lake surrounded by snow-capped mountains.",
      },
      {
        "name": "Lulusar Lake",
        "image": "images/lulusar.jpg",
        "desc": "Another stunning alpine lake.",
      },
      {
        "name": "Babusar Top",
        "image": "images/babusar.jpg",
        "desc": "High mountain pass connecting Naran and Chilas.",
      },
    ],
    "hotels": [
      {
        "name": "Hotel Demanchi Naran",
        "price": "PKR 8,000/night",
        "desc": "Comfortable stay in Naran town.",
      },
      {
        "name": "Arcadian Sprucewoods",
        "price": "PKR 12,500/night",
        "desc": "Luxury wooden cottages near Kaghan.",
      },
    ],
    "transport": ["Private car from Abbottabad", "Jeeps for Saif-ul-Malook"],
    "activities": [
      "Boating at Saif-ul-Malook",
      "Photography at Babusar Top",
      "Hiking around Lulusar Lake",
    ],
  },

  "Kumrat Valley": {
    "image": "images/kumrat.jpg",
    "description":
        "Kumrat Valley is a peaceful destination with pine forests and rivers.",
    "spots": [
      {
        "name": "Jahaz Banda",
        "image": "images/jahazbanda.jpg",
        "desc": "Green meadows surrounded by mountains.",
      },
      {
        "name": "Katora Lake",
        "image": "images/katora.jpg",
        "desc": "Beautiful hidden alpine lake.",
      },
      {
        "name": "Panjkora River",
        "image": "images/panjkora.jpg",
        "desc": "Crystal clear river running through Kumrat.",
      },
    ],
    "hotels": [
      {
        "name": "Kumrat Continental Hotel",
        "price": "PKR 5,000/night",
        "desc": "Simple stay with basic facilities.",
      },
      {
        "name": "Camping Pods Kumrat",
        "price": "PKR 3,500/night",
        "desc": "Nature-friendly wooden camping pods.",
      },
    ],
    "transport": ["Jeep ride from Dir", "Local guides available"],
    "activities": [
      "Camping in Jahaz Banda",
      "River Rafting in Panjkora",
      "Trekking to Katora Lake",
    ],
  },

  "Fairy Meadows": {
    "image": "images/fairymeadows.jpg",
    "description":
        "Fairy Meadows is the base camp for Nanga Parbat, offering breathtaking views.",
    "spots": [
      {
        "name": "Nanga Parbat Viewpoint",
        "image": "images/nangaparbat.jpg",
        "desc": "Mesmerizing view of the Killer Mountain.",
      },
      {
        "name": "Beyal Camp",
        "image": "images/beyal.jpg",
        "desc": "Another camping site near Fairy Meadows.",
      },
      {
        "name": "Reflection Lake",
        "image": "images/reflectionlake.jpg",
        "desc": "Small lake reflecting Nanga Parbat.",
      },
    ],
    "hotels": [
      {
        "name": "Raikot Serai Hotel",
        "price": "PKR 7,500/night",
        "desc": "Basic rooms with amazing mountain views.",
      },
      {
        "name": "Camping Huts Fairy Meadows",
        "price": "PKR 4,500/night",
        "desc": "Wooden huts for overnight stay.",
      },
    ],
    "transport": ["Jeep from Raikot Bridge", "2-hour trek to Fairy Meadows"],
    "activities": [
      "Camping under the stars",
      "Photography at Nanga Parbat",
      "Trekking to Beyal Camp",
    ],
  },
};
