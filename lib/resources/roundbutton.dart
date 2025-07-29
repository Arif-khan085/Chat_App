import 'package:chat_app/resources/colors/app_colors.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color color;
  final Color textColor;

  const RoundButton({
    super.key,
    required this.title,
    required this.color,
    required this.textColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Container(
          width: double.infinity, // You can set fixed width like 300 if needed
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: color,
          ),
          child: Center(
            child: Text(title,style: TextStyle(color: AppColors.background,fontSize: 20)),
          ),
      ),
      ),
    );
  }
}
