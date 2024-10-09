import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:talhadnad/model/market.dart';
import 'package:talhadnad/model/user_model.dart';
import 'package:talhadnad/theme/talhadnad_theme.dart';
import 'package:talhadnad/widgets/calendar.dart';
import 'package:provider/provider.dart';
import 'package:talhadnad/widgets/kmutt_map.dart';
import 'package:talhadnad/widgets/star_rating.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MarketDetailPage extends StatefulWidget {
  final String id;
  const MarketDetailPage({required this.id, Key? key}) : super(key: key);

  @override
  State<MarketDetailPage> createState() => _MarketDetailPageState();
}

class _MarketDetailPageState extends State<MarketDetailPage> {
  Market? market;
  bool isLoading = true;
  String? errorMessage;
  DateTime? selectedDate;
  late Map<String, String> selectedLocation;

  // Mock data for market locations
  final List<Map<String, String>> mockLocations = [
    {'name': 'KMUTT', 'latitude': '13.650329', 'longitude': '100.495503'},
    {'name': 'CentralWorld', 'latitude': '13.7470', 'longitude': '100.5392'},
    {'name': 'Chatuchak', 'latitude': '13.7999', 'longitude': '100.5502'},
  ];

  // Mock data for carousel images with Base64 encoded images
  final List<Map<String, String>> mockCarouselImages = [
    {
      "image": "", // Base64 string
    },
  ];

  @override
  void initState() {
    super.initState();
    loadMarketDetail();
  }

  Future<void> loadMarketDetail() async {
    try {
      final userModel = Provider.of<UserModel>(context, listen: false);
      final loadedMarket = await userModel.getMarketById(widget.id);
      setState(() {
        market = loadedMarket;
        isLoading = false;
        selectedLocation =
            mockLocations[DateTime.now().microsecond % mockLocations.length];
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
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (errorMessage != null || market == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Market Detail')),
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
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCarouselSlider(),
              const SizedBox(height: 16),
              _buildMarketInfo(),
              const SizedBox(height: 16),
              _buildMap(),
              const SizedBox(height: 16),
              const Divider(color: Colors.black, thickness: 2),
              const SizedBox(height: 16),
              _buildCalendar(),
              const SizedBox(height: 12),
              _buildViewButton(),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSize _buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(90),
      child: Column(
        children: [
          Container(
            height: 30,
            color: const Color(0xFF1A2B47),
          ),
          AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            automaticallyImplyLeading: false,
            title: const Text(
              'Market Detail',
              style: TextStyle(
                color: Color(0xFF1A2B47),
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Quicksand',
              ),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back,
                  color: Color(0xFF1A2B47), size: 32),
              onPressed: () => Navigator.of(context).pop(),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.more_vert,
                    color: Color(0xFF1A2B47), size: 32),
                onPressed: () {
                  // Add functionality for the menu button
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCarouselSlider() {
    // Handle empty list
    if (mockCarouselImages.isEmpty) {
      return Container(
        height: 180,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
          color: Colors.grey,
        ),
        child: Icon(Icons.image, size: 50, color: Colors.white),
      );
    }

    // Handle single image
    if (mockCarouselImages.length == 1) {
      return Container(
        height: 180,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
          color: Colors.grey,
        ),
        child: mockCarouselImages[0]["image"]?.isNotEmpty == true
            ? Image.memory(
                Base64Decoder().convert(mockCarouselImages[0]["image"]!),
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.error, size: 50, color: Colors.red);
                },
              )
            : Icon(Icons.image, size: 50, color: Colors.white),
      );
    }

    // Handle multiple images
    return CarouselSlider(
      options: CarouselOptions(
        height: 180,
        enlargeCenterPage: true,
        autoPlay: mockCarouselImages.length >
            2, // Only autoplay if more than 2 images
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
      items: mockCarouselImages.map((imageData) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: imageData["image"]?.isNotEmpty == true
                  ? Image.memory(
                      Base64Decoder().convert(imageData["image"]!),
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(Icons.error, size: 50, color: Colors.red);
                      },
                    )
                  : Icon(Icons.image, size: 50, color: Colors.white),
            );
          },
        );
      }).toList(),
    );
  }

  Widget _buildMarketInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          market!.name,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: mountainMeadow,
                fontSize: 24,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          market!.description,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 8),
        const StarRating(rating: 4, numRatings: 20),
        const SizedBox(height: 8),
        const Row(
          children: [
            Icon(Icons.phone),
            SizedBox(width: 8),
            Text("23123134"),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Icon(Icons.location_on),
            const SizedBox(width: 8),
            Expanded(child: Text(market!.address)),
          ],
        ),
      ],
    );
  }

  Widget _buildMap() {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: MapKmutt(
          latitude: double.parse(selectedLocation['latitude']!),
          longitude: double.parse(selectedLocation['longitude']!),
          title: selectedLocation['name']!,
        ),
      ),
    );
  }

  Widget _buildCalendar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: CalendarWidget(
            onDateSelected: _onDateSelected,
            marketCloseDates: [
              "2024-10-17",
              "2024-10-24",
              "2024-10-01",
              "2024-10-08",
            ], // Replace with actual market close dates
          ),
        ),
      ],
    );
  }

  Widget _buildViewButton() {
    return Center(
      child: ElevatedButton(
        onPressed: () => context.go('/market/${market!.id}/booking'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal,
          minimumSize: Size(MediaQuery.of(context).size.width * 0.4, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
        child: const Text(
          'VIEW',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
