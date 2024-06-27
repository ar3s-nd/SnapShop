import 'package:flutter/material.dart';

class ColourCircle extends StatefulWidget {
  final Color? color;
  const ColourCircle({super.key, required this.color});

  @override
  State<ColourCircle> createState() => _ColourCircleState();
}

// show the colour selector circle for the product
class _ColourCircleState extends State<ColourCircle> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: () {
      setState(() {
        isSelected = !isSelected;
      });
    },
    child: Container(
      margin: const EdgeInsets.only(right: 8),
      width: 34,
      height: 34,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(
          color:isSelected? Colors.deepPurple: Colors.black,
          width: isSelected? 3: 0.25,  
        )
      ),
      child:  CircleAvatar(
        radius: 16,
        backgroundColor: widget.color,
      ),
    ),
  );
}