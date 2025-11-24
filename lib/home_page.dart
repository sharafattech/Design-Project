import 'package:basic_design_project/resturant_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  final List<Restaurant> restaurants = const [
    Restaurant(
      name: 'FlavorNest',
      cuisine: 'International',
      rating: '4.5 (102)',
      deliveryTime: '30 min',
      imageUrl:
          'https://images.pexels.com/photos/56866/garden-rose-red-pink-56866.jpeg',
    ),
    Restaurant(
      name: 'The Food Cabin',
      cuisine: 'Local Favorites',
      rating: '4.8 (88)',
      deliveryTime: '25 min',
      imageUrl:
          'https://images.pexels.com/photos/941861/pexels-photo-941861.jpeg',
    ),
    Restaurant(
      name: 'Fresh Bistro',
      cuisine: 'Healthy',
      rating: '4.2 (55)',
      deliveryTime: '45 min',
      imageUrl:
          'https://images.pexels.com/photos/262047/pexels-photo-262047.jpeg',
    ),
    Restaurant(
      name: 'Fresh Bistro',
      cuisine: 'Healthy',
      rating: '4.2 (55)',
      deliveryTime: '45 min',
      imageUrl:
          'https://images.pexels.com/photos/941861/pexels-photo-941861.jpeg',
    ),
    Restaurant(
      name: 'Fresh Bistro',
      cuisine: 'Healthy',
      rating: '4.2 (55)',
      deliveryTime: '45 min',
      imageUrl:
          'https://images.pexels.com/photos/56866/garden-rose-red-pink-56866.jpeg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Toaam'),
        actions: [Icon(Icons.shopping_cart)],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFFFFC107),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: "Orders"),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profile",
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'ALL Resturants',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: restaurants.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.green,
                        ),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    12,
                                  ),
                                  child: Image.network(
                                    restaurants[index].imageUrl,
                                    height: 200,
                                    width: double.infinity,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Positioned(
                                  top: 10,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    child: Text(
                                      'Featured',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 5,
                                  child: Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        '${restaurants[index].deliveryTime}',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${restaurants[index].name}',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text('${restaurants[index].cuisine}'),
                              Icon(Icons.two_wheeler_outlined),
                            ],
                          ),
                          Row(
                            children: [
                              Text('${restaurants[index].rating}'),
                              Icon(Icons.star_border_sharp),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
