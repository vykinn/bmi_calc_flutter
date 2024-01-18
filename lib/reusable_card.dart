import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard({super.key, required this.colour,required this.cardChild, this.onPress});
  final Color colour;
  final Widget cardChild;
  final Function() ? onPress;
  // void Function()
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: colour,
        ),
        height: 200.0,
        width: 170.0,
        margin: const EdgeInsets.all(15.0),
        child: cardChild,
      ),
    );
  }
}