import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:talhadnad/theme/talhadnad_theme.dart';

class UploadSlipPage extends StatefulWidget {
  final String selectedSlot;
  final String selectedDate;
  final double totalAmount;
  final double ticketPrice;
  final double taxAmount;
  final String paymentMethod;

  const UploadSlipPage({
    Key? key,
    required this.selectedSlot,
    required this.selectedDate,
    required this.totalAmount,
    required this.ticketPrice,
    required this.taxAmount,
    required this.paymentMethod,
  }) : super(key: key);

  @override
  _UploadSlipPageState createState() => _UploadSlipPageState();
}

class _UploadSlipPageState extends State<UploadSlipPage> {
  File? _image;
  final picker = ImagePicker();
  String? transactionRef;
  String? sendingBankCode;

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final appDir = await getApplicationDocumentsDirectory();
      final fileName = path.basename(pickedFile.path);
      final savedImage = await File(pickedFile.path).copy('${appDir.path}/$fileName');

      setState(() {
        _image = savedImage;
      });

      // Simulate scanning process
      await Future.delayed(Duration(seconds: 2));
      scanSlip();
    }
  }

  void scanSlip() {
    // Simulate extracting information from the slip
    setState(() {
      transactionRef = 'REF${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}';
      sendingBankCode = 'BANK${(1000 + DateTime.now().second).toString()}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf0f1f3),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: oxfordBlue),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Upload Payment Slip',
          style: TextStyle(color: oxfordBlue, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPaymentDetails(),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: getImage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text('Upload Slip'),
              ),
              SizedBox(height: 16),
              if (_image != null) ...[
                Image.file(_image!),
                SizedBox(height: 16),
                if (transactionRef != null && sendingBankCode != null) ...[
                  Text('Transaction Reference: $transactionRef'),
                  Text('Sending Bank Code: $sendingBankCode'),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // TODO: Implement confirmation logic
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Payment confirmed')),
                      );
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text('Confirm Payment'),
                  ),
                ] else
                  CircularProgressIndicator(),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentDetails() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Payment Details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: oxfordBlue),
            ),
            SizedBox(height: 16),
            _buildDetailRow('Tickets', '1x ${widget.selectedSlot}', '£${widget.ticketPrice.toStringAsFixed(2)}'),
            _buildDetailRow('Date', widget.selectedDate, ''),
            Divider(height: 24),
            _buildDetailRow('Taxes & Fees', 'VAT', '£${widget.taxAmount.toStringAsFixed(2)}'),
            Divider(height: 24),
            _buildDetailRow('Total', '', '£${widget.totalAmount.toStringAsFixed(2)}', isTotal: true),
            SizedBox(height: 16),
            _buildDetailRow('Payment Method', widget.paymentMethod, ''),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String title, String subtitle, String amount, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: isTotal ? FontWeight.bold : FontWeight.w500,
                  fontSize: isTotal ? 18 : 16,
                  color: oxfordBlue,
                ),
              ),
              if (subtitle.isNotEmpty)
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
            ],
          ),
        ),
        Text(
          amount,
          style: TextStyle(
            fontWeight: isTotal ? FontWeight.bold : FontWeight.w500,
            fontSize: isTotal ? 18 : 16,
            color: oxfordBlue,
          ),
        ),
      ],
    );
  }
}