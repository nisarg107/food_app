import 'package:flutter/material.dart';

class RestaurantPage extends StatelessWidget {
  final String restaurantName;
  final String imageUrl;
  final String cuisineType;
  final double rating;
  final int priceRange; 
  final List<String> features; 

  RestaurantPage({
    required this.restaurantName,
    required this.imageUrl,
    required this.cuisineType,
    required this.rating,
    required this.priceRange,
    required this.features,
  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
            children: [
              // Restaurant image
              Hero(
                tag: restaurantName, // For smooth image transition
                child: Image.network(imageUrl, fit: BoxFit.cover, height: 200.0),
              ),
      
              // Restaurant details
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(restaurantName, style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
                    SizedBox(height: 5.0),
                    Row(
                      children: [
                        Text(cuisineType, style: TextStyle(fontSize: 16.0, color: Colors.grey)),
                        SizedBox(width: 10.0),
                        Icon(Icons.star, color: Colors.amber, size: 16.0),
                        Text(rating.toStringAsFixed(1), style: TextStyle(fontSize: 16.0)),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        for (var feature in features) Icon(getIconForFeature(feature), size: 16.0),
                      ],
                    ),
                  ],
                ),
              ),
      
              // Menu button (optional)
              OutlinedButton(
                onPressed: () {
                  // Navigate to menu page
                },
                child: Text('See Menu'),
              ),
      
              // Reviews section (optional)
              SizedBox(height: 20.0),
              Text('Reviews', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
              
            ],
      ),
    );
  }

  // Helper function to map features to icons
  IconData getIconForFeature(String feature) {
    switch (feature) {
      case 'delivery':
        return Icons.delivery_dining;
      case 'outdoor_seating':
        return Icons.sunny;
      default:
        return Icons.info;
    }
  }
}

// Optional ReviewCard widget
class ReviewCard extends StatelessWidget {
  final String reviewerName;
  final String reviewText;
  final double rating;

  ReviewCard({
    required this.reviewerName,
    required this.reviewText,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(reviewerName, style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                Spacer(),
                Icon(Icons.star, color: Colors.amber, size: 16.0),
                Text(rating.toStringAsFixed(1), style: TextStyle(fontSize: 16.0)),
              ],
            ),
            SizedBox(height: 5.0),
            Text(reviewText),
          ],
        ),
      ),
    );
  }
}
