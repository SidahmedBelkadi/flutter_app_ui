import 'package:course/core/constants/app_colors.dart';
import 'package:course/data/models/product_model.dart';
import 'package:flutter/material.dart';

class PriceAndQuantitySelection extends StatelessWidget {
  const PriceAndQuantitySelection({
    super.key,
    required this.product,
    required this.onAddQuantityPressed,
    required this.onRemoveQuantityPressed,
    required this.count,
  });

  final ProductModel product;
  final int count;
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
              onPressed: onAddQuantityPressed,
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
              child: Text(
                '$count',
                style: const TextStyle(fontSize: 14),
              ),
            ),
            IconButton(
              onPressed: onRemoveQuantityPressed,
              icon: const Icon(Icons.remove),
            ),
          ],
        ),
        Text(
          "${product.discountPrice!} \$",
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
