import 'package:flutter/material.dart';

import 'main.dart';

class Header extends StatefulWidget implements PreferredSizeWidget {
  const Header({Key? key, this.backButton = false, required this.title})
      : super(key: key);
  final bool backButton;
  final String title;

  @override
  State<Header> createState() => _HeaderState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double appBarHeight = widget.preferredSize.height;

    return Container(
      height: appBarHeight + statusBarHeight,
      color: const Color(0xff16679a),
      child: Stack(
        children: [
          Center(
            child: Image.asset(
              'assets/images/logo.png',
              height: 200,
              width: 200,
            ),
          ),
          widget.backButton
              ? Positioned(
                  top: statusBarHeight,
                  left: 16,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                )
              : Container(),
          Positioned(
            top: 10,
            right: 16,
            child: Row(
              children: [
                Text(
                  'FR',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight:
                        !isEnglish ? FontWeight.w900 : FontWeight.normal,
                  ),
                ),
                Switch(
                  value: isEnglish,
                  onChanged: (value) {
                    setState(() {
                      isEnglish = value;
                      print('Langue sélectionnée : ${isEnglish ? "EN" : "FR"}');
                      // Ajouter le code de changement de langue ici
                    });
                  },
                  activeColor: Colors.white,
                ),
                Text(
                  'EN',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: isEnglish ? FontWeight.w900 : FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
