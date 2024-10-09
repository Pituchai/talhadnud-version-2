import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:talhadnad/theme/talhadnad_theme.dart';
import '../../widgets/BottomNavBar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Blue header section
          Container(
            color: oxfordBlue,
            child: SafeArea(
              bottom: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: Text(
                        'Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.grey[300],
                          child: Icon(Icons.person, size: 40, color: Colors.grey[600]),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Pituchai Mitpakdee',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '+66 98 123 5786',
                                style: TextStyle(color: Colors.white70),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // White background for menu items
          Expanded(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 20),
                child: ListView(
                  children: [
                    _buildMenuItem(
                      'Booking History',
                      Icons.calendar_today,
                      () => context.push('/booking-history'),
                    ),
                    _buildMenuItem(
                      'Wallet',
                      Icons.account_balance_wallet,
                      () => context.push('/wallet'),
                    ),
                    _buildMenuItem(
                      'Refer & Earn',
                      Icons.card_giftcard,
                      () => context.push('/refer-earn'),
                    ),
                    _buildMenuItem(
                      'Offers',
                      Icons.local_offer,
                      () => context.push('/offers'),
                    ),
                    _buildMenuItem(
                      "FAQ's & Support",
                      Icons.help_outline,
                      () => context.push('/faq-support'),
                    ),
                    _buildMenuItem(
                      'About Us',
                      Icons.info_outline,
                      () => context.push('/about-us'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 3),
    );
  }

  Widget _buildMenuItem(String title, IconData icon, VoidCallback onTap) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: oxfordBlue),
          title: Text(
            title,
            style: TextStyle(
              fontFamily: 'Quicksand',
              fontSize: 16,
              color: oxfordBlue,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: Icon(Icons.chevron_right, color: oxfordBlue),
          onTap: onTap,
        ),
        Divider(height: 1, color: oxfordBlue.withOpacity(0.2)),
      ],
    );
  }
}