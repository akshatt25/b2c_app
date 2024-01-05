import 'package:amazon_clone/constants/global_variable.dart';
import 'package:amazon_clone/features/home/screens/widgets/address_box.dart';
import 'package:amazon_clone/features/home/screens/widgets/carousel_image.dart';
import 'package:amazon_clone/features/home/screens/widgets/deal_of_day.dart';
import 'package:amazon_clone/features/home/screens/widgets/top_categories.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          titleSpacing: 2,
          flexibleSpace: Container(
            decoration: BoxDecoration(gradient: GlobalVariables.appBarGradient),
          ),
          title: Row(
            children: [
              Expanded(
                  child: Container(
                height: 42,
                margin: EdgeInsets.only(left: 15, top: 7, right: 2),
                child: Material(
                  borderRadius: BorderRadius.circular(8),
                  elevation: 1,
                  child: TextField(
                    textAlignVertical: TextAlignVertical.bottom,
                    decoration: InputDecoration(
                      prefixIcon: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.only(left: 6),
                          child: Icon(
                            Icons.search,
                            color: Color.fromARGB(230, 53, 53, 53),
                          ),
                        ),
                      ),
                      hintText: "Search Amazon.in",
                      hintStyle: TextStyle(fontWeight: FontWeight.w400),
                      filled: true,
                      fillColor: Colors.white,
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide.none),
                      enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide:
                              BorderSide(color: Colors.black, width: 0.2)),
                    ),
                  ),
                ),
              )),
              Container(
                color: Colors.transparent,
                height: 42,
                margin: EdgeInsets.only(left: 10, right: 15, top: 7),
                child: const Icon(Icons.mic),
              )
            ],
          ),
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            AddressBox(),
            SizedBox(
              height: 10,
            ),
            TopCategories(),
            CarouselImage(),
            SizedBox(
              height: 10,
            ),
            DealOfDay(),
          ],
        ),
      ),
    );
  }
}
