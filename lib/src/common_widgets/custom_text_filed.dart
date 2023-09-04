import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lifleta/translations/locale_keys.g.dart';

import '../core/utils/assets_manager.dart';
import '../core/utils/color_manager.dart';
import '../core/utils/values_manager.dart';
class TextFiledApp extends StatefulWidget {
  TextFiledApp(
      {Key? key,
        this.textInputAction = TextInputAction.next,
        this.keyboardType = TextInputType.text,
        this.controller,
        this.iconData,
        this.hintText,
        this.obscureText = false,
        this.suffixIcon = false,
        this.validator,
        this.onChanged,
        this.onTap,
        this.autofocus = false,
        this.readOnly = false,
        this.maxline = 1,
        this.minline = 1})
      : super(key: key);

  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final IconData? iconData;
  final String? hintText;
  final bool suffixIcon;
  final bool autofocus;
  final bool readOnly;
  bool obscureText;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final VoidCallback? onTap;
  final int? maxline;
  final int? minline;

  @override
  State<TextFiledApp> createState() => _TextFiledAppState();
}

class _TextFiledAppState extends State<TextFiledApp> {
  void showPassword() {
    setState(() {
      widget.obscureText = !widget.obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: widget.maxline,
      minLines: widget.minline,
      readOnly: widget.readOnly,
      autofocus: widget.autofocus,
      validator: widget.validator ??
              (String? val) {
            if (val!.trim().isEmpty) return tr(LocaleKeys.text_filed_field_required);
            return null;
          },
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      controller: widget.controller,

      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: 12.sp,
              horizontal: 8.sp
        ),
        border:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r)
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r)
        ),

        filled: true,
        fillColor: ColorManager.white,
          // hintStyle: TextStyle(fontSize: 12.sp, color: ColorManager.hintColor),
          // prefixIcon: widget.iconData == null
          //     ? null
          //     : Icon(
          //   widget.iconData,
          //   size:  24.sp,
          // ),
          suffixIcon: widget.suffixIcon
              ? IconButton(onPressed: (){
                showPassword();
          }, icon: Icon(widget.obscureText
              ?Icons.visibility
              :Icons.visibility_off,
              color: !widget.obscureText?Theme.of(context).primaryColor:
              ColorManager.grey,
          ))
              : null,
          hintText: widget.hintText),
    );
  }
}