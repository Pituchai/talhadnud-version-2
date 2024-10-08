import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:ticket_widget/ticket_widget.dart';

class TicketPage extends StatelessWidget {
  TicketPage({Key? key}) : super(key: key);

  final Map<String, String> ticketData = {
    'Market Name': 'KMUTT-Market',
    'Name': 'Pituchai Mitpakdee',
    'Slot': 'A-1',
    'Book-Date': 'Jan 04, 2024',
    'Time': '06:00 AM - 08:00 PM',
    'Location': '126 Pracha Uthit Rd. Bang Mod Thung Khru Bangkok 10140 Thailand',
    'Type': 'Food-Product',
    'Price': '150 Baht',
    'Ref': 'fadsf213fafad',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('E-Ticket', style: TextStyle(color: Colors.black, fontFamily: 'Quicksand')),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Color(0xFF1A2B47),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TicketWidget(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.75,
                  isCornerRounded: true,
                  padding: EdgeInsets.all(20),
                  color: Colors.white,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            ticketData['Market Name'] ?? '',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'Quicksand'),
                          ),
                        ),
                        SizedBox(height: 20),
                        Center(child: _buildQRCode()),
                        SizedBox(height: 20),
                        Center(
                          child: Text(
                            'Please scan your QR Code at the market entrance.',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.grey[600], fontSize: 12, fontFamily: 'Quicksand'),
                          ),
                        ),
                        SizedBox(height: 30),
                        _buildTicketDetails(context),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                _buildButtonRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //kind like support feature,but less important 
  Widget _buildQRCode() {
    return QrImageView(
      data: 'KMUTT-Market:${ticketData['Slot']}:${ticketData['Book-Date']}:${ticketData['Ref']}',
      version: QrVersions.auto,
      size: 150.0,
    );
  }

  Widget _buildTicketDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: ticketData.entries.where((entry) => entry.key != 'Market Name').map((entry) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  entry.key,
                  style: TextStyle(color: Colors.grey[600], fontSize: 12, fontFamily: 'Quicksand'),
                ),
              ),
              Expanded(
                flex: 3,
                child: _buildWrappedText(entry.value),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildWrappedText(String text) {
    List<String> words = text.split(' ');
    String currentLine = '';
    List<String> lines = [];

    for (String word in words) {
      if (currentLine.isEmpty) {
        currentLine = word;
      } else if ((currentLine + ' ' + word).length <= 30) {
        currentLine += ' ' + word;
      } else {
        lines.add(currentLine);
        currentLine = word;
      }
    }
    if (currentLine.isNotEmpty) {
      lines.add(currentLine);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: lines.map((line) => Text(
        line,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, fontFamily: 'Quicksand'),
      )).toList(),
    );
  }

  Widget _buildButtonRow() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            child: Text('Chat with us', style: TextStyle(fontSize: 16, fontFamily: 'Quicksand', color: Colors.white)),
            onPressed: () {
              // Implement cancel booking functionality
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              padding: EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        SizedBox(width: 10), // Add some space between the buttons
        Expanded(
          child: ElevatedButton(
            child: Text('Back to Market', style: TextStyle(fontSize: 16, fontFamily: 'Quicksand', color: Colors.black)),
            onPressed: () {
              // Implement navigation functionality
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}