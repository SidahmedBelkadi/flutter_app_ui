import 'package:cached_network_image/cached_network_image.dart';
import 'package:course/controllers/favorites_screen_controller.dart';
import 'package:course/core/constants/app_colors.dart';
import 'package:course/core/constants/app_link.dart';
import 'package:course/data/models/Favorites_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomFavoriteGridItem extends GetView<FavoritesScreenController> {
  const CustomFavoriteGridItem({
    super.key,
    required this.favorite,
  });

  final FavoritesModel favorite;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(width: 0.1, color: Colors.grey),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: "${favorite.image}",
              child: CachedNetworkImage(
                imageUrl: "${AppLink.staticProductsImages}/${favorite.image}",
                height: 100,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              favorite.name!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              favorite.description!,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Rating : "),
                ...List.generate(
                  5,
                  (index) => const Icon(
                    Icons.star,
                    size: 16,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${favorite.price} \$",
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                GestureDetector(
                  onTap: () => controller.deleteFromFavoritesList(
                      id: favorite.favoriteId!),
                  child: const Icon(
                    Icons.delete,
                    color: Color.fromARGB(255, 208, 23, 10),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
