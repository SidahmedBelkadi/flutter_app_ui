import 'package:course/core/constants/app_colors.dart';
import 'package:course/core/constants/app_images.dart';
import 'package:course/core/functions/alert_logout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                color: AppColors.primaryColor,
                height: Get.width / 2,
                width: double.infinity,
              ),
              Positioned(
                top: Get.width / 2.7,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: AppColors.secondaryColor,
                    backgroundImage: const AssetImage(AppImage.avatar),
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              surfaceTintColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              child: Column(
                children: [
                  ListTile(
                    title: const Text("Disable notifications"),
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                  const Divider(),
                  const ListTile(
                    title: Text("Address"),
                    trailing: Icon(Icons.location_city_outlined),
                  ),
                  const Divider(),
                  const ListTile(
                    title: Text("About us"),
                    trailing: Icon(Icons.help_center_outlined),
                  ),
                  const Divider(),
                  const ListTile(
                    title: Text("Contact Us"),
                    trailing: Icon(Icons.phone_callback_outlined),
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text("Logout"),
                    trailing: GestureDetector(
                      onTap: () => alertDoYouWantToLogout(),
                      child: const Icon(Icons.logout),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(flex: 3),
        ],
      ),
    );
  }
}
