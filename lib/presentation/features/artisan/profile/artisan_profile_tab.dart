import 'package:artisanmill_group5capstoneproject/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class ArtisanProfileTab extends StatelessWidget {
  const ArtisanProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: context.textTheme.titleMedium,
        ),
        centerTitle: true,
      ),
    );
  }
}
