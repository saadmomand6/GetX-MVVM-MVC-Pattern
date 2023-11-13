import 'package:flutter/material.dart';

class RoundButton extends StatefulWidget {
  final bool loading;
  final String title;
  final double height, width;
  final VoidCallback onpress;
  final Color textColor, buttonColor;

  const RoundButton({required this.title, this.loading = false,required this.height,required this.width,required this.onpress, required this.textColor,required this.buttonColor, super.key});

  @override
  State<RoundButton> createState() => _RoundButtonState();
}

class _RoundButtonState extends State<RoundButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onpress,
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: widget.buttonColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: widget.loading ? const Center(child: CircularProgressIndicator()) :  Center(child: Text(widget.title)),
      ),
    );
  }
}
