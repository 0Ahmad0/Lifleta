import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lifleta/src/core/routing/app_router.dart';
import 'package:lifleta/src/core/utils/app_constant.dart';
import 'package:lifleta/src/core/utils/assets_manager.dart';
import 'package:lifleta/src/core/utils/color_manager.dart';
import 'package:lifleta/src/core/utils/values_manager.dart';
import 'package:lifleta/translations/locale_keys.g.dart';

import '../../../../common_widgets/custom_text_filed.dart';
import '../../controller/auth_controller.dart';
import '../widgets/textfiled_with_Title.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final nameController = TextEditingController();
  final idController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late  AuthController authController;
  @override
  void initState() {
    // TODO: implement initState
    authController=AuthController(context: context);
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    idController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    emailController.dispose();
    phoneController.dispose();
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
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(AppPadding.p16),
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
                      tr(LocaleKeys.signup_signup),
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
                title: tr(LocaleKeys.signup_name),
                child: TextFiledApp(
                  controller: nameController,
                  hintText: tr(LocaleKeys.signup_enter_name),
                  iconData: Icons.person,
                ),
              ),
            ),
            const SizedBox(
              height: AppSize.s20,
            ),
            FadeInLeft(
              child: TextFieldWithTitle(
                title: tr(LocaleKeys.signup_email),
                child: TextFiledApp(
                  controller: emailController,
                  hintText: tr(LocaleKeys.signup_enter_email),
                  iconData: Icons.email_outlined,
                ),
              ),
            ),
            const SizedBox(
              height: AppSize.s20,
            ),
            FadeInLeft(
              child: TextFieldWithTitle(
                title: tr(LocaleKeys.signup_id),
                child: TextFiledApp(
                  controller: idController,
                  hintText: tr(LocaleKeys.signup_enter_id),
                  iconData: Icons.credit_card_sharp,
                ),
              ),
            ),
            const SizedBox(
              height: AppSize.s20,
            ),
            FadeInLeft(
              child: TextFieldWithTitle(
                title: tr(LocaleKeys.signup_phone),
                child: TextFiledApp(
                  controller: phoneController,
                  hintText: tr(LocaleKeys.signup_enter_phone),
                  iconData: Icons.phone_android_outlined,
                ),
              ),
            ),
            const SizedBox(
              height: AppSize.s20,
            ),
            FadeInLeft(
              child: TextFieldWithTitle(
                title: tr(LocaleKeys.signup_password),
                child: TextFiledApp(
                  controller: passwordController,
                  iconData: Icons.lock,
                  textInputAction: TextInputAction.next,
                  hintText: tr(LocaleKeys.signup_enter_Password),
                  suffixIcon: true,
                  obscureText: true,
                ),
              ),
            ),
            const SizedBox(
              height: AppSize.s20,
            ),
            FadeInLeft(
              child: TextFieldWithTitle(
                title: tr(LocaleKeys.signup_confirm_password),
                child: TextFiledApp(
                  textInputAction: TextInputAction.done,
                  controller: confirmPasswordController,
                  iconData: Icons.lock,
                  hintText: tr(LocaleKeys.signup_enter_Password),
                  suffixIcon: true,
                  obscureText: true,
                ),
              ),
            ),
            Visibility(
              //ToDo on Type in Password make true
                visible: false,
                child: Column(children: [
              buildHintForPassword(text: tr(LocaleKeys.signup_less_character)),
              buildHintForPassword(text:tr(LocaleKeys.signup_contain_number_and_characters)),

            ],)),
            const SizedBox(
              height: AppSize.s20,
            ),

            FadeInRight(
              child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                     await authController.signUp(context, firstName: nameController.value.text, lastName: '', gender: 'male', dateBirth: DateTime.now(), email: emailController.value.text, password: passwordController.value.text, phoneNumber: idController.value.text, photoUrl: '', typeUser: AppConstants.collectionUser);
                    }
                  },
                  child: Text(tr(LocaleKeys.signup_signup))),
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
                      AppRoute.logIn.name,
                    );
                  },
                  child: Text.rich(TextSpan(children: [
                    TextSpan(
                        text:
                        tr(LocaleKeys.signup_have_account),
                        style: const TextStyle(color: ColorManager.black)),
                    TextSpan(
                        text: tr(LocaleKeys.signup_login),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                            decoration: TextDecoration.underline
                        ))
                  ]))),
            )
          ],
        ),
      ),
    );
  }

  Widget buildHintForPassword({required String text}) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 4.sp),
      child: Row(
                children: [
                 const Icon(Icons.circle,color: ColorManager.success,),
                  const SizedBox(width: AppSize.s4,),
                  Text(text,style: TextStyle(
                      color: ColorManager.success,
                      fontSize: 12.sp
                  ),),
                ],
              ),
    );
  }
}
