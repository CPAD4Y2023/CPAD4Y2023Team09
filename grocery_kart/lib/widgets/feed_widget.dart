import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:grocery_kart/services/utils.dart';
import 'package:grocery_kart/widgets/heart_widget.dart';
import 'package:grocery_kart/widgets/price_widget.dart';

class FeedWidget extends StatefulWidget {
  const FeedWidget({super.key});

  @override
  State<FeedWidget> createState() => _FeedWidgetState();
}

class _FeedWidgetState extends State<FeedWidget> {
  final _quantityController = TextEditingController();
  @override
  void initState() {
    _quantityController.text = '1';
    super.initState();
  }

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).screenSize;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Colors.black.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(12),
          child: Column(
            children: [
              Image.asset(
                'assets/images/categories/veg.png',
                width: size.width * 0.20,
                height: size.width * 0.20,
                fit: BoxFit.fill,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Title',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const HeartWidget(),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: PriceWidget(
                        isOffer: false,
                        price: 25,
                        offerPrice: 25,
                        textPrice: _quantityController.text,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                        child: Row(
                      children: [
                        Flexible(
                            child: TextFormField(
                              
                          controller: _quantityController,
                          key: const ValueKey('10'),
                          keyboardType: TextInputType.number,
                          maxLines: 1,
                          enabled: true,
                          onChanged: (value) {
                            setState(() {
                              
                            });
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                          ],
                        )),
                        SizedBox(
                          width: 5,
                        ),
                        FittedBox(
                          child: const Text(
                            'Kg',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Add to Cart',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
