import 'package:flutter/material.dart';
import 'package:lcpl_academy/reusablewidgets/neomorphism_widget.dart';
import 'package:lcpl_academy/theme/theme.dart';

class ReusableButton extends StatelessWidget {
  const ReusableButton({super.key});

  @override
  Widget build(BuildContext context) {
    return NeomorphicWidget(
      child: Container(
        height: 50,
        width: 200,
        decoration: const BoxDecoration(
          color: AppTheme.blueColor,
        ),
      ),
    );
  }
}
