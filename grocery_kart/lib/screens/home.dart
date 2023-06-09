import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:grocery_kart/screens/feeds.dart';
import 'package:grocery_kart/services/global_method.dart';
import 'package:grocery_kart/services/utils.dart';
import 'package:grocery_kart/widgets/feed_widget.dart';
import 'package:grocery_kart/widgets/main_item_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> _swiperImages = [
    'assets/images/items/buy-on-laptop.jpg',
    'assets/images/items/buy-through.png',
    'assets/images/items/buyfood.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).screenSize;
    GlobalMethods globalMethods = GlobalMethods();
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
              children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: size.height * 0.25,
              child: Swiper(
                itemBuilder: (BuildContext context, index) {
                  return Image.asset(
                    _swiperImages[index],
                    fit: BoxFit.fill,
                  );
                },
                itemCount: _swiperImages.length,
                autoplay: true,
                pagination: SwiperPagination(
                  alignment: Alignment.bottomCenter,
                  builder: DotSwiperPaginationBuilder(
                      color: Colors.white, activeColor: Colors.amber.shade900),
                ),
                // control: SwiperControl(
                //   color: Colors.amber.shade900,
                // ),
              ),
            ),
          ),
          TextButton(
              onPressed: () {},
              child: const Text(
                'View All',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )),
          SizedBox(
            height: size.height * 0.18,
            child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return const MainItemWidget();
                }),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Products',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                TextButton(
                    onPressed: () {
                      globalMethods.navigateTo(
                          ctx: context, routeName: FeedsScreen.routeName);
                    },
                    child: const Text(
                      'Browse All',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          ),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            childAspectRatio: size.width / (size.height * 0.49),
            children: List.generate(4, (index) {
              return const FeedWidget();
            }),
          )
              ],
            ),
        ));
  }
}
