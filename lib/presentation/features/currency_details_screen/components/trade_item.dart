import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tplatfom/components/custom_icon.dart';
import 'package:tplatfom/models/trade.dart';
import 'package:tplatfom/utils/global_variables.dart';

class TradeItem extends StatelessWidget {
  final String currencyCode;
  final Trade trade;

  const TradeItem({
    Key? key,
    required this.currencyCode,
    required this.trade,
  }) : super(key: key);

  Widget title() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          trade.tradeDirection == TradeDirection.buy ? 'Buy' : 'Sell',
          style: const TextStyle(fontSize: 20),
        ),
        Text(
          trade.dateFormatted,
          style: const TextStyle(
            fontSize: 16,
            color: kSecondaryTextColor,
          ),
        ),
      ],
    );
  }

  Widget amount() {
    return Text(
      '${trade.amountString} $currencyCode',
      style: TextStyle(
        fontSize: 16,
        color: trade.tradeDirection == TradeDirection.buy
            ? const Color(0xFF40FF99)
            : const Color(0xFFFF5B5B),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 74,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: kPrimaryColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            CustomIcon(
              icon: Icon(
                trade.tradeDirection == TradeDirection.buy
                    ? FontAwesomeIcons.arrowTrendUp
                    : FontAwesomeIcons.arrowTrendDown,
                size: 28,
              ),
            ),
            const SizedBox(width: 16),
            title(),
            const Spacer(),
            amount(),
          ],
        ),
      ),
    );
  }
}
