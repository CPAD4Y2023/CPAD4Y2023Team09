import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:grocery_kart/services/utils.dart';
import 'package:grocery_kart/widgets/heart_widget.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({super.key});

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  final _quantityTextController = TextEditingController();
  @override
  void initState() {
    _quantityTextController.text = '1';
    super.initState();
  }

  @override
  void dispose() {
    _quantityTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).screenSize;
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.025), borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    Container(
                      width: size.width * 0.25,
                      height: size.width * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Image.asset(
                        'assets/images/categories/veg.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Title',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          width: size.width * 0.33,
                          child: Row(
                            children: [
                              _quantityControl(
                                  fct: () {},
                                  icon: CupertinoIcons.minus,
                                  color: Colors.red.shade500),
                              Flexible(
                                flex: 1,
                                child: TextField(
                                  controller: _quantityTextController,
                                  keyboardType: TextInputType.number,
                                  maxLines: 1,
                                  decoration: const InputDecoration(
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide())),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp('[0-9]')),
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      if (value.isEmpty) {
                                        _quantityTextController.text = '1';
                                      } else {
                                        return;
                                      }
                                    });
                                  },
                                ),
                              ),
                              _quantityControl(
                                  fct: () {},
                                  icon: CupertinoIcons.plus,
                                  color: Colors.green.shade500),
                            ],
                          ),
                        )
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              
                            },
                            child: Icon(CupertinoIcons.cart_badge_minus, color: Colors.red,),
                          ),
                          SizedBox(height: 5,),
                          HeartWidget(),
                          const Text(
                          'Rs.30',
                          style: TextStyle(
                              fontSize: 18,),
                              maxLines: 1,
                        ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _quantityControl(
      {required Function fct, required IconData icon, required Color color}) {
    return Flexible(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Material(
          color: color,
          borderRadius: BorderRadius.circular(12),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              fct();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(icon),
            ),
          ),
        ),
      ),
    );
  }
}
