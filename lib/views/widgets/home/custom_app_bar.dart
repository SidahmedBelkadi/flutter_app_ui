import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.onNotificationIconPressed,
    this.onFavoritesIconPressed,
    this.disableFavoriteIcon = false,
    this.disableNotificationIcon = false,
    required this.onSearchChanged,
    required this.searchController,
    required this.isTyping,
    required this.onClearIconPressed,
  });

  final String title;
  final void Function()? onNotificationIconPressed;
  final void Function()? onFavoritesIconPressed;
  final void Function(String value)? onSearchChanged;
  final void Function()? onClearIconPressed;
  final TextEditingController searchController;
  final bool disableFavoriteIcon;
  final bool disableNotificationIcon;
  final bool isTyping;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                prefixIcon: isTyping != true
                    ? const Icon(Icons.search_outlined, size: 25)
                    : null,
                suffixIcon: isTyping == true
                    ? GestureDetector(
                        onTap: onClearIconPressed,
                        child: const Icon(Icons.clear, size: 22))
                    : null,
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
              controller: searchController,
              onChanged: onSearchChanged,
            ),
          ),
          disableNotificationIcon == true
              ? const SizedBox()
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
                        onPressed: onNotificationIconPressed,
                        icon: const Icon(Icons.notifications_active_outlined,
                            size: 30),
                      ),
                    ),
                  ],
                ),
          disableFavoriteIcon == true
              ? const SizedBox()
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
