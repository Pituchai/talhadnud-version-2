import 'package:flutter/material.dart';
import 'package:talhadnad/theme/talhadnad_theme.dart';
import 'package:talhadnad/widgets/market_card.dart';
import 'package:talhadnad/widgets/taladnud_label.dart';

class MainContent extends StatelessWidget {
  const MainContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: Column(
            children: [
              Expanded(
                flex: 9,
                child: Container(
                  color: oxfordBlue,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Spacer(flex: 2),
                      TaladnudLabel(),
                      Spacer(flex: 3),
                    ],
                  ),
                ),
              ),
              const Spacer(flex: 3),
            ],
          ),
        ),
        Expanded(
          flex: 9,
          child: Container(
            color: Colors.white,
            child: RefreshIndicator(
              onRefresh: () async {},
              child: const CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: SizedBox(height: 90),
                  ),
                  SliverToBoxAdapter(
                    child: MarketCard(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
