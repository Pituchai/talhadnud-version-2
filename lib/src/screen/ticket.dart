import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:ticket_widget/ticket_widget.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';

import '../../theme/talhadnad_theme.dart';

class TicketPage extends StatelessWidget {
  TicketPage({Key? key}) : super(key: key);

  final Map<String, String> ticketData = {
    'Market Name': 'KMUTT-Market',
    'Name': 'Pituchai Mitpakdee',
    'Slot': 'A-1',
    'Book-Date': '04 Oct 2024',
    'Time': '06:00 A.M. - 20:00 P.M.',
    'Location': '126 Pracha Uthit Rd. Bang Mod Thung Khru Bangkok 10140 Thailand',
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
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('E-Ticket',
            style: TextStyle(color: Colors.black, fontFamily: 'Quicksand')),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: const Color.fromARGB(255, 5, 62, 85),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TicketWidget(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.68,
                  isCornerRounded: true,
                  padding: const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 10),
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
                      const SizedBox(height: 15),
                      _buildDashedLine(),
                      const SizedBox(height: 20),
                      _buildInfoRow('Name', 'Price', context),
                      const SizedBox(height: 15),
                      _buildInfoRow('Slot', 'Type', context),
                      const SizedBox(height: 15),
                      _buildInfoRow('Book-Date', 'Time', context),
                      const SizedBox(height: 15),
                      _buildInfoRow('Market Name', 'Ref', context),
                      const SizedBox(height: 15),
                      _buildStatusWidget(),
                      const SizedBox(height: 30),
                      _buildDashedLine(),
                      const SizedBox(height: 30),
                      const Center(
                        child: Text("Show this to market space provider"),
                      ),
                      const SizedBox(height: 20),
                      _buildBarcode(context),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                _buildLocationSection(context),
                const SizedBox(height: 20),
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
          flex: 2,
          child: _buildDetailColumn(leftKey, ticketData[leftKey] ?? '',
              CrossAxisAlignment.start, TextAlign.left),
        ),
        Expanded(
          flex: 3,
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
            fontSize: 12,
            fontFamily: 'Quicksand',
          ),
          textAlign: textAlign,
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
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
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
        height: double.infinity,
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
        itemCount: 100,
      ),
    );
  }

  Widget _buildLocationSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Your Market location',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'Quicksand'
          )
        ),
        const SizedBox(height: 20),
        Container(
          height: MediaQuery.of(context).size.height * 0.15,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          clipBehavior: Clip.antiAlias,
          child: const MapKmutt(
            latitude: 13.650420,
            longitude: 100.495305,
            title: 'KMUTT Market',
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
            child: const Text(
              'Chat with us',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Quicksand',
                color: Colors.white
              )
            ),
            onPressed: () {
              // Implement chat functionality
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              padding: const EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: ElevatedButton(
            child: const Text(
              'Back to Market',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Quicksand',
                color: Colors.black
              )
            ),
            onPressed: () {
              // Implement navigation functionality
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 15),
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

class MapKmutt extends StatefulWidget {
  final double latitude;
  final double longitude;
  final String title;

  const MapKmutt({
    Key? key,
    required this.latitude,
    required this.longitude,
    required this.title,
  }) : super(key: key);

  @override
  _MapKmuttState createState() => _MapKmuttState();
}

class _MapKmuttState extends State<MapKmutt> {
  late LatLng _center;
  final LatLng _destinationPoint = const LatLng(13.650420, 100.495305);

  @override
  void initState() {
    super.initState();
    _center = LatLng(widget.latitude, widget.longitude);
  }

  Future<void> _launchGoogleMaps() async {
    final lat = _destinationPoint.latitude;
    final lon = _destinationPoint.longitude;
    final url = Uri.parse('https://www.google.com/maps/search/?api=1&query=$lat,$lon');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        initialCenter: _center,
        initialZoom: 16.0,
        onTap: (_, __) => _launchGoogleMaps(),
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.app',
          tileProvider: CancellableNetworkTileProvider(),
        ),
        MarkerLayer(
          markers: [
            Marker(
              width: 80.0,
              height: 80.0,
              point: _center,
              child: const Icon(
                Icons.location_on,
                color: Colors.red,
                size: 40.0,
              ),
            ),
          ],
        ),
      ],
    );
  }
}