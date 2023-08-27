
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lifleta/translations/locale_keys.g.dart';

class NoFoundPage extends StatelessWidget {
  const NoFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr(LocaleKeys.not_found_not_found)),
      ),
      body: Center(
        child: Column(
          children: [
            Text(tr(LocaleKeys.not_found_error)),
            TextButton(onPressed: () {}, child: Text(tr(LocaleKeys.not_found_go_to_home)))
          ],
        ),
      ),
    );
  }
}
