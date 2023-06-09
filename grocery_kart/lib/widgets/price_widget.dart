import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget(
      {super.key,
      required this.offerPrice,
      required this.price,
      required this.textPrice,
      required this.isOffer});

  final double offerPrice, price;
  final String textPrice;
  final bool isOffer;

  @override
  Widget build(BuildContext context) {
    double userPrice = isOffer? offerPrice : price;
    return FittedBox(
      child: Row(
        children: [
          Text(
            'Rs.${(userPrice * int.parse(textPrice)).toStringAsFixed(2)}',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 5,
          ),
          Visibility(
            visible: isOffer,
            child: Text(
            'Rs.${(price * int.parse(textPrice)).toStringAsFixed(2)}',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.lineThrough),
          ),
          ),
        ],
      ),
    );
  }
}
