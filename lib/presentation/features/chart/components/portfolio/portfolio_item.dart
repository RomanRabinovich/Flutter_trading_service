import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tplatfom/components/chart.dart';
import 'package:tplatfom/components/custom_icon.dart';
import 'package:tplatfom/models/currency.dart';
import 'package:tplatfom/presentation/features/chart/components/currency_title.dart';
import 'package:tplatfom/presentation/features/currency_details_screen/currency_details_screen.dart';
import 'package:tplatfom/utils/global_variables.dart';

class PortfolioItem extends StatelessWidget {
  final Currency currency;

  const PortfolioItem({
    Key? key,
    required this.currency,
  }) : super(key: key);

  Widget currentAmount() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              currency.usdAmountString,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 2),
            Text(
              '${currency.currentAmount} ${currency.code}',
              style: const TextStyle(
                color: kSecondaryTextColor,
              ),
            ),
          ],
        ),
        const Spacer(),
        Icon(
          currency.profit >= 0
              ? FontAwesomeIcons.caretUp
              : FontAwesomeIcons.caretDown,
          size: 16,
        ),
        const SizedBox(width: 2),
        Text(currency.profitString),
      ],
    );
  }

  Widget portfolioChart() {
    final minPrice = currency.priceHistory.reduce(math.min);
    final maxPrice = currency.priceHistory.reduce(math.max);

    return Chart(
      data: currency.priceHistory,
      minData: minPrice,
      maxData: maxPrice,
      minY: 0.94 * minPrice,
      paddingTop: 72,
      thickness: 2,
      gradientColors: [
        kSecondaryColor,
        kSecondaryColor.withOpacity(0),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(28),
      child: Container(
        width: 210,
        height: 160,
        color: kPrimaryColor,
        child: Stack(
          children: [
            portfolioChart(),
            Positioned(
              left: 20,
              top: 20,
              child: Row(
                children: [
                  CustomIcon(icon: currency.icon),
                  const SizedBox(width: 16),
                  CurrencyTitle(
                    code: currency.code,
                    name: currency.name,
                  ),
                ],
              ),
            ),
            Positioned(
              left: 20,
              right: 20,
              bottom: 20,
              child: currentAmount(),
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => CurrencyDetailsScreen(currency: currency),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
