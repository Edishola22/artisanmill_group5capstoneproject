import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    Key? key,
    required this.radius,
    required this.imagePath,
  }) : super(key: key);

  final double radius;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: AssetImage(imagePath),
      radius: radius,
    );
  }
}
