// market_detail_page.dart

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:talhadnad/model/market.dart';
import 'package:talhadnad/model/user_model.dart';
import 'package:talhadnad/theme/talhadnad_theme.dart';
import 'package:talhadnad/widgets/calendar.dart';
import 'package:provider/provider.dart';
import 'package:talhadnad/widgets/star_rating.dart';

class MarketDetailPage extends StatefulWidget {
  final String id;
  const MarketDetailPage({required this.id, super.key});

  @override
  State<MarketDetailPage> createState() => _MarketDetailPageState();
}

class _MarketDetailPageState extends State<MarketDetailPage> {
  Market? market;
  bool isLoading = true;
  String? errorMessage;
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    loadMarketDetail();
  }

  Future<void> loadMarketDetail() async {
    try {
      final userModel = Provider.of<UserModel>(context, listen: false);
      market = await userModel.getMarketById(widget.id);
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
        isLoading = false;
      });
    }
  }

  void _onDateSelected(DateTime date) {
    setState(() {
      selectedDate = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (errorMessage != null || market == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Market Detail'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Error: $errorMessage'),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: loadMarketDetail,
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90), // Adjust total height as needed
        child: Column(
          children: [
            Container(
              height: 30, // Height of the top navy bar
              color: Color(0xFF1A2B47), // Dark blue color, adjust as needed
            ),
            AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              automaticallyImplyLeading: false,
              title: Text(
                'Market Detail',
                style: TextStyle(
                  color: Color(0xFF1A2B47), // Dark blue color for text
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Quicksand',
                ),
              ),
              leading: IconButton(
                icon:
                    Icon(Icons.arrow_back, color: Color(0xFF1A2B47), size: 32),
                onPressed: () => Navigator.of(context).pop(),
              ),
              actions: [
                IconButton(
                  icon:
                      Icon(Icons.more_vert, color: Color(0xFF1A2B47), size: 32),
                  onPressed: () {
                    // Add functionality for the menu button
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
        
          // Main Content Scroll
          Padding(
            padding: const EdgeInsets.only(
                top: 113.0), // Padding based on header height
            child: SingleChildScrollView(
              child: Container(
                color: Colors.white, // Main content background
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Carousel Slider
                      // CarouselSlider(
                      //   options: CarouselOptions(
                      //     height: 200,
                      //     autoPlay: true,
                      //     enlargeCenterPage: true,
                      //     viewportFraction: 1.0,
                      //     aspectRatio: 16 / 9,
                      //     autoPlayInterval: const Duration(seconds: 3),
                      //   ),
                      //   items: market?.image
                      //       .map((image) => Image.network(
                      //             image,
                      //             fit: BoxFit.cover,
                      //           ))
                      //       .toList(),
                      // ),

                      // Market Information
                      Container(
                        color: Colors
                            .white, // White background for the grouped container
                        padding:
                            const EdgeInsets.all(16.0), // Padding for spacing
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Market Name
                            Text(
                              market!.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(
                                    color:
                                        mountainMeadow, // Ensure mountainMeadow is defined
                                    fontSize: 24,
                                  ),
                            ),
                            const SizedBox(height: 8),
                            // Market Description
                            Text(
                              market!.description,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(height: 8),
                            // Ratings
                            const Row(
                              children: [
                                StarRating(
                                  rating: 4,
                                  numRatings: 20,
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            // Phone
                            const Row(
                              children: [
                                Icon(Icons.phone),
                                SizedBox(width: 8),
                                Text(
                                    "23123134"), // Replace with actual phone number
                              ],
                            ),
                            const SizedBox(height: 8),
                            // Address
                            Row(
                              children: [
                                const Icon(Icons.location_on),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(market!.address),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            // Map Placeholder
                            Container(
                              height: 150,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey[300]!),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Stack(
                                  children: [
                                    Container(
                                      color: Colors.grey[200],
                                    ),
                                    const Center(
                                      child: Icon(
                                        Icons.map,
                                        size: 50,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 8,
                                      right: 8,
                                      child: Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(2),
                                        ),
                                        child: const Text(
                                          'Google',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            // Divider
                            const Divider(
                              color: Colors.black,
                              thickness: 2,
                            ),
                            const SizedBox(height: 16),
                            // Calendar Widget
                            Text(
                              'KMUTT Market Opener',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(fontFamily: 'Quicksand'),
                            ),
                            const SizedBox(height: 8),
                            Container(
                                decoration: BoxDecoration(
                                  color: Colors
                                      .white, // White background for the calendar
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: CalendarWidget(
                                  onDateSelected: (date) {
                                    // Handle date selection
                                    print("Selected date: $date");
                                  },
                                  marketCloseDates: marketCloseDates,
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigate to the BookingPage for creating a new booking
                            context.go('/market/${market!.id}/booking');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                            minimumSize: Size(
                                MediaQuery.of(context).size.width * 0.4, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  8), // Adjust this value to change the corner roundness
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                          ),
                          child: const Text(
                            'VIEW',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
