import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'dart:convert';

class PendingPaymentPage extends StatefulWidget {
  const PendingPaymentPage({Key? key}) : super(key: key);

  @override
  _PendingPaymentPageState createState() => _PendingPaymentPageState();
}

class _PendingPaymentPageState extends State<PendingPaymentPage> {
  Timer? _timer;
  late DateTime _expiresAt;
  late DateTime _bookingDate;
  late Duration _timeRemaining;
  bool _dialogShown = false;

  final Map<String, dynamic> mockData = {
    "data": {
      "id": "3f75f8d7-41bd-43da-82a8-5022d3f6776a",
      "slotId": "6d10e997-a155-4b34-8776-ecdc00290cce-A-1-2024-11-01",
      "vendorId": "340217a2-b832-41bc-be9e-b096b5b063d8",
      "transactionId": "19024dab-384a-44ab-ac1a-335a09627209",
      "bookingDate": "2024-11-07T07:00:00Z",
      "expiresAt": "2024-10-06T19:31:06.51229+07:00",
      "price": 150.0,
      "status": "pending",
      "method": "PromptPay",
      "image": ""
    },
    "message": "Booking created successfully",
    "status": "success"
  };

  @override
  void initState() {
    super.initState();
    final data = mockData['data'] as Map<String, dynamic>;
    _bookingDate = DateTime.parse(data['bookingDate'] as String).toLocal();
    _expiresAt = DateTime.parse(data['expiresAt'] as String).toLocal();
    _timeRemaining = _expiresAt.difference(DateTime.now());
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        _timeRemaining = _expiresAt.difference(DateTime.now());
        if (_timeRemaining.isNegative) {
          _timeRemaining = Duration.zero;
          _timer?.cancel();
          _showTimeoutDialog();
        }
      });
    });
  }

  void _showTimeoutDialog() {
    if (!_dialogShown) {
      _dialogShown = true;
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext dialogContext) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(0, 10),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Time out',
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      color: Color(0xFF14213D),
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 24),
                  Text(
                    'The payment time has expired.',
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      color: Color(0xFF14213D),
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF14213D),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        ),
                        child: Text(
                          'OK',
                          style: TextStyle(
                            fontFamily: 'Quicksand',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(dialogContext).pop();
                          GoRouter.of(context).go('/reservation');
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = mockData['data'] as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF14213D),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => {
            Navigator.of(context).pop(),
            context.go('/'),
          },
        ),
        title: const Text(
          'Payment Details',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(153, 238, 237, 237),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInfoRow(
                'Total Amount',
                '฿${data['price'].toStringAsFixed(2)}',
                isTotal: true
              ),
              _buildCombinedInfoBox(),
              const SizedBox(height: 24),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'THAI QR PAYMENT',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF14213D),
                        ),
                      ),
                      const SizedBox(height: 16),
                      StableQRCode(imageData: data['image']),
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
                        'Talhadnud (THAILAND) CO.,LTD',
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
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        // TODO: Implement QR code saving logic
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFF5CB793),
                        side: const BorderSide(color: Color(0xFF5CB793)),
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
                        backgroundColor: const Color(0xFF5CB793),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text('Confirm'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCombinedInfoBox() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildInfoItem('Time Remaining', _formatDuration(_timeRemaining)),
          Divider(height: 1, color: Colors.grey[300]),
          _buildInfoItem('Please pay within', _formatDateTime(_expiresAt)),
          Divider(height: 1, color: Colors.grey[300]),
          _buildInfoItem('Booking area on date', _formatDateTime(_bookingDate)),
        ],
      ),
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: isTotal ? Colors.black : Colors.black87,
                  fontWeight: isTotal ? FontWeight.bold : FontWeight.w500,
                  fontSize: isTotal ? 18 : 16,
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: isTotal ? 18 : 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDuration(Duration duration) {
    if (duration.isNegative) {
      return "Expired";
    }
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${duration.inHours}:$twoDigitMinutes:$twoDigitSeconds";
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('dd MMM yyyy, HH:mm:ss').format(dateTime);
  }
}

class StableQRCode extends StatelessWidget {
  final String imageData;
  final double size;

  const StableQRCode({Key? key, required this.imageData, this.size = 200})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (imageData.isNotEmpty) {
      return Image.memory(
        base64Decode(imageData),
        width: size,
        height: size,
        fit: BoxFit.contain,
        gaplessPlayback: true,
      );
    } else {
      return Container(
        width: size,
        height: size,
        color: Colors.grey[300],
        child: const Center(
          child: Text(
            'QR Code Placeholder',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black54),
          ),
        ),
      );
    }
  }
}