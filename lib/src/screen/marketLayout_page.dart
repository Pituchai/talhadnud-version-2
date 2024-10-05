import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SeatType {
  final String name;
  final double price;
  final Color color;

  SeatType({required this.name, required this.price, required this.color});
}

class Seat {
  final String id;
  final int row;
  final int col;
  final SeatType type;
  bool isSelected;
  bool isBooked;

  Seat({
    required this.id,
    required this.row,
    required this.col,
    required this.type,
    this.isSelected = false,
    this.isBooked = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'row': row,
      'col': col,
      'type': type.name,
      'isSelected': isSelected,
      'isBooked': isBooked,
    };
  }
}

class TheaterSeatBooking extends StatefulWidget {
  const TheaterSeatBooking({Key? key}) : super(key: key);

  @override
  _TheaterSeatBookingState createState() => _TheaterSeatBookingState();
}

class _TheaterSeatBookingState extends State<TheaterSeatBooking> {
  late List<List<Seat>> seats;

  final List<SeatType> seatTypes = [
    SeatType(name: 'Standard', price: 10.0, color: Colors.blue),
    SeatType(name: 'Premium', price: 15.0, color: Colors.purple),
    SeatType(name: 'VIP', price: 20.0, color: Colors.orange),
  ];

  @override
  void initState() {
    super.initState();
    _initializeSeats();
  }

  void _initializeSeats() {
    seats = List.generate(
      8,
      (row) => List.generate(
        10,
        (col) {
          String id = '${String.fromCharCode(65 + row)}${col + 1}';
          SeatType type = _getSeatType(row, col);
          return Seat(id: id, row: row, col: col, type: type);
        },
      ),
    );
  }

  SeatType _getSeatType(int row, int col) {
    if (row < 2) return seatTypes[0]; // Standard
    if (row < 6) return seatTypes[1]; // Premium
    return seatTypes[2]; // VIP
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Seats'),
        backgroundColor: Colors.indigo,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          _buildScreen(),
          SizedBox(height: 40),
          Expanded(
            child: _buildSeats(),
          ),
          _buildLegend(),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _bookSelectedSeats,
            child: Text('Book Selected Seats'),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildScreen() {
    return Container(
      width: 300,
      height: 20,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Center(
          child: Text('SCREEN', style: TextStyle(color: Colors.black54))),
    );
  }

  Widget _buildSeats() {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          seats.length,
          (row) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              seats[row].length,
              (col) => _buildSeat(row, col),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSeat(int row, int col) {
    Seat seat = seats[row][col];
    Color seatColor = seat.isBooked
        ? Colors.grey
        : seat.isSelected
            ? Colors.green
            : seat.type.color;

    return GestureDetector(
      onTap: () {
        if (!seat.isBooked) {
          setState(() {
            seat.isSelected = !seat.isSelected;
          });
        }
      },
      child: Container(
        margin: EdgeInsets.all(5),
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: seatColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            seat.id,
            style: TextStyle(color: Colors.white, fontSize: 10),
          ),
        ),
      ),
    );
  }

  Widget _buildLegend() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _legendItem(Colors.grey, 'Booked'),
            SizedBox(width: 20),
            _legendItem(Colors.green, 'Selected'),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: seatTypes
              .map((type) => _legendItem(type.color, type.name))
              .toList(),
        ),
      ],
    );
  }

  Widget _legendItem(Color color, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          SizedBox(width: 5),
          Text(label),
        ],
      ),
    );
  }

  Future<void> _bookSelectedSeats() async {
    List<Seat> selectedSeats =
        seats.expand((row) => row).where((seat) => seat.isSelected).toList();

    if (selectedSeats.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select at least one seat')),
      );
      return;
    }

    try {
      final response = await http.post(
        Uri.parse('https://your-api-endpoint.com/book-seats'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'seats': selectedSeats.map((seat) => seat.toJson()).toList(),
        }),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Seats booked successfully')),
        );
        // Update the UI to reflect booked seats
        setState(() {
          for (var seat in selectedSeats) {
            seat.isBooked = true;
            seat.isSelected = false;
          }
        });
      } else {
        throw Exception('Failed to book seats');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error booking seats: $e')),
      );
    }
  }
}
