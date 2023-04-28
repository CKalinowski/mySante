import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  final bool backButton;
  final String title;

  const Header({Key? key, this.backButton = false, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double appBarHeight = preferredSize.height;

    return Container(
      height: appBarHeight + statusBarHeight,
      color: const Color(0xff16679a),
      child: Stack(
        children: [
          Center(
            child: Image.asset(
              'assets/images/logo.png',
              height: 250,
              width: 250,
            ),
          ),
          backButton
              ? Positioned(
                  top: statusBarHeight,
                  left: 16,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
