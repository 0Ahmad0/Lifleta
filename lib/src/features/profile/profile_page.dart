import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lifleta/src/common_widgets/custom_text_filed.dart';
import 'package:lifleta/src/core/utils/color_manager.dart';
import 'package:provider/provider.dart';

import '../../common_widgets/constans.dart';
import '../../common_widgets/picture/cach_picture_widget.dart';
import '../../common_widgets/picture/profile_picture_widget.dart';
import '../../core/data/local/storage.dart';
import '../auth/controller/provider/profile_provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final nameController = TextEditingController(text: 'Haifa');
  final emailController = TextEditingController(text: 'hifa@gmail.com');
  final idController = TextEditingController(text: '121212');
  final phoneController = TextEditingController(text: '+96654403456');

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  XFile? userImage;
  final ImagePicker picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ChangeNotifierProvider<ProfileProvider>.value(
              value: Provider.of<ProfileProvider>(context),
              child:
                  Consumer<ProfileProvider>(builder: (context, value, child) {
                nameController.text =
                    "${value.user.firstName}" + ' ' + "${value.user.lastName}";
                emailController.text = "${value.user.email}";
                phoneController.text = "${value.user.phoneNumber}";
                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      StatefulBuilder(
                        builder: (context,imageSetState) {
                          return Stack(
                            alignment: Alignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: CircleAvatar(

                                  backgroundColor: ColorManager.grey.withOpacity(.75),
                                  radius: size.width / 5,
                                  child: userImage == null
                                      ? ClipOval( child :
                                  CacheNetworkImage(
                                    photoUrl:   // "https://th.bing.com/th/id/R.1b3a7efcd35343f64a9ae6ad5b5f6c52?rik=HGgUvyvtG4jbAQ&riu=http%3a%2f%2fwww.riyadhpost.live%2fuploads%2f7341861f7f918c109dfc33b73d8356b2.jpg&ehk=3Z4lADOKvoivP8Tbzi2Y56dxNrCWd0r7w7CHQEvpuUg%3d&risl=&pid=ImgRaw&r=0",
                                    '${value.user.photoUrl}',
                                    width: size.width / 2.5,
                                    height: size.width / 2.5,
                                    boxFit: BoxFit.cover,
                                    waitWidget: WidgetProfilePicture(
                                      name: value.user.name,
                                      radius: size.width / 5,
                                      fontSize: size.width / 5,
                                      backgroundColor: ColorManager.primaryColor,
                                      textColor: ColorManager.white,
                                    ),
                                    errorWidget: WidgetProfilePicture(
                                      //ToDo:Fix This
                                      name: 'value.user.name',
                                      radius: size.width / 5,
                                      fontSize: size.width / 5,
                                      backgroundColor: ColorManager.primaryColor,
                                      textColor: ColorManager.white,
                                    ),
                                  )
                                  )
                                      : ClipRRect(
                          borderRadius: BorderRadius.circular(size.width / 2.5),
                                        child: Image.file(
                                            File(userImage!.path),
                                          fit: BoxFit.fill,
                                          width: size.width / 2.5,
                                          height: size.width / 2.5,
                                          ),
                                      )


                          //         Icon(
                          //                 Icons.person,
                          //                 color: AppColors.white,
                          //                 size: size.width / 3,
                          //               )
                          //             : ClipRRect(
                          // borderRadius: BorderRadius.circular(size.width / 2.5),
                          //               child: Image.file(
                          //                   File(userImage!.path),
                          //                 fit: BoxFit.fill,
                          //                 width: size.width / 2.5,
                          //                 height: size.width / 2.5,
                          //                 ),
                          //             ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                child: CircleAvatar(
                                  child: IconButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(24),
                                            )),
                                            context: context,
                                            builder: (_) {
                                              return Container(
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    ListTile(
                                                      onTap: () async {
                                                        final image = await picker.pickImage(source: ImageSource.camera);
                                                        if(image !=null){
                                                          userImage = image;
                                                          imageSetState((){});
                                                        }
                                                        Navigator.pop(context);
                                                      },
                                                      leading: Icon(Icons.camera_alt),
                                                      title: Text('Pick From Camera'),
                                                    ),
                                                    ListTile(
                                                      onTap: () async {
                                                        final image = await picker.pickImage(source: ImageSource.gallery);
                                                        if(image !=null){
                                                          userImage = image;
                                                          imageSetState((){});
                                                        }
                                                        Navigator.pop(context);
                                                      },
                                                      leading: Icon(Icons.image),
                                                      title: Text('Pick From Gallery'),
                                                    ),
                                                    ListTile(
                                                      onTap: () async {
                                                        userImage=null;
                                                        value.user.photoUrl='';
                                                        imageSetState((){});
                                                        //ToDo : Remove Photo
                                                        Navigator.pop(context);
                                                      },
                                                      leading: Icon(Icons.highlight_remove_rounded),
                                                      title: Text('Delete Photo'),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            });
                                      },
                                      icon: Icon(Icons.image)),
                                ),
                              )
                            ],
                          );
                        }
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: ColorManager.white,
                            borderRadius: BorderRadius.circular(24.0)),
                        child: Column(
                          children: [
                            TextFiledApp(
                              iconData: Icons.person,
                              controller: value.firstName,
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            TextFiledApp(
                              iconData: Icons.email_outlined,
                              controller: value.email,
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            TextFiledApp(
                              iconData: Icons.credit_card_sharp,
                              controller: value.phoneNumber,
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            TextFiledApp(
                              iconData: Icons.phone_android_outlined,
                              controller: value.number,
                            ),

                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      ElevatedButton.icon(
                        onPressed: () async {
                          Const.loading(context);
                          if(userImage!=null)
                            await value.uploadImage(context, userImage!);

                          await value.editUser(context);
                          Navigator.of(context).pop();
                        },
                        label: Text('Edit Profile'),
                        icon: const Icon(Icons.edit),
                      ),

                    ],
                  ),
                );
              }))),
    );
  }
}
