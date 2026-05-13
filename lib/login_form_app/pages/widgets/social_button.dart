import 'package:fl_bloc/login_form_app/app_colors.dart';
import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final String? iconPath;
  final String? label;
  final double horizontalPadding;
  const SocialButton({
    super.key,
    this.iconPath,
    this.label,
    this.horizontalPadding = 100,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      icon: Icon(Icons.facebook),
      label: Text(
        label??'',
        style: const TextStyle(
          color: Pallete.whiteColor,
          fontSize: 17,
        ),
      ),
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: horizontalPadding),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Pallete.borderColor,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}