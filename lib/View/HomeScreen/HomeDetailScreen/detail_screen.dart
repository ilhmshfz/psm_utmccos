import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:utmccos/Model/GetX/Controller/duplicate_controller.dart';
import 'package:utmccos/Model/GetX/Controller/profile_controller.dart';
import 'package:utmccos/Model/Tools/Color/color.dart';
import 'package:utmccos/Model/Tools/Font/font.dart';
import 'package:utmccos/Model/Tools/JsonParse/product_parse.dart';
import 'package:utmccos/Model/Widget/widget.dart';
import 'package:utmccos/View/CartScreen/cart_screen.dart';
import 'package:utmccos/Model/Cart/cart.dart';
import 'package:get/get.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final double rate = Random.secure().nextInt(5).toDouble();
  @override
  Widget build(BuildContext context) {
    final duplicateController = Get.find<DuplicateController>();
    final profileController = Get.find<ProfileController>();
    final CustomTextStyle textStyle = duplicateController.textStyle;
    final CustomColors colors = duplicateController.colors;
    final CartFunctions cartFunctions = duplicateController.cartFunctions;
    final profileFunctions = profileController.profileFunctions;
    final bool isInFavorite =
        profileFunctions.isInFavoriteBox(productEntity: widget.productEntity);

    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: paddingFromRL(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: colors.gray,
                child: IconButton(
                  highlightColor: colors.whiteColor,
                  splashColor: colors.whiteColor,
                  icon: isInFavorite
                      ? Icon(
                          CupertinoIcons.gift_fill,
                          color: colors.blackColor,
                        )
                      : Icon(
                          CupertinoIcons.gift,
                          color: colors.blackColor,
                        ),
                  onPressed: () async {       //add to donation page
                    if (isInFavorite) {
                      await profileFunctions.removeDonation(
                          productEntity: widget.productEntity);
                      setState(() {});
                    } else {
                      await profileFunctions.addToDonation(
                          productEntity: widget.productEntity);
                      setState(() {});
                    }
                  },
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: CupertinoTheme(
                    data: CupertinoThemeData(primaryColor: colors.primary),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CupertinoButton.filled(
                        child: Text(
                          "Add to cart",
                          style: textStyle.bodyNormal
                              .copyWith(color: colors.whiteColor),
                        ),
                        onPressed: () async {
                          bool isAdd = await cartFunctions.addToCart(
                              productEntity: widget.productEntity);
                          if (isAdd) {
                            Get.snackbar("Add to cart", "",
                                messageText: Text(
                                  "successfully add to cart",
                                  style: textStyle.bodyNormal,
                                ),
                                backgroundColor: colors.gray);
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
              // CircleAvatar( // Was planned to add this as link to utm care website
              //   backgroundColor: colors.gray,
              //   child: IconButton(
              //     highlightColor: colors.whiteColor,
              //     splashColor: colors.whiteColor,
              //     icon: Icon(
              //       CupertinoIcons.arrow_up_right,
              //       color: colors.blackColor,
              //     ),
              //     onPressed: () {
              //       // Share.shareUri(Uri.https("utm care website url"));
              //     },
              //   ),
              // )
            ],
          ),
        ),
        backgroundColor: colors.whiteColor,
        appBar: AppBar(
          foregroundColor: colors.blackColor,
          backgroundColor: colors.whiteColor,
          centerTitle: true,
          title: Text(
            "Product Detail",
            style: textStyle.titleLarge,
          ),
          actions: [
            CartLengthBadge(
              duplicateController: duplicateController,
              colors: colors,
              textStyle: textStyle,
              badgeCallback: () {
                Get.to(const CartScreen());
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              width: Get.size.width,
              height: Get.size.height * 0.4,
              color: colors.blackColor,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      top: 15,
                    ),
                    height: 300,
                    width: 300,
                    child: CachedNetworkImage(
                      imageUrl: widget.productEntity.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: colors.blackColor,
              ),
              child: Container(
                height: Get.size.height * 0.4,
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    color: colors.whiteColor,
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(15))),
                child: SingleChildScrollView(
                  physics: duplicateController.uiDuplicate.defaultScroll,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          paddingFromRL(
                            child: Text(
                              widget.productEntity.name,
                              style: textStyle.titleLarge,
                              overflow: TextOverflow.clip,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [                              
                              SizedBox(
                                width: 5,
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      paddingFromRL(
                          child: Text(
                        widget.productEntity.description,
                        style: textStyle.bodySmall
                            .copyWith(color: colors.captionColor),
                      )),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "RM ${widget.productEntity.price}",
                        style: textStyle.titleLarge
                            .copyWith(color: colors.primary),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

Widget paddingFromRL({required Widget child}) {
  return Padding(
    padding: const EdgeInsets.only(left: 15, right: 15),
    child: child,
  );
}
