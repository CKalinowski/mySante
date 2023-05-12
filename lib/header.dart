import 'package:flutter/material.dart';

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
  bool _isEnglish = false;

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
            top: statusBarHeight,
            right: 16,
            child: Row(
              children: [
                Text(
                  _isEnglish ? 'EN' : 'FR',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(width: 8),
                Switch(
                  value: _isEnglish,
                  onChanged: (value) {
                    setState(() {
                      _isEnglish = value;
                      print(
                          'Langue sélectionnée : ${_isEnglish ? "EN" : "FR"}');
                      // Ajouter le code de changement de langue ici
                    });
                  },
                  activeColor: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
