import 'package:flutter/material.dart';
import 'package:herafy/core/theme/app_colors.dart';
import 'package:herafy/core/theme/app_text_styles.dart';

class BuildButtomTurnOnOffItem extends StatelessWidget {
  const BuildButtomTurnOnOffItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.buttom,
    this.backgroundIconColor,
    this.iconColor,
  });
  final String title;
  final IconData icon;
  final void Function() onTap;
  final Widget? buttom;
  final Color? backgroundIconColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            spacing: 10,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: backgroundIconColor ?? AppColors.primaryColor,
                child: Icon(icon, color: iconColor ?? Colors.white),
              ),
              Text(title, style: AppTextStyles.semiBold20Black),
              Spacer(),
              buttom != null
                  ? buttom!
                  : Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.primaryColor,
                    ),
            ],
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}

class ToggleButton extends StatefulWidget {
  final Function(bool) onChanged; // 👈 callback

  const ToggleButton({super.key, required this.onChanged});

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  bool isActive = false; // حالة الزرار

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isActive = !isActive; // تغيير الحالة
        });
        widget.onChanged(isActive); // 👈 رجّع القيمة
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 70,
        height: 35,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: isActive ? Colors.blue : Colors.grey[400],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Align(
          alignment: isActive ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 25,
            height: 25,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
