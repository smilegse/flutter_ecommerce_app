import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../widgets/product_card_widget.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        leading: const BackButton(
          color: greyColor,
        ),
      ),
      body: GridView.builder(
        itemCount: 50,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          return const ProductCardWidget();
        },
      ),
    );
  }
}
