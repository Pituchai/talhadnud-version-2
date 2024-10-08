import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';

import 'package:ticket_widget/ticket_widget.dart';

import '../../theme/talhadnad_theme.dart';

class TicketPage extends StatelessWidget {
  TicketPage({Key? key}) : super(key: key);

  final Map<String, String> ticketData = {
    'Market Name': 'KMUTT-Market',
    'Name': 'Pituchai Mitpakdee',
    'Slot': 'A-1',
    'Book-Date': '04 Oct 2024',
    'Time': '06:00 A.M. - 20:00 P.M.',
    'Location':
        '126 Pracha Uthit Rd. Bang Mod Thung Khru Bangkok 10140 Thailand',
    'Type': 'Food-Product',
    'Price': '150 Baht',
    'Ref': 'fadsf213fafad',
    'Status': 'Confirm'
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('E-Ticket',
            style: TextStyle(color: Colors.black, fontFamily: 'Quicksand')),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: const Color.fromARGB(255, 5, 62, 85),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TicketWidget(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height:
                   MediaQuery.of(context).size.height * 0.68,
                  isCornerRounded: true,
                  padding:
                      EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 10),
                  color: Colors.white,
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.store,
                            color: Color(0xFF36A690),
                            size: 30,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Talhadnud',
                            style: TextStyle(
                              color: Color(0xFF36A690),
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Quicksand',
                            ),
                          ),
                        ],
                      ),
                         SizedBox(height: 15),
                       _buildDashedLine(),
                   
                      SizedBox(height: 20),
                      _buildInfoRow('Name', 'Price', context),
                      SizedBox(height: 15),
                      _buildInfoRow('Slot', 'Type', context),
                      SizedBox(height: 15),
                      _buildInfoRow('Book-Date', 'Time', context),
                      SizedBox(height: 15),
                      _buildInfoRow('Market Name', 'Ref', context),
                      SizedBox(height: 15),
                      _buildStatusWidget(),
                      SizedBox(height: 30),
                      _buildDashedLine(),
                      SizedBox(height: 30),
                      Center(
                        child: Text("Show this to market space provider"),
                      ),
                      SizedBox(height: 20),
                      _buildBarcode(context),

                    ],
                  ),
                ),
                SizedBox(height: 20),
                _buildLocationSection(context),
                SizedBox(height: 20),
                _buildButtonRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String leftKey, String rightKey, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2, // ลดลงจาก 3
          child: _buildDetailColumn(leftKey, ticketData[leftKey] ?? '',
              CrossAxisAlignment.start, TextAlign.left),
        ),
        Expanded(
          flex: 3, // เพิ่มขึ้นจาก 2
          child: _buildDetailColumn(rightKey, ticketData[rightKey] ?? '',
              CrossAxisAlignment.end, TextAlign.right),
        ),
      ],
    );
  }

  Widget _buildDetailColumn(String label, String value,
      CrossAxisAlignment crossAlignment, TextAlign textAlign) {
    return Column(
      crossAxisAlignment: crossAlignment,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 12, // ลดลงจาก 14
            fontFamily: 'Quicksand',
          ),
          textAlign: textAlign,
        ),
        SizedBox(height: 2),
        Text(
          value,
          style: TextStyle(
            fontSize: 14, // ลดลงจาก 16
            fontWeight: FontWeight.bold,
            fontFamily: 'Quicksand',
          ),
          textAlign: textAlign,
        ),
      ],
    );
  }

  Widget _buildStatusWidget() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.green[100],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        'Status: ${ticketData['Status']}',
        style: TextStyle(
          color: Colors.green[800],
          fontSize: 16,
          fontWeight: FontWeight.bold,
          fontFamily: 'Quicksand',
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  //barcode still not show barcodeData
  Widget _buildBarcode(BuildContext context) {
    final barcodeData =
        'KMUTT-Market:${ticketData['Slot']}:${ticketData['Book-Date']}:${ticketData['Ref']}';
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      height: 70,
      child: BarcodeWidget(
        barcode: Barcode.code128(),
        data: barcodeData,
        width: double.infinity,
        height:double.infinity ,
        drawText: false,
      ),
    );
  }

  Widget _buildDashedLine() {
    return Container(
      height: 1,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            width: 5,
            height: 1,
            color: index % 2 == 0 ? Colors.grey : Colors.transparent,
          );
        },
        itemCount: 100, // Adjust based on screen width
      ),
    );
  }

  Widget _buildLocationSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Your Market location',
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontFamily: 'Quicksand')),
        SizedBox(height: 20),
        Container(
          height: MediaQuery.of(context).size.height * 0.15,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Icon(Icons.map,
                size: MediaQuery.of(context).size.width * 0.15,
                color: Colors.grey[600]),
          ),
        ),
      ],
    );
  }

  Widget _buildButtonRow() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            child: Text('Chat with us',
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Quicksand',
                    color: Colors.white)),
            onPressed: () {
              // Implement chat functionality
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
        SizedBox(width: 10),
        Expanded(
          child: ElevatedButton(
            child: Text('Back to Market',
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Quicksand',
                    color: Colors.black)),
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
