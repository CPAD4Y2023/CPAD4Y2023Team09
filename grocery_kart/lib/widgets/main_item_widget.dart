import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_kart/services/utils.dart';
import 'package:grocery_kart/widgets/heart_widget.dart';
import 'package:grocery_kart/widgets/price_widget.dart';

class MainItemWidget extends StatefulWidget {
  const MainItemWidget({super.key});

  @override
  State<MainItemWidget> createState() => _MainItemWidgetState();
}

class _MainItemWidgetState extends State<MainItemWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).screenSize;
    return Material(
      color: Colors.black.withOpacity(0.05),
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/categories/veg.png',
                    width: size.width * 0.22,
                    height: size.width * 0.22,
                    fit: BoxFit.fill,
                  ),
                  Column(children: [
                    const Text('1Kg', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                    const SizedBox(height: 6,),
                    Row(children: [
                      GestureDetector(
                        onTap: (){

                        },
                        child: const Icon(IconlyLight.bag2, size: 18,),
                      ),
                      const HeartWidget(),
                    ],),
                  ],),
                ],
              ),
              const PriceWidget(
                price: 30,
                offerPrice: 25,
                textPrice: '1',
                isOffer: true,
              ),
              const SizedBox(height: 5,),
              const Text('Product Title', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            ]),
          )),
    );
  }
}
