import 'package:amazon_clone/constants/global_variable.dart';
import 'package:amazon_clone/features/account/widgets/below_app_bar.dart';
import 'package:amazon_clone/features/account/widgets/orders.dart';
import 'package:amazon_clone/features/account/widgets/top_buttons.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          titleSpacing: 2,
          flexibleSpace: Container(
            decoration: BoxDecoration(gradient: GlobalVariables.appBarGradient),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 8, right: 0),
                    child: Image.asset(
                      'assets/images/amazon_logo.png',
                      height: 25,
                      color: Colors.black,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 0, left: 1),
                    child: Text('.in',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            wordSpacing: 0,
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.5)),
                  ),
                ],
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: Icon(
                      Icons.notifications_outlined,
                      size: 27,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.search_outlined,
                      size: 27,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          const BelowAppBar(),
          const SizedBox(
            height: 8,
          ),
          const TopButtons(),
          const SizedBox(
            height: 10,
          ),
          Orders(),
        ],
      ),
    );
  }
}
