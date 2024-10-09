import 'package:flutter/material.dart';
import 'package:talhadnad/src/screen/ticket.dart';
import 'package:talhadnad/theme/talhadnad_theme.dart';

class BookingHistoryPage extends StatelessWidget {
  const BookingHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Booking History',
          style: TextStyle(
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.bold,
              color: white),
        ),
        backgroundColor: oxfordBlue,
      ),
      backgroundColor: Colors.white70,
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: bookingHistory.length,
        itemBuilder: (context, index) {
          final booking = bookingHistory[index];
          return Card(
            margin: EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 8,
            shadowColor: Colors.black.withOpacity(0.5),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TicketPage(key: ValueKey(booking['Ref'])),
                  ),
                );
              },
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    // Market image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        booking['market_image'] ?? 'https://via.placeholder.com/60',
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 70,
                            height: 70,
                            color: Colors.grey[300],
                            child: Icon(Icons.image, color: Colors.grey[600]),
                          );
                        },
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            booking['Market Name'] ?? 'Unknown Market',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            booking['Book_Date'] ?? booking['Book-Date'] ?? 'No date',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Slot: ${booking['Slot'] ?? 'N/A'}',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          booking['Status'] ?? 'Unknown',
                          style: TextStyle(
                            color: _getStatusColor(booking['Status']),
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 4),
                        Icon(Icons.chevron_right, color: Colors.grey),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Color _getStatusColor(String? status) {
    switch (status?.toLowerCase()) {
      case 'confirm':
        return Colors.green;
      case 'pending':
        return Colors.orange;
      case 'cancelled':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}


// Sample booking history data
final List<Map<String, String>> bookingHistory = [
  {
    'Market Name': 'KMUTT-Market',
    'Name': 'Pituchai Mitpakdee',
    'Slot': 'A-1',
    'Book_Date': '04 Oct 2024',
    'Time': '06:00 A.M. - 20:00 P.M.',
    'Location':
        '126 Pracha Uthit Rd. Bang Mod Thung Khru Bangkok 10140 Thailand',
    'Type': 'Food-Product',
    'Price': '150 Baht',
    'Ref': 'kmutt04102024a1',
    'Status': 'Confirm',
    'market_image': '',
  },
  { 
    'Market Name': 'KMUTT-Market',
    'Name': 'Pituchai Mitpakdee',
    'Slot': 'C-7',
    'Book_Date': '12 Nov 2024',
    'Time': '08:00 A.M. - 18:00 P.M.',
    'Location': '587/10 Kamphaeng Phet 2 Rd, Chatuchak, Bangkok 10900',
    'Type': 'Food-Product',
    'Price': '200 Baht',
    'Ref': 'bwm12112024c7',
    'Status': 'Pending',
    'market_image': '',
  },
  {
    'Market Name': 'KMUTT-Market',
    'Name': 'Pituchai Mitpakdee',
    'Slot': 'B-3',
    'Book-Date': '05 Dec 2024',
    'Time': '17:00 P.M. - 24:00 A.M.',
    'Location': 'Siam Square, Pathum Wan, Bangkok 10330',
    'Type': 'Food-Product',
    'Price': '180 Baht',
    'Ref': 'snm05122024b3',
    'Status': 'Confirm',
    'market_image': '',
  },
  {
    'Market Name': 'KMUTT-Market',
    'Name': 'Pituchai Mitpakdee',
    'Slot': 'D-9',
    'Book-Date': '20 Jan 2025',
    'Time': '17:00 P.M. - 01:00 A.M.',
    'Location': 'Ratchadaphisek Rd, Chom Phon, Chatuchak, Bangkok 10900',
    'Type': 'Food-Product',
    'Price': '170 Baht',
    'Ref': 'trfr20012025d9',
    'Status': 'Cancelled',
    'market_image': '',
  },
  {
    'Market Name': 'KMUTT-Market',
    'Name': 'Pituchai Mitpakdee',
    'Slot': 'E-5',
    'Book-Date': '15 Feb 2025',
    'Time': '16:00 P.M. - 24:00 A.M.',
    'Location': 'On Nut Rd, Suan Luang, Bangkok 10250',
    'Type': 'Food-Product',
    'Price': '160 Baht',
    'Ref': 'onnm15022025e5',
    'Status': 'Confirm',
    'market_image': '',
  },
  {
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
    'Status': 'Confirm',
    'market_image': '',
  },
];
