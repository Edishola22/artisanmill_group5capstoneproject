import 'package:artisanmill_group5capstoneproject/presentation/shared/app_logo.dart';
import 'package:artisanmill_group5capstoneproject/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class CompleteArtisanProfileScreen extends StatelessWidget {
  const CompleteArtisanProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppLogo(),
        backgroundColor: context.colors.background,
        centerTitle: true,
        elevation: 0,
      ),
    );
  }
}
