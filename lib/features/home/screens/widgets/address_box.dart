import 'package:amazon_clone/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressBox extends StatelessWidget {
  const AddressBox({super.key});

  @override
  Widget build(BuildContext context) {
    final userName = Provider.of<UserProvider>(context)
            .user
            .name
            .substring(0, 1)
            .toUpperCase() +
        Provider.of<UserProvider>(context).user.name.substring(1);
    final userAddress = Provider.of<UserProvider>(context).user.address;
    return Container(
      height: 40,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 114, 226, 221),
            Color.fromARGB(255, 162, 236, 233),
          ],
          stops: [0.5, 1.0],
        ),
      ),
      padding: EdgeInsets.only(left: 15),
      child: Row(
        children: [
          Icon(
            Icons.location_on_outlined,
            size: 20,
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(left: 7.5),
            child: Text(
              'Delivery to $userName - $userAddress',
              style: const TextStyle(
                  fontWeight: FontWeight.w500, overflow: TextOverflow.ellipsis),
            ),
          )),
          const Padding(
            padding: EdgeInsets.only(left: 5, top: 2, right: 7.5),
            child: Icon(
              Icons.arrow_drop_down,
              size: 18,
            ),
          )
        ],
      ),
    );
  }
}
