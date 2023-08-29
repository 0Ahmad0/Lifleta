import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../common_widgets/custom_text_filed.dart';
import '../../../../core/utils/values_manager.dart';

class TextFieldWithTitle extends StatelessWidget {
  const TextFieldWithTitle({
    super.key,
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(title),
        const SizedBox(
          height: AppSize.s10,
        ),
        child,

      ],
    );
  }
}
