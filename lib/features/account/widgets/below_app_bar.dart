import 'package:amazon_clone/constants/global_variable.dart';
import 'package:amazon_clone/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BelowAppBar extends StatelessWidget {
  const BelowAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final userName = Provider.of<UserProvider>(context)
            .user
            .name
            .substring(0, 1)
            .toUpperCase() +
        Provider.of<UserProvider>(context).user.name.substring(1);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40,
      padding: EdgeInsets.only(left: 15, top: 5),
      decoration: const BoxDecoration(gradient: GlobalVariables.appBarGradient),
      child: RichText(
        text: TextSpan(
            text: 'Hello, ',
            style: TextStyle(
                color: Colors.black, fontSize: 23, fontWeight: FontWeight.w400),
            children: [
              TextSpan(
                text: userName,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 23,
                    fontWeight: FontWeight.w500),
              )
            ]),
      ),
    );
  }
}
