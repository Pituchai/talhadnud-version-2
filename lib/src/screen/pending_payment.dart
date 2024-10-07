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
      "image":
          "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",

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
                crossAxisAlignment: CrossAxisAlignment.center,  // Align children to the left
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
                    mainAxisAlignment: MainAxisAlignment.end,  // Align button to the right
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
                }),
        title: const Text(
          'Payment Details',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
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
                  'Total Amount', '฿${data['price'].toStringAsFixed(2)}',
                  isTotal: true),
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

class StableQRCode extends StatefulWidget {
  final String imageData;
  final double size;

  const StableQRCode({Key? key, required this.imageData, this.size = 200})
      : super(key: key);

  @override
  _StableQRCodeState createState() => _StableQRCodeState();
}

class _StableQRCodeState extends State<StableQRCode> {
  @override
  Widget build(BuildContext context) {
    if (widget.imageData.isNotEmpty) {
      return Image.memory(
        base64Decode(widget.imageData),
        width: widget.size,
        height: widget.size,
        fit: BoxFit.contain,
        gaplessPlayback: true, // Prevents flickering when rebuilding
      );
    } else {
      return Container(
        width: widget.size,
        height: widget.size,
        color: Colors.grey[300],
        child: const Center(child: Text('QR Code Placeholder')),
      );
    }
  }
}
