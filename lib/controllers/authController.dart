
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:todo2ndtest/controllers/userController.dart';
import 'package:todo2ndtest/models/user.dart';
import 'package:todo2ndtest/services/database.dart';


class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<User> _firebaseUser = Rx<User>();

  //ANCHOR Getting Authenticated User email (String Getter) ::::::::::::::::::::
  // String get userGetter => _firebaseUser.value?.email;

  //ANCHOR Getting the Authenticated User ::::::::::::::::::::::::::::::::::::::
  User get userGetter => _firebaseUser.value;

  @override
  void onInit() {
    super.onInit();
    _firebaseUser.bindStream(_auth.authStateChanges());
  }

  void createUser(String email, String password, String name) async {
    try {
      
      print("Creating User :::::::::::::::::");
      
      //Create user in Firebase ::::::::::::::::::::::::::::::::::::::::::::::::
      UserCredential _authResult = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);
      print("After Creating User :::::::::::::::::");
      
      //Creating UserModel to store Data in FireStore ::::::::::::::::::::::::::
      UserModel _userModel = UserModel(
        id: _authResult.user.uid,
        name: name,
        email: email.trim(),
      );
      
      print("After Creating Model :::::::::::::::::");
      // Storing userModel (userData) in fireStore :::::::::::::::::::::::::::::
      
      if (await DataBase().createUser(_userModel)) {
        
        print("After Successfully storing the Model :::::::::::::::::");
        //Successfully store userModel (userData) in FireStore  ::::::::::::::::
        Get.find<UserController>().userSetter = _userModel;
        Get.back();
      }
    } catch (e) {
      
      Get.snackbar("Error in Creating Account", e.message,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void login(String email, String password) async {
    try {
      
      //Logging In the User ::::::::::::::::::::::::::::::::::::::::::::::::::::
      UserCredential _authResult = await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password);

      
      // Setting the user in userController that logIn :::::::::::::::::::::::::
      Get.find<UserController>().userSetter =
          await DataBase().getUser(_authResult.user.uid);
    
    } catch (e) {
      
      Get.snackbar("Error in Signing In", e.message,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void signOut() async {
    
    try {
      
      await _auth.signOut();
      Get.find<UserController>().clear();
    
    } catch (e) {
      
      Get.snackbar("Error in Signing Out", e.message,
          snackPosition: SnackPosition.BOTTOM);
    
    }
  }
}
