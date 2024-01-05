import 'dart:io';

import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:amazon_clone/common/widgets/custom_textfield.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../constants/global_variable.dart';

class AddProductScreen extends StatefulWidget {
  static const String routeName = '/add-product';
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  TextEditingController productNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  String category = 'Mobiles';
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    productNameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    quantityController.dispose();
  }

  List<File> images = [];

  List<String> productCategories = [
    'Mobiles',
    'Essentials',
    'Appliances',
    'Books',
    'Fashion',
  ];

  void selectImages() async {
    var res = await pickImages();
    setState(() {
      images = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: GlobalVariables.appBarGradient,
              ),
            ),
            centerTitle: true,
            title: const Text(
              'Add Product',
              style: TextStyle(color: Colors.black),
            )),
      ),
      body: SingleChildScrollView(
          child: Form(
              child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            images.isNotEmpty
                ? CarouselSlider(
                    items: images.map((i) {
                      return Builder(
                        builder: (BuildContext context) => Image.file(
                          i,
                          fit: BoxFit.cover,
                          height: 200,
                        ),
                      );
                    }).toList(),
                    options: CarouselOptions(viewportFraction: 1, height: 200),
                  )
                : GestureDetector(
                    onTap: selectImages,
                    child: DottedBorder(
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(10),
                      dashPattern: const [10, 4],
                      strokeCap: StrokeCap.round,
                      child: Container(
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.folder_open_outlined,
                              size: 40,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text('Select Product Images',
                                style: TextStyle(
                                  color: Colors.grey.shade400,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
                controller: productNameController, hintText: 'Product Name'),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
                maxLines: 7,
                controller: descriptionController,
                hintText: 'Description'),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(controller: priceController, hintText: 'Price'),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
                controller: productNameController, hintText: 'Quantity'),
            Container(
              margin: EdgeInsets.only(top: 5, left: 5, bottom: 10),
              width: double.infinity,
              child: DropdownButton(
                value: category,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: productCategories.map((String item) {
                  return DropdownMenuItem(value: item, child: Text(item));
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    category = newValue!;
                  });
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CustomButton(text: 'Sell', onTap: () {}),
          ],
        ),
      ))),
    );
  }
}
