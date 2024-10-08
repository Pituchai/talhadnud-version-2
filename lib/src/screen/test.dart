import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'dart:convert';

class PendingPaymentPage extends StatefulWidget {
  const PendingPaymentPage({Key? key}) : super(key: key);

  @override
  _PendingPaymentPageState createState() => _PendingPaymentPageState();
}

class _PendingPaymentPageState extends State<PendingPaymentPage> {
  late Timer _timer;
  late DateTime _bookingDate;
  late DateTime _expiresAt;
  late Duration _timeRemaining;

  final Map mockData = {
    "data": {
      "id": "3f75f8d7-41bd-43da-82a8-5022d3f6776a",
      "slotId": "6d10e997-a155-4b34-8776-ecdc00290cce-A-1-2024-11-01",
      "vendorId": "340217a2-b832-41bc-be9e-b096b5b063d8",
      "transactionId": "19024dab-384a-44ab-ac1a-335a09627209",
      "bookingDate": "2024-10-02T07:00:00+07:00",
      "price": 150.0,
      "status": "pending",
      "method": "PromptPay",
      
          

    },
    "message": "Booking created successfully", } ; 

  @override
  void initState() {
    super.initState();
    final data = mockData['data'] as Map<String, dynamic>;
    _bookingDate = DateTime.parse(data['bookingDate'] as String);
    _expiresAt = _bookingDate.add(const Duration(hours: 24));
    _updateTimeRemaining();
    _timer = Timer.periodic(
        const Duration(seconds: 1), (_) => _updateTimeRemaining());
  }

  void _updateTimeRemaining() {
    final now = DateTime.now().toUtc().add(const Duration(hours: 7));
    setState(() {
      _timeRemaining = _expiresAt.difference(now);
      if (_timeRemaining.isNegative) {
        _timeRemaining = Duration.zero;
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = mockData['data'] as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.red),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Payment Details',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTotalAmount(data['price']),
              const Divider(height: 32),
              _buildTimeRemaining(),
              const SizedBox(height: 24),
              _buildQRContainer(data),
              const SizedBox(height: 24),
              _buildButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTotalAmount(double amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Total Amount',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        Text(
          '฿${amount.toStringAsFixed(2)}',
          style: const TextStyle(
            fontSize: 20,
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildTimeRemaining() {
    return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Column(
            children: [
              const Text(
                'Please pay within',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(width: 8),
              
            ],
          ),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          
          Text(
                    _formatDuration(_timeRemaining),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          const SizedBox(height: 4),
          Text(
            'Expires at ${_formatDateTime(_expiresAt)}',
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    ],
  );
}
  }

  Widget _buildQRContainer(Map<String, dynamic> data) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: const BoxDecoration(
              color: Color(0xFF14213D),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: const Center(
              child: Text(
                'THAI QR PAYMENT',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildQRCode(data['image'] ?? ''),
                const SizedBox(height: 16),
                Text(
                  '฿${data['price'].toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF14213D),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'SHOPEEPAY (THAILAND) CO.,LTD',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 8),
                Text(
                  'Reference no. ${data['transactionId']}',
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtons() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              // TODO: Implement QR code saving logic
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.red,
              side: const BorderSide(color: Colors.red),
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Text('Save QR'),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              // TODO: Implement confirmation logic
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Text('Confirm'),
          ),
        ),
      ],
    );
  }

  Widget _buildQRCode(String imageData) {
    if (imageData.isNotEmpty) {
      return Image.memory(
        base64Decode(imageData),
        width: 200,
        height: 200,
        fit: BoxFit.contain,
      );
    } else {
      return Container(
        width: 200,
        height: 200,
        color: Colors.grey[300],
        child: const Center(child: Text('QR Code Placeholder')),
      );
    }
  }

  String _formatDuration(Duration duration) {
    if (duration.isNegative || duration == Duration.zero) {
      return "Expired";
    }
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('dd MMM yyyy, HH:mm').format(dateTime);
  }