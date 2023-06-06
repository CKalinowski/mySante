import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpandableButton extends StatefulWidget {
  const ExpandableButton({
    Key? key,
    required this.buttonName,
    required this.categoryId,
  }) : super(key: key);
  final String buttonName;
  final String categoryId;

  @override
  _ExpandableButtonState createState() => _ExpandableButtonState();
}

class _ExpandableButtonState extends State<ExpandableButton> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_isExpanded ? 16.0 : 8.0),
            color: Colors.white,
            border: Border.all(color: const Color(0xff16679a)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: const Color(0xff16679a),
              backgroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(_isExpanded ? 16.0 : 8.0),
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.circle,
                  color: Color(0xff54cbc4),
                  size: 8.0,
                ),
                const SizedBox(width: 8.0),
                Text(
                  widget.buttonName,
                  style: GoogleFonts.lato(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (_isExpanded) ...[
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: Colors.white,
              border: Border.all(color: const Color(0xff16679a)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed imperdiet risus porttitor arcu dictum, in vehicula odio consectetur. Nulla dignissim congue faucibus. Pellentesque ultrices in massa sed egestas. Morbi sodales, neque vel auctor eleifend, enim risus elementum libero, quis elementum nulla lacus eget metus.',
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    color: const Color(0xff707070),
                  ),
                  textAlign: TextAlign.left,
                ),
                // Ajoutez ici le contenu associé à l'ID de la catégorie
              ],
            ),
          ),
        ],
      ],
    );
  }
}
