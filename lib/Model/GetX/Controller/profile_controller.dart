import 'package:utmccos/Model/Tools/Entities/entities.dart';
import 'package:utmccos/Model/Profile/Authentication/authentication.dart';
import 'package:utmccos/Model/Profile/address.dart';
import 'package:utmccos/Model/Profile/order.dart';
import 'package:utmccos/Model/Profile/profile.dart';
import 'package:get/get.dart';

//this controller as a central hub for managing user profile data and access points for other profile-related functionalities 
//like address and order management.
//It utilizes GetX observable variables to keep the UI updated based on changes in the user profile data.
class ProfileController extends GetxController {
  ProfileFunctions profileFunctionsInstance = ProfileFunctions();
  ProfileFunctions get profileFunctions => profileFunctionsInstance;

  var rememberMeStatusInstance = false.obs;
  bool get rememberMeStatus => rememberMeStatusInstance.value;

  var informationInstance = UserInformation(
    name: "",
    userName: "",
    password: "",
  ).obs;
  UserInformation get information => informationInstance.value;

  AuthenticationFunctions authenticationFunctionsInstance =
      AuthenticationFunctions();
  AuthenticationFunctions get authenticationFunctions =>
      authenticationFunctionsInstance;

  var obscureTextInstance = true.obs;
  bool get obscureText => obscureTextInstance.value;

  var isLoginInstanse = false.obs;
  bool get islogin => isLoginInstanse.value;

  var userSetImageInstance = false.obs;
  bool get userSetImage => userSetImageInstance.value;

  final AddressFunctions addressFunctionsInstance = AddressFunctions();
  AddressFunctions get addressFunctions => addressFunctionsInstance;

  final OrderFunctions orderFunctionsInstance = OrderFunctions();
  OrderFunctions get orderFunctions => orderFunctionsInstance;
}
