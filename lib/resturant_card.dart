import 'package:basic_design_project/resturant_model.dart';
import 'package:flutter/material.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantCard({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: Image.network(
                  restaurant.imageUrl,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const Positioned(
                top: 10,
                left: 10,
                child: Chip(
                  label: Text(
                    'Featured',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.black54,
                ),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                child: Chip(label: Text(restaurant.deliveryTime)),
              ),
            ],
          ),

          // Details
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left side
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      restaurant.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      restaurant.cuisine,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 4),
                    const Icon(Icons.two_wheeler, color: Colors.grey, size: 20),
                  ],
                ),

                // Rating
                Row(
                  children: [
                    const Icon(Icons.star, size: 18, color: Colors.orange),
                    const SizedBox(width: 4),
                    Text(restaurant.rating),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
