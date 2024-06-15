import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:mvapp/models/usermodel.dart';

class AuthService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

    static final FirebaseDatabase _database = FirebaseDatabase.instance;
  static final DatabaseReference _userReference =
      _database.ref().child("Users");

  Future<User> getCurrentUser() async {
    User? currentUser;
    currentUser = _auth.currentUser;
    return currentUser!;
  }

    Stream<User?> get onAuthStateChanged {
    return _auth.authStateChanges().map((user) => user);
  }

  Future<UserCredential> signInEmailandPass(String email, String pass) async {
    try {
      UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);
          assert(userCredential.user != null);
      final User? currentUser = _auth.currentUser;
      assert(userCredential.user?.uid == currentUser?.uid);

      print('signInEmail succeeded: $userCredential');
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  Future<UserCredential> signUpemailandPass(String email, String pass) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: pass);
          if (userCredential.user != null) {
        await addDataToDb(userCredential.user!, email, pass);
      }
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }
  Future<void> addDataToDb(
      User currentUser, String username,String password) async {
    UserModel user = UserModel(
        uid: currentUser.uid,
        email: currentUser.email,
        password: password);

    _userReference.child(currentUser.uid).set(user.toMap(user));
  }
    signOut() {
    return _auth.signOut();
  }

  Future getCreatedDate() async {
    var date = _auth.currentUser!.metadata.creationTime;
    return DateFormat('dd/MM/yyyy h:m:s').format(date!);
  }

  Future<String> getCurrentUID() async {
    return _auth.currentUser!.uid;
  }

  // Get User Name
  Future getCurrentUsername() async {
    return _auth.currentUser!.displayName;
  }

  // Get User Email
  Future getCurrentEmail() async {
    return _auth.currentUser!.email;
  }
}


