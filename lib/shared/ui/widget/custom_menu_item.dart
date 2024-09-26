import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomMenuItem extends StatefulWidget {
  final String text;
  final Function onPressed;
  const CustomMenuItem(
      {super.key, required this.text, required this.onPressed});
  @override
  State<CustomMenuItem> createState() => _CustomMenuItemState();
}

class _CustomMenuItemState extends State<CustomMenuItem> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHover = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHover = false;
        });
      },
      child: GestureDetector(
        onTap: () => widget.onPressed(),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 150,
          height: 50,
          decoration: BoxDecoration(
            color: isHover ? Colors.pinkAccent : Colors.black,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              widget.text,
              style: GoogleFonts.roboto(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
