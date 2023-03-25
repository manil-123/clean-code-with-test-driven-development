import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  final IconData iconData;
  final String title;
  final Function()? navigateTo;
  const ProfileItem({
    super.key,
    required this.iconData,
    required this.title,
    required this.navigateTo,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: navigateTo,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(iconData),
            Center(
              child: Text(
                title,
                style: Theme.of(context).textTheme.headline4!,
              ),
            ),
            const Icon(
              Icons.chevron_right,
            ),
          ],
        ),
      ),
    );
  }
}
