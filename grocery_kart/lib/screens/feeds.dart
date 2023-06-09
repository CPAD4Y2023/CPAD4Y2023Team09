import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_kart/services/utils.dart';
import 'package:grocery_kart/widgets/feed_widget.dart';

class FeedsScreen extends StatelessWidget {
  static const routeName = "/FeedsScreenState";
  const FeedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).screenSize;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            IconlyLight.arrowLeft2,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        title: const Text('Products'),
      ),
      body: Column(children: [
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          childAspectRatio: size.width/(size.height*0.59),
          children: List.generate(4, (index){
            return const FeedWidget();
          }),
        )
      ]),
    );
  }
}
