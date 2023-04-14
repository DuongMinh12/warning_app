
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:warning_app/constants/utils.dart';
import 'package:warning_app/repositories/customer/customer_repository.dart';
import 'package:warning_app/screens/screens.dart';

class ProfileController extends GetxController{
  static ProfileController get instance => Get.find();
  final _userRepo = Get.put(CustomerRepository());
  late final Rx<User?> firebaseUser;
  final _auth = FirebaseAuth.instance;

  @override
  void onReady(){
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User?user){
    user == null ? Get.offAll(()=> SplashPage()) : Get.offAll(() => DrawerMenu());
  }


  getUserdata(){
    final email = firebaseUser.value?.email;
    if(email !=null){
      return _userRepo.getDataDetail(email);
    }
    else{
      return Utils.toassMessage('Error, have trouble with connected firebase');
    }
  }
}