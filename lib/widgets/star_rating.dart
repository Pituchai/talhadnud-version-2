import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final double rating;
  final int numRatings;
  final double starSize;
  final double textSize;

  const StarRating({
    Key? key,
    required this.rating,
    required this.numRatings,
    this.starSize = 24,
    this.textSize = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int fullStars = rating.floor();
    bool hasHalfStar = (rating - fullStars) >= 0.5;

    return Row(
      children: [
        ...List.generate(5, (index) {
          if (index < fullStars) {
            return Icon(Icons.star, color: Colors.amber, size: starSize);
          } else if (index == fullStars && hasHalfStar) {
            return Icon(Icons.star_half, color: Colors.amber, size: starSize);
          } else {
            return Icon(Icons.star_border, color: Colors.amber, size: starSize);
          }
        }),
        SizedBox(width: 12),
        Text(
          '$rating (${(numRatings / 1).toStringAsFixed(1)} ratings)',
          style: TextStyle(
            fontSize: textSize,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A2B47), // Dark blue color, adjust as needed
          ),
        ),
      ],
    );
  }
}