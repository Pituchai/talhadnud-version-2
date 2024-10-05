import 'package:flutter/material.dart';

class StatusArea extends StatelessWidget {
  const StatusArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8.0), // Padding inside the outer container
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildLegendItem('Booked', Colors.grey),
              _buildLegendItem('Available', Colors.green),
              _buildLegendItem('Unavailable', Colors.red),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLegendItem(String text, Color color) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            border: Border.all(
              color: color, // Use a border color instead of a fill color
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(4), // Square shape with rounded corners
          ),
          child: color == Colors.grey
              ? Container(
                  decoration: BoxDecoration(
                    color: color, // Fill color for the 'Booked' status
                    borderRadius: BorderRadius.circular(4),
                  ),
                )
              : null, // Keep the container transparent for others
        ),
        const SizedBox(width: 5), // Space between the box and the text
        Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Quicksand'),
        ),
      ],
    );
  }
}
