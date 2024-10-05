import 'package:flutter/material.dart';

enum SlotStatus { Selected, Unselected, Booked, Disabled }

class MarketLayout extends StatelessWidget {
  final Function(String) onSlotSelected;
  final Map<String, SlotStatus> slotStatuses;

  const MarketLayout({
    Key? key,
    required this.onSlotSelected,
    required this.slotStatuses,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Apply a scaling factor to reduce sizes
        final double scaleFactor = 0.88; // Adjust this value to change the overall size

        // Calculate sizes based on available space
        final double slotWidth = (constraints.maxWidth / 8) * scaleFactor;
        final double tempmaxWidth = (constraints.maxWidth / 6) * scaleFactor;
        final double slotHeight = ((tempmaxWidth * 0.6) + 15) * scaleFactor;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(height: slotHeight, width: slotWidth),
                Padding(
                  padding: EdgeInsets.only(left: 3 * scaleFactor),
                  child: _buildSlot('B-1', slotWidth, slotHeight),
                ),
                SizedBox(height: slotHeight, width: slotWidth - 6 * scaleFactor),
                SizedBox(height: slotHeight, width: slotWidth - 12 * scaleFactor),
                _buildSlot('B-2', slotWidth, slotHeight),
                _buildSlot('B-3', slotWidth, slotHeight),
                _buildSlot('B-4', slotWidth, slotHeight),
                _buildSlot('B-5', slotWidth, slotHeight),
              ],
            ),
            Row(
              children: [
                SizedBox(height: slotHeight, width: slotWidth + 0.5 * scaleFactor),
                Padding(
                  padding: EdgeInsets.only(left: 3 * scaleFactor),
                  child: _buildSlot('B-6', slotWidth, slotHeight),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    _buildSlot('A-1', slotWidth, slotHeight),
                    _buildSlot('A-2', slotWidth, slotHeight),
                  ],
                ),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              _buildSlot('C-1', slotWidth, slotHeight),
                              _buildSlot('C-2', slotWidth, slotHeight),
                            ],
                          ),
                          SizedBox(height: slotHeight, width: slotWidth - 6 * scaleFactor),
                          SizedBox(height: slotHeight, width: slotWidth - 12 * scaleFactor),
                          Column(
                            children: [
                              _buildSlot('D-1', slotWidth, slotHeight),
                              _buildSlot('D-2', slotWidth, slotHeight),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5 , bottom: 3 ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[400],
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(4 * scaleFactor),
                              ),
                              height: 110 * scaleFactor,
                              width: 160 * scaleFactor ,
                              child: Center(
                                child: Text(
                                  'Shop',
                                  style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14 * scaleFactor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          _buildSlot('E-1', slotWidth, slotHeight),
                          SizedBox(height: slotHeight, width: (slotWidth + 28) * scaleFactor),
                          _buildSlot('E-2', slotWidth, slotHeight),
                          _buildSlot('E-3', slotWidth, slotHeight),
                          _buildSlot('E-4', slotWidth, slotHeight),
                          _buildSlot('E-5', slotWidth, slotHeight),
                        ],
                      ),
                      Row(
                        children: [
                          _buildSlot('F-1', slotWidth, slotHeight),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(height: slotHeight, width: slotWidth),
                        _buildSlot('G-1', slotWidth, slotHeight),
                      ],
                    ),
                    Row(
                      children: [
                       
                        Padding(
                          padding: EdgeInsets.only(top: 1 * scaleFactor, left: 4 * scaleFactor),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 187, 186, 186),
                              borderRadius: BorderRadius.circular(4 * scaleFactor),
                              border: Border.all(),
                            ),
                            height: slotHeight,
                            width: slotWidth * 2 + 3,
                            child: Center(
                              child: Text(
                                'Stair',
                                style: TextStyle(
                                  fontFamily: 'Quicksand',
                                  fontSize: 16 * scaleFactor,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 3 * scaleFactor),
                      child: Row(
                        children: [
                          SizedBox(height: slotHeight, width: slotWidth + 3.5 * scaleFactor),
                          _buildSlot('G-2', slotWidth, slotHeight),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        _buildSlot('G-3', slotWidth, slotHeight),
                        _buildSlot('G-4', slotWidth, slotHeight),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(height: slotHeight, width: slotWidth * 2 - 14 * scaleFactor),
                    SizedBox(height: slotHeight, width: slotWidth * 2 - 14 * scaleFactor),
                    SizedBox(height: slotHeight, width: slotWidth * 2 - 14 * scaleFactor),
                    SizedBox(height: slotHeight, width: slotWidth * 2 - 14 * scaleFactor),
                  ],
                ),
                Column(
                  children: [
                    _buildSlot('H-1', slotWidth, slotHeight),
                    _buildSlot('H-2', slotWidth, slotHeight),
                    _buildSlot('H-3', slotWidth, slotHeight),
                    _buildSlot('H-4', slotWidth, slotHeight),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 187, 186, 186),
                          borderRadius: BorderRadius.circular(4 * scaleFactor),
                          border: Border.all(),
                        ),
                        width: slotWidth * 3,
                        height: 215 * scaleFactor,
                        child: Center(
                          child: Text(
                            'Canteen',
                            style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 16 * scaleFactor,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        );
      },
    );
  }

  Widget _buildSlot(String slotId, double width, double height) {
    final status = slotStatuses[slotId] ?? SlotStatus.Unselected;
    final color = _getSlotColor(status);
    final borderColor = _getBorderColor(status);

    return Padding(
      padding: EdgeInsets.only(left: 2, bottom: 3),
      child: GestureDetector(
        onTap: status != SlotStatus.Disabled ? () => onSlotSelected(slotId) : null,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color,
            border: Border.all(color: borderColor, width: 2),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
            child: Text(
              slotId,
              style: TextStyle(
                fontSize: width * 0.3,
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color _getSlotColor(SlotStatus status) {
    switch (status) {
      case SlotStatus.Selected:
        return Colors.lightGreen;
      case SlotStatus.Unselected:
        return Colors.white;
      case SlotStatus.Booked:
        return Colors.grey;
      case SlotStatus.Disabled:
        return Colors.red[100]!;
    }
  }

  Color _getBorderColor(SlotStatus status) {
    switch (status) {
      case SlotStatus.Selected:
        return Colors.green;
      case SlotStatus.Unselected:
        return Colors.green;
      case SlotStatus.Booked:
        return Colors.grey;
      case SlotStatus.Disabled:
        return Colors.red;
    }
  }
}