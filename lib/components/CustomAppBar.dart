import 'package:fidelidade_android/constants.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final bool? automaticallyImplyLeading;
  bool isOnmodal;
  CustomAppBar(
      {Key? key,
      required this.title,
      this.automaticallyImplyLeading,
      this.isOnmodal = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return AppBar(
      toolbarHeight: 84,
      elevation: 0,
      automaticallyImplyLeading: automaticallyImplyLeading ?? false,
      shadowColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      flexibleSpace: Container(
        margin: isOnmodal
            ? const EdgeInsets.symmetric(vertical: 18)
            : EdgeInsets.zero,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 32.00),
              padding:
                  isOnmodal ? const EdgeInsets.only(left: 16) : EdgeInsets.zero,
              width: _size.width,
              decoration: const BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
              ),
              height: 52,
              child: Text(
                title,
                textAlign: isOnmodal ? TextAlign.start : TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 36),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  // Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  Size get preferredSize => const Size.fromHeight(84);
}
