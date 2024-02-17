import 'package:course/core/constants/app_colors.dart';
import 'package:flutter/widgets.dart';

class CustomAuthHeaderText extends StatelessWidget {
  final String title;
  final String bodyText;
  const CustomAuthHeaderText(
      {super.key, required this.title, required this.bodyText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          Text(
            bodyText,
            style:
                TextStyle(color: AppColors.grey, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
