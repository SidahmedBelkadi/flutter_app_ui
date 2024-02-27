import 'package:course/core/constants/app_colors.dart';
import 'package:course/data/models/product_model.dart';
import 'package:flutter/material.dart';

class PriceAndQuantitySelection extends StatelessWidget {
  const PriceAndQuantitySelection({
    super.key,
    required this.product,
    required this.onAddQuantityPressed,
    required this.onRemoveQuantityPressed,
  });

  final ProductModel product;
  final void Function()? onAddQuantityPressed;
  final void Function()? onRemoveQuantityPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
            ),
            Container(
              height: 40,
              width: 30,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(6),
              ),
              alignment: Alignment.center,
              child: const Text(
                '3',
                style: TextStyle(fontSize: 14),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.remove),
            ),
          ],
        ),
        Text(
          "${product.price!} \$",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColors.secondaryColor,
          ),
        ),
      ],
    );
  }
}
