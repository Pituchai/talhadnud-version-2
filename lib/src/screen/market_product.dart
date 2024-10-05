// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
// import 'package:talhadnad/model/user_model.dart';
// import 'package:talhadnad/src/screen/reservation_page.dart';
// import 'package:talhadnad/theme/talhadnad_theme.dart';

// class MarketProductPage extends StatefulWidget {
//   const MarketProductPage(
//       {super.key, required String id, required String type});

//   @override
//   State<MarketProductPage> createState() => _MarketProductPageState();
// }

// class _MarketProductPageState extends State<MarketProductPage> {
//   @override
//   void initState() {
//     super.initState();
//     loadMarketDetail();
//   }

//   Future<void> loadMarketDetail() async {
//     try {
//       final userModel = Provider.of<UserModel>(context, listen: false);
//       market = await userModel.getMarketById(widget.id);
//       setState(() {
//         isLoading = false;
//       });
//     } catch (e) {
//       setState(() {
//         errorMessage = e.toString();
//         isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: oxfordBlue,
//       appBar: AppBar(
//         backgroundColor: oxfordBlue,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.calendar_today, color: Colors.white),
//             onPressed: () {},
//           ),
//           IconButton(
//             icon: const Icon(Icons.more_vert, color: Colors.white),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Center(
//                   child: Text(
//                     'Kmutt Market',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Text('6:00 AM',
//                         style: TextStyle(color: Colors.white)),
//                     Expanded(
//                       child: Slider(
//                         value: 0.5,
//                         onChanged: (value) {},
//                         activeColor: Colors.white,
//                         inactiveColor: Colors.grey,
//                       ),
//                     ),
//                     const Text('11:59 PM',
//                         style: TextStyle(color: Colors.white)),
//                   ],
//                 ),
//                 const Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text('31 March', style: TextStyle(color: Colors.white)),
//                     Text('31 March', style: TextStyle(color: Colors.white)),
//                   ],
//                 ),
//                 const SizedBox(height: 16),
//                 _buildDateSelector(),
//               ],
//             ),
//           ),
//           Expanded(
//             child: Container(
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(20),
//                   topRight: Radius.circular(20),
//                 ),
//               ),
//               child: ListView(
//                 padding: const EdgeInsets.all(16),
//                 children: [
//                   //need to change later
//                   _buildCategorySection(context, 'Food', 'Street Foods',
//                       '/Users/pituchai/Downloads/talhadnad-app-main/assets/images/street_food.jpeg'),
//                   _buildCategorySection(context, 'Clothes', 'Clothes Shop',
//                       '/Users/pituchai/Downloads/talhadnad-app-main/assets/images/clothes_shop.jpg'),
//                   _buildCategorySection(context, 'Household', 'Flower Shop',
//                       '/Users/pituchai/Downloads/talhadnad-app-main/assets/images/flower_shop.jpg'),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildDateSelector() {
//     final now = DateTime.now();
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: List.generate(5, (index) {
//         final date = now.add(Duration(days: index - 2));
//         final isSelected = index == 2;
//         return Column(
//           children: [
//             Text(
//               DateFormat('MMM d').format(date),
//               style: TextStyle(
//                 color: isSelected ? Colors.white : Colors.grey,
//                 fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//               ),
//             ),
//             if (isSelected)
//               Container(
//                 margin: const EdgeInsets.only(top: 4),
//                 width: 20,
//                 height: 2,
//                 color: Colors.white,
//               ),
//           ],
//         );
//       }),
//     );
//   }

//   Widget _buildCategorySection(
//       BuildContext context, String category, String title, String imagePath) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           category,
//           style: const TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         const SizedBox(height: 8),
//         GestureDetector(
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => const ReservationPage(),
//               ),
//             );
//           },
//           child: Container(
//             height: 120,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               image: DecorationImage(
//                 image: AssetImage(imagePath),
//                 fit: BoxFit.cover,
//               ),
//             ),
//             child: Stack(
//               children: [
//                 Positioned(
//                   bottom: 8,
//                   left: 8,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         title,
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const Text(
//                         '126 Pracha Uthit Road, Bang Mot District,\nThung Khru District Bangkok',
//                         style: TextStyle(color: Colors.white, fontSize: 12),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         const SizedBox(height: 16),
//       ],
//     );
//   }
// }
