import 'package:flutter/material.dart';

class AvailableOptions extends StatefulWidget {
  final String size;
  const AvailableOptions({super.key, required this.size});

  @override
  State<AvailableOptions> createState() => _AvailableOptionsState();
}

// show the available options widget
class _AvailableOptionsState extends State<AvailableOptions> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: () {
      setState(() {
        isSelected = !isSelected;
      });
    },
    child: Container(
      margin: const EdgeInsets.only(right: 16),
      width: widget.size.length * 10, 
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isSelected? Colors.deepPurple: Colors.transparent,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.deepPurple)
      ),
      child: Text(
        widget.size,
        style: const TextStyle(fontWeight: FontWeight.bold)
      )
    ),
  );
}