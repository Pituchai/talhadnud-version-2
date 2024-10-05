import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talhadnad/model/market.dart';
import 'package:talhadnad/model/user_model.dart';
import 'package:talhadnad/theme/talhadnad_theme.dart';

class MarketLabel extends StatefulWidget {
  const MarketLabel({super.key});

  @override
  State<MarketLabel> createState() => _MarketLabelState();
}

class _MarketLabelState extends State<MarketLabel> {
  bool isLoading = true;
  String errorMessage = '';
  Market? market;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Kmutt Market', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: 10),
        const Padding(
          padding: EdgeInsets.only(top: 12, left: 16, right: 16, bottom: 23),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '6:00 AM',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Text(
                    '31 March',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
              Icon(Icons.calendar_today, color: Colors.white),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '11:59 PM',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Text(
                    '31 March',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
