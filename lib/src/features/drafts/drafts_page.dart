import 'package:flutter/material.dart';
import 'package:lifleta/src/core/utils/color_manager.dart';
import 'package:lifleta/src/core/utils/values_manager.dart';
import 'package:lifleta/src/features/drafts/widgets/drafts_item.dart';
import 'package:lifleta/translations/locale_keys.g.dart';

class DraftsPage extends StatelessWidget {
  const DraftsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.home_drafts),
      ),
      body: ListView.separated(
        itemCount: 15,
        padding: const EdgeInsets.all(AppPadding.p12),
        itemBuilder: (_, index) => DraftItem(
            title: 'title', location: 'location'),
        separatorBuilder: (_,__)=>SizedBox(height: AppSize.s20,),
      ),
    );
  }
}
