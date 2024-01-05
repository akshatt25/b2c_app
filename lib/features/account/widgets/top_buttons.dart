import 'package:amazon_clone/features/account/widgets/account_button.dart';
import 'package:flutter/material.dart';

class TopButtons extends StatelessWidget {
  const TopButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Row(
            children: [
              AccountButton(text: 'Your Orders', onTap: () {}),
              AccountButton(text: 'Turn Seller', onTap: () {}),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              AccountButton(text: 'Your Wishlist', onTap: () {}),
              AccountButton(text: 'Log Out', onTap: () {}),
            ],
          ),
        ],
      ),
    );
  }
}
