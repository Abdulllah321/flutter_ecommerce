import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';

class TSettingsMenuTile extends StatelessWidget {
  const TSettingsMenuTile(
      {super.key,
      required this.icon,
      this.trailing,
      required this.title,
      required this.subtitle, this.onTap});

  final IconData icon;
  final Widget? trailing;
  final String title;
  final String subtitle;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 20,
        color: TColors.primary,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!,
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.labelMedium!,
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
