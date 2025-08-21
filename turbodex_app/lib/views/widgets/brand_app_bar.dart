import 'package:flutter/material.dart';

class TurboAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? greetingRight; // ex: "Salut, test"
  final double height;

  const TurboAppBar({super.key, this.greetingRight, this.height = 72});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            const Icon(Icons.directions_car, color: Colors.white),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('TurboDex',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                      letterSpacing: 0.3,
                    )),
                Text("Gotta catch 'em all!",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    )),
              ],
            ),
            const Spacer(),
            if (greetingRight != null)
              Text(greetingRight!,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}
