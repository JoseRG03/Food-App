import 'package:flutter/material.dart';

class ThemeButton extends StatelessWidget {
  ThemeButton({super.key, required this.changeTheme, });

  final Function changeTheme;

  @override
  Widget build(BuildContext context) {
    final isBright = Theme.of(context).brightness == Brightness.light;

    return IconButton(onPressed: () {
      changeTheme(isBright);
    }, icon: Icon(isBright
        ? Icons.light_mode_outlined
        : Icons.dark_mode_outlined)
    );
  }
}
