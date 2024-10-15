import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onPressed;
  const CustomAppBar({
    this.onPressed,
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_rounded),
        onPressed:
            onPressed ?? (){},
      ),
      actions: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
          child: const Image(image: AssetImage('assets/notification.png')),
        )
      ],
    );
  }
}
