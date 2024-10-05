import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:talhadnad/theme/talhadnad_theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: oxfordBlue, // Dark blue background
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context), // Pass context to handle the "pop to home"
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: _buildProfileContent(
                    context), // Updated to handle navigation
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              context.go('/'); // Navigate back to home
            },
          ),
          const Text(
            'Profile',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.white),
            onPressed: () {/* TODO: Implement notification */},
          ),
        ],
      ),
    );
  }

  Widget _buildProfileContent(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const CircleAvatar(
          radius: 50,
          backgroundImage:
              NetworkImage('https://example.com/profile_image.jpg'),
        ),
        const SizedBox(height: 20),
        const Text(
          'Kayal Vishi',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        const Text(
          '+1 6282 283 8324',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 30),
        _buildProfileMenuItem(Icons.bookmark, 'My Bookings', context),
        _buildProfileMenuItem(Icons.account_balance_wallet, 'Wallet', context),
        _buildProfileMenuItem(Icons.card_giftcard, 'Refer & Earn', context),
        _buildProfileMenuItem(Icons.help_outline, 'Help & Support', context),
        _buildProfileMenuItem(Icons.info_outline, 'About Us', context),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildProfileMenuItem(
      IconData icon, String title, BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF1E2F4D)),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {},
    );
  }
}
