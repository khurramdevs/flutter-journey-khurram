import 'package:flutter/material.dart';
import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 234, 236, 236),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Travel",
                    style: TextStyle(
                      color: Color(0xff3280ef),
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Pakistan",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                "Top Destinations",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 23.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),

              SizedBox(
                height: 285,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    placeCard(
                      context,
                      "images/hunza.jpg",
                      "Hunza Valley",
                      "Paradise on Earth with stunning mountains & culture",
                    ),
                    const SizedBox(width: 10),
                    placeCard(
                      context,
                      "images/skardu.jpg",
                      "Skardu",
                      "Land of lakes, mountains and mesmerizing views",
                    ),
                    const SizedBox(width: 10),
                    placeCard(
                      context,
                      "images/swat.jpg",
                      "Swat Valley",
                      "Switzerland of Pakistan, lush green meadows",
                    ),
                    const SizedBox(width: 10),
                    placeCard(
                      context,
                      "images/naran.jpg",
                      "Naran Kaghan",
                      "Serene lakes and breathtaking mountain views",
                    ),
                    const SizedBox(width: 10),
                    placeCard(
                      context,
                      "images/kumrat.jpg",
                      "Kumrat Valley",
                      "Pine forests, rivers and peaceful nature escape",
                    ),
                    const SizedBox(width: 10),
                    placeCard(
                      context,
                      "images/fairymeadows.jpg",
                      "Fairy Meadows",
                      "Base camp of Nanga Parbat with scenic beauty",
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Explore by Category",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 23.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    exploreCircle("images/mountains.jpg", "Mountains"),
                    const SizedBox(width: 15),
                    exploreCircle("images/beach.jpg", "Beaches"),
                    const SizedBox(width: 15),
                    exploreCircle("images/forest.jpg", "Forests"),
                    const SizedBox(width: 15),
                    exploreCircle("images/historical.jpg", "Historical"),
                    const SizedBox(width: 15),
                    exploreCircle("images/saif.jpg", "Jheel Saiful Maluk"),
                    const SizedBox(width: 15),
                    exploreCircle("images/babusar.jpg", "Babusar Top"),
                    const SizedBox(width: 15),
                    exploreCircle("images/fairymeadows.jpg", "Fairy Meadows"),
                    const SizedBox(width: 15),
                    exploreCircle("images/beach.jpg", "Beaches"),
                    const SizedBox(width: 15),
                    exploreCircle("images/kumrat.jpg", "Kumrat Valley"),
                    const SizedBox(width: 15),
                    exploreCircle("images/hunza.jpg", "Hunza Valley"),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Trending Now",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 23.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              trendingCard("images/attabad.jpg", "Attabad Lake - Hunza"),
              trendingCard("images/deosai.jpg", "Deosai Plains - Skardu"),
              trendingCard("images/kalash.jpg", "Kalash Valley - Chitral"),

              const SizedBox(height: 20),

              const Text(
                "Upcoming Festivals",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 23.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              eventCard("Shandur Polo Festival", "Shandur Pass • 20-25 July"),
              eventCard("Lok Mela Cultural Fair", "Islamabad • 10-15 August"),
            ],
          ),
        ),
      ),
    );
  }

  Widget placeCard(
    BuildContext context,
    String image,
    String title,
    String subtitle,
  ) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailScreen(
              placeName: title,
              placeImage: '',
              placeDescription: '',
            ),
          ),
        );
      },
      child: Material(
        elevation: 3.0,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: 220,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    image,
                    width: 200,
                    height: 140,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
              const Spacer(),
              Container(
                width: 70,
                height: 35,
                decoration: const BoxDecoration(
                  color: Color(0xff3280ef),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
                ),
                margin: const EdgeInsets.only(left: 150),
                child: const Icon(Icons.arrow_forward, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget exploreCircle(String image, String title) {
    return GestureDetector(
      onTap: () {
        debugPrint("Clicked on $title");
      },
      child: Column(
        children: [
          Material(
            elevation: 6,
            shape: const CircleBorder(),
            shadowColor: Colors.black.withOpacity(0.3),
            child: ClipOval(
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget trendingCard(String image, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(15),
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(image, width: 60, height: 60, fit: BoxFit.cover),
          ),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: const Text("Click for more details"),
          trailing: const Icon(Icons.arrow_forward_ios, size: 18),
        ),
      ),
    );
  }

  Widget eventCard(String eventName, String locationDate) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.event, color: Color(0xff3280ef)),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                eventName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                locationDate,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
