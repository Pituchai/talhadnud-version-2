import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:talhadnad/components/auth/register/registerbody.dart';
import 'package:talhadnad/src/screen/uploadslip_page.dart';
import 'package:talhadnad/theme/talhadnad_theme.dart';


class PaymentPage extends StatefulWidget {
  final String selectedSlot;
  final String selectedDate;

  const PaymentPage({
    Key? key,
    required this.selectedSlot,
    required this.selectedDate,
  }) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String _selectedPaymentMethod = 'PromptPay';
  final double _ticketPrice = 20.0;
  final double _taxRate = 0.18;

  @override
  Widget build(BuildContext context) {
    double taxAmount = _ticketPrice * _taxRate;
    double totalAmount = _ticketPrice + taxAmount;

    return Scaffold(
      backgroundColor: const Color(0xFFf0f1f3),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: oxfordBlue),
          onPressed: (){},
        ),
        title: const Text(
          'Payment',
          style: TextStyle(color: oxfordBlue, fontWeight: FontWeight.bold, fontFamily: 'Quicksand'),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Payment details',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildPaymentDetails(taxAmount, totalAmount),
              const SizedBox(height: 24),
              const Text(
                'Pay with',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildPaymentMethodDropdown(),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => UploadSlipPage(
                          selectedSlot: widget.selectedSlot,
                          selectedDate: widget.selectedDate,
                          totalAmount: totalAmount,
                          ticketPrice: _ticketPrice,
                          taxAmount: taxAmount,
                          paymentMethod: _selectedPaymentMethod,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Pay £${totalAmount.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentDetails(double taxAmount, double totalAmount) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildDetailRow('Tickets', '1x ${widget.selectedSlot}', '£${_ticketPrice.toStringAsFixed(2)}'),
            _buildDetailRow('Date', widget.selectedDate, ''),
            const Divider(height: 24),
            _buildDetailRow('Taxes & Fees', 'VAT (${(_taxRate * 100).toStringAsFixed(0)}%)', '£${taxAmount.toStringAsFixed(2)}'),
            const Divider(height: 24),
            _buildDetailRow('Total', '', '£${totalAmount.toStringAsFixed(2)}', isTotal: true),
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

  Widget _buildPaymentMethodDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedPaymentMethod,
          isExpanded: true,
          icon: const Icon(Icons.arrow_drop_down, color: oxfordBlue),
          style: const TextStyle(fontSize: 16, color: oxfordBlue),
          dropdownColor: Colors.white,
          onChanged: (String? newValue) {
            setState(() {
              _selectedPaymentMethod = newValue!;
            });
          },
          items: <String>[
            "PromptPay",
            "Credit Card",
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}