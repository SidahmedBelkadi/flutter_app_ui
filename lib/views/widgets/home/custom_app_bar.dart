import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.onNotificationIconPressed,
    required this.onSearchIconPressed,
    this.onFavoritesIconPressed,
    this.disableFavoriteIcon = false,
  });

  final String title;
  final void Function()? onNotificationIconPressed;
  final void Function()? onFavoritesIconPressed;
  final void Function()? onSearchIconPressed;
  final bool disableFavoriteIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: IconButton(
                  onPressed: onSearchIconPressed,
                  icon: const Icon(Icons.search_outlined, size: 25),
                ),
                hintText: title,
                hintStyle: const TextStyle(fontSize: 18),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12)),
            child: IconButton(
              onPressed: onNotificationIconPressed,
              icon: const Icon(Icons.notifications_active_outlined, size: 30),
            ),
          ),
          disableFavoriteIcon == true
              ? const Row()
              : Row(
                  children: [
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 4),
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(12)),
                      child: IconButton(
                        onPressed: onFavoritesIconPressed,
                        icon: const Icon(Icons.favorite_border_outlined,
                            size: 30),
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
