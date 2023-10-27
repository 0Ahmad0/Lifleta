import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lifleta/src/core/network/utils/create_environment_provider.dart';
import 'package:lifleta/src/core/routing/app_router.dart';
import 'package:lifleta/src/core/utils/app_constant.dart';
import 'package:lifleta/src/core/utils/assets_manager.dart';
import 'package:lifleta/src/core/utils/color_manager.dart';
import 'package:lifleta/src/core/utils/values_manager.dart';
import 'package:lifleta/src/features/auth/controller/auth_controller.dart';
import 'package:lifleta/translations/locale_keys.g.dart';
import 'package:provider/provider.dart';

import '../../../../common_widgets/custom_text_filed.dart';
import '../../controller/provider/auth_provider.dart';
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
 late  AuthController authController;
 @override
  void initState() {
    // TODO: implement initState
   authController=AuthController(context: context);
    super.initState();
  }
  @override
  void dispose() {
    idController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  Image.asset(AssetsManager.logoIMG),
        actions: [
          IconButton(
          onPressed: () {},
      icon: Icon(
        Icons.arrow_back_ios_new,
        color: Theme.of(context).primaryColor,
      ),
    ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: AppSize.s40,
                ),
                FadeInLeft(
                    child: Row(
                  children: [
                    Container(
                      width: 8.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10.r)),
                    ),
                    const SizedBox(
                      width: AppSize.s4,
                    ),
                    Text(
                      tr(LocaleKeys.login_login),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.sp,
                          color: Theme.of(context).primaryColor),
                    )
                  ],
                )),
                const SizedBox(
                  height: AppSize.s40,
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
                FadeInRight(
                  child: TextButton(
                    style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent)),
                    onPressed: () {},
                    child: Text(
                      tr(LocaleKeys.login_forget_password),
                      style: TextStyle(
                        fontSize: 14.sp,
                        decoration: TextDecoration.underline
                      ),
                    ),
                  ),
                ),
                StatefulBuilder(builder: (_, setStateCheckBox) {
                  return FadeInLeft(
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(tr(LocaleKeys.login_remember_me)),
                      leading: Checkbox(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.r)
                        ),
                        activeColor: Theme.of(context).primaryColor,
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
                      onPressed: () async {
                        //Form Validate
                    ///    CreateEnvironmentProvider().createEmployees(context);
                        if (_formKey.currentState!.validate()) {
                          await authController.login(context,phone: idController.value.text, password: passwordController.value.text);
                        }
                      },
                      child: Text(tr(LocaleKeys.login_login))),
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),
                Visibility(
                  visible: context.read<AuthProvider>().typeUser==AppConstants.collectionUser,
                  child: FadeInUp(
                    child: Align(
                      alignment: Alignment.center,
                      child: TextButton(
                          style: ButtonStyle(
                              overlayColor:
                                  MaterialStateProperty.all(Colors.transparent)),
                          onPressed: () {
                            goRouter.pushReplacementNamed(
                              AppRoute.signUp.name,
                            );
                          },
                          child: Text.rich(

                              TextSpan(
                                  children: [
                            TextSpan(
                                text:
                                    tr(LocaleKeys.login_do_not_have_account) + '  ',
                                style: const TextStyle(color: ColorManager.black)),
                            TextSpan(
                                text: tr(LocaleKeys.login_create_account),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.sp,
                                  decoration: TextDecoration.underline
                                ))
                          ]))),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
