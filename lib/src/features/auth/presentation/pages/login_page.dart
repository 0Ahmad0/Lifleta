import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lifleta/src/core/routing/app_router.dart';
import 'package:lifleta/src/core/utils/assets_manager.dart';
import 'package:lifleta/src/core/utils/color_manager.dart';
import 'package:lifleta/src/core/utils/values_manager.dart';
import 'package:lifleta/translations/locale_keys.g.dart';

import '../../../../common_widgets/custom_text_filed.dart';
import '../widgets/textfiled_with_Title.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final idController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool rememberMe = false;

  @override
  void dispose() {
    idController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FadeInLeft(
                  child: Image.asset(
                    AssetsManager.logoIMG,
                    width: 200.w,
                    height: 200.w,
                  ),
                ),
                FadeInLeft(
                  child: TextFieldWithTitle(
                    title: tr(LocaleKeys.login_id),
                    child: TextFiledApp(
                      controller: idController,
                      hintText: tr(LocaleKeys.login_enter_id),
                      iconData: Icons.credit_card_sharp,
                    ),
                  ),
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),
                FadeInLeft(
                  child: TextFieldWithTitle(
                    title: tr(LocaleKeys.login_password),
                    child: TextFiledApp(
                      controller: passwordController,
                      iconData: Icons.lock,
                      hintText: tr(LocaleKeys.login_enter_Password),
                      suffixIcon: true,
                      obscureText: true,
                    ),
                  ),
                ),
                StatefulBuilder(builder: (_, setStateCheckBox) {
                  return FadeInLeft(
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(tr(LocaleKeys.login_remember_me)),
                      leading: Checkbox(
                        value: rememberMe,
                        onChanged: (value) {
                          setStateCheckBox(() {
                            rememberMe = value!;
                          });
                        },
                      ),
                      onTap: () {
                        setStateCheckBox(() {
                          rememberMe = !rememberMe;
                        });
                      },
                    ),
                  );
                }),
                const SizedBox(
                  height: AppSize.s20,
                ),
                FadeInRight(
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {}
                      },
                      child: Text(tr(LocaleKeys.login_login))),
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),
                FadeInRight(
                  child: Row(
                    children: [
                      const Expanded(
                          child: Divider(
                        color: ColorManager.black,
                      )),
                      TextButton(
                          onPressed: () {},
                          child: Text(tr(LocaleKeys.login_forget_password))),
                      const Expanded(
                          child: Divider(
                        color: ColorManager.black,
                      )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),
                FadeInUp(
                  child: TextButton(
                      style: ButtonStyle(
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent)),
                      onPressed: () {
                        goRouter.pushReplacementNamed(
                          AppRoute.signUp.name,
                        );
                      },
                      child: Text.rich(TextSpan(children: [
                        TextSpan(
                            text:
                                tr(LocaleKeys.login_do_not_have_account) + '  ',
                            style: const TextStyle(color: ColorManager.black)),
                        TextSpan(
                            text: tr(LocaleKeys.login_create_account),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp,
                            ))
                      ]))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
