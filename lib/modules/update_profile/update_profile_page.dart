import 'package:cached_network_image_platform_interface/cached_network_image_platform_interface.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/colors_theme.dart';
import '../../utils/app_utils.dart';
import '../../widgets/choose_avatar_bottom_sheet.dart';
import 'update_profile_controller.dart';

class UpdateProfilePage extends StatelessWidget {
  const UpdateProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    UpdateProfileController updateProfileController =
        Get.find<UpdateProfileController>();
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: ThemeColor.black,
              )),
          title: Text(
            "Update Profile",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ThemeColor.black),
          ),
          backgroundColor: Colors.transparent,
          centerTitle: false,
          elevation: 0,
        ),
        backgroundColor: ThemeColor.lighterPrimary,
        body: Obx(() => updateProfileController.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: updateProfileController.updateProfileFormKey,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(16),
                                        ),
                                      ),
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      backgroundColor: Colors.white,
                                      builder: (context) {
                                        return ChooseAvatarBottomSheet(
                                            allAvatars: updateProfileController
                                                .allAvatars,
                                            onTap: (profilePic) {
                                              updateProfileController
                                                  .profilePicUrl
                                                  .value = profilePic;
                                            });
                                      });
                                },
                                child: SizedBox(
                                  width: 80,
                                  height: 80,
                                  child: Stack(
                                      clipBehavior: Clip.none,
                                      fit: StackFit.expand,
                                      children: [
                                        CircleAvatar(
                                          backgroundColor:
                                              AppUtils.getRandomAvatarBgColor(),
                                          child: ClipOval(
                                            child: CachedNetworkImage(
                                              imageRenderMethodForWeb: ImageRenderMethodForWeb.HttpGet,
                                                imageUrl:
                                                    updateProfileController
                                                        .profilePicUrl.value,
                                                width: double.infinity,
                                                height: double.infinity,
                                                fit: BoxFit.cover,
                                                fadeInDuration: Duration(milliseconds: 0),
                                                progressIndicatorBuilder: (context,
                                                        url,
                                                        downloadProgress) =>
                                                    // SizedBox(
                                                    //     width: 50,
                                                    //     height: 50,
                                                    //     child: CircularProgressIndicator(
                                                    //         value:
                                                    //             downloadProgress
                                                    //                 .progress)
                                                    Image.asset(
                                                        "assets/images/placeholder.png"),
                                                // ),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Icon(Icons.error)),
                                          ),
                                        ),
                                        Positioned(
                                            bottom: 0,
                                            right: -4,
                                            child: Container(
                                              width: 24,
                                              height: 24,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: ThemeColor.accent,
                                              ),
                                              child: Icon(
                                                Icons.edit_rounded,
                                                color: ThemeColor.white,
                                                size: 16,
                                              ),
                                            )),
                                      ]),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            Text(
                              "First Name",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: ThemeColor.textPrimary,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              controller:
                                  updateProfileController.firstNameController,
                              keyboardType: TextInputType.text,
                              enabled: false,
                              style: TextStyle(
                                
                                  color: ThemeColor.black, fontSize: 14),
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.person_outline,
                                  size: 18,
                                ),
                                contentPadding: EdgeInsets.all(12),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                hintText: "First Name",
                                hintStyle: TextStyle(
                                    fontSize: 14, color: ThemeColor.grey_500),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(10)),
                                filled: true,
                                fillColor: ThemeColor.white,
                              ),
                              textInputAction: TextInputAction.next,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              "Last Name",
                              
                              style: TextStyle(
                                  fontSize: 14,
                                  color: ThemeColor.textPrimary,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              controller:
                                  updateProfileController.lastNameController,
                              keyboardType: TextInputType.text,
                              style: TextStyle(
                                  color: ThemeColor.black, fontSize: 14),
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.person_outline,
                                  size: 18,
                                ),
                                contentPadding: EdgeInsets.all(12),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                hintText: "Last Name",
                                enabled: false,
                                hintStyle: TextStyle(
                                    fontSize: 14, color: ThemeColor.grey_500),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(10)),
                                filled: true,
                                fillColor: ThemeColor.white,
                              ),
                              textInputAction: TextInputAction.next,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              "About",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: ThemeColor.textPrimary,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              controller:
                                  updateProfileController.aboutController,
                              keyboardType: TextInputType.multiline,
                              style: TextStyle(
                                  color: ThemeColor.black, fontSize: 14),
                              maxLines: 8,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(12),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                hintText: "Wriye few lines about yourself",
                                hintStyle: TextStyle(
                                    fontSize: 14, color: ThemeColor.grey_500),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(10)),
                                filled: true,
                                fillColor: ThemeColor.white,
                              ),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                            ),
                            SizedBox(
                              height: 44,
                            ),
                            SizedBox(
                                width: double.infinity,
                                height: 44,
                                child: ElevatedButton(
                                  onPressed: () {
                                    updateProfileController.updateUserProfile();
                                  },
                                  style: TextButton.styleFrom(
                                    textStyle: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    backgroundColor: ThemeColor.primaryDark,
                                  ),
                                  child: Text("Update",
                                      style:
                                          TextStyle(color: ThemeColor.white)),
                                )),
                          ]),
                    )))));
  }
}
