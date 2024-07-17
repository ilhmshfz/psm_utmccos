// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:utmccos/View/ProfileScreen/AddressScreen/address_screen.dart';
// import 'package:utmccos/View/ProfileScreen/OrderScreen/order_screen.dart';
// import 'package:utmccos/View/ProfileScreen/profile_screen.dart';



// class SettingsScreen extends StatelessWidget {
//   const SettingsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             //header
//             TprimaryHeaderContainer(
//                 child: Column(
//               children: [
//                 //appbar
//                 TAppBar(
//                   title: Text(
//                     'Account',
//                     style: Theme.of(context)
//                         .textTheme
//                         .headlineMedium!
//                         .apply(color: TColors.white),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: TSizes.spaceBtwSections,
//                 ),
//                 //sini letak profile card
//                 TuserProfileTile(onPressed: ()=> Get.to(()=> const ProfileScreen()),),
//                 const SizedBox(
//                   height: TSizes.spaceBtwSections,
//                 ),
//               ],
//             )),
//             //body
//             Padding(
//               padding: const EdgeInsets.all(TSizes.defaultSpace),
//               child: Column(
//                 children: [
//                   //acc settings
//                   const TsectionHeading(
//                     title: 'Account settings',
//                     showActionButton: false,
//                   ),
//                   const SizedBox(
//                     height: TSizes.spaceBtwItems,
//                   ),
//                   SettingsMenuTile(
//                     icon: Iconsax.safe_home,
//                     title: 'My address',
//                     subTitle: 'Set delivery address',
//                     onTap: ()=> Get.to(()=> const AddressScreen()),
//                   ),
//                   SettingsMenuTile(
//                     icon: Iconsax.shopping_cart,
//                     title: 'My cart',
//                     subTitle: 'Cart list',
//                     onTap: () {},
//                   ),
//                   SettingsMenuTile(
//                     icon: Iconsax.bag_tick,
//                     title: 'My orders',
//                     subTitle: 'Order list',
//                     onTap: ()=> Get.to(()=> const OrderScreen()),
//                   ),
//                   SettingsMenuTile(
//                     icon: Iconsax.bank,
//                     title: 'Payment method',
//                     subTitle: 'Payment detaisl',
//                     onTap: () {},
//                   ),
//                   SettingsMenuTile(
//                     icon: Iconsax.discount_shape,
//                     title: 'My vouchers',
//                     subTitle: 'Voucher list',
//                     onTap: () {},
//                   ),
//                   SettingsMenuTile(
//                     icon: Iconsax.notification,
//                     title: 'Notification',
//                     subTitle: 'See notif',
//                     onTap: () {},
//                   ),
//                   SettingsMenuTile(
//                     icon: Iconsax.security_card,
//                     title: 'Account privacy',
//                     subTitle: 'Manage account',
//                     onTap: () {},
//                   ),

//                   //app settings
//                   const SizedBox(
//                     height: TSizes.spaceBtwSections,
//                   ),
//                   const TsectionHeading(
//                     title: 'App settings',
//                     showActionButton: false,
//                   ),
//                   const SizedBox(
//                     height: TSizes.spaceBtwItems,
//                   ),
//                   const SettingsMenuTile(
//                       icon: Iconsax.document_upload,
//                       title: 'Load data',
//                       subTitle: 'Upload data to firebase'),
//                   SettingsMenuTile(
//                     icon: Iconsax.location,
//                     title: 'Geolocation',
//                     subTitle: 'Set location',
//                     trailing: Switch(value: true, onChanged: (value) {}),
//                   ),
//                   SettingsMenuTile(
//                     icon: Iconsax.security_user,
//                     title: 'Safe mode',
//                     subTitle: 'Set safe mode',
//                     trailing: Switch(value: false, onChanged: (value) {}),
//                   ),
//                   SettingsMenuTile(
//                     icon: Iconsax.image,
//                     title: 'HD Image',
//                     subTitle: 'Set HD image',
//                     trailing: Switch(value: false, onChanged: (value) {}),
//                   ),

//                   //logout button
//                   const SizedBox(
//                     height: TSizes.spaceBtwSections,
//                   ),
//                   SizedBox(
//                     width: double.infinity,
//                     child: OutlinedButton(onPressed: (){}, child: const Text('Logout')),
//                   ),
//                   const SizedBox(
//                     height: TSizes.spaceBtwSections * 2.5,
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
