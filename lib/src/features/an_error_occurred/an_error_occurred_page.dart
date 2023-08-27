import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lifleta/translations/locale_keys.g.dart';

class AnErrorOccurredPage extends StatelessWidget {
  const AnErrorOccurredPage({
    super.key,
     this.details = '',
  });

  final String details;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(tr(LocaleKeys.an_error_occurred)),
      ),
      body: Center(
        child: Text(details),
      ),
    );
  }
}
