import 'package:flutter/material.dart';

class TemplateCatagoriesTitle extends StatelessWidget {
  const TemplateCatagoriesTitle({
    super.key,
    required this.iconData,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });
  final String title;
  final IconData iconData;
  final bool isSelected;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.red : Colors.white,
                fontSize: isSelected ? 22 : 20,
              ),
            ),
          ),
          Icon(
            iconData,
            color: isSelected ? Colors.red : Colors.white,
            size: isSelected ? 28 : 26,
          ),
        ],
      ),
    );
  }
}
