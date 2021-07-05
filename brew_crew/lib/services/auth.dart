import 'package:brew_crew/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

/*******************
    User = UserId
    FirebaseUser = User
    AuthResult = UserCredential
 ******************/


class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user obg on FirebaseUser
  UserId _userFromFirebaseUser (User user){
    return user != null ? UserId(uid: user.uid) : null;
  }
  //sign in anon
  Future singInAnon() async {
    try{
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e){
      print(e.toString());
      return null;
    }
  }
  //sign in with email and psw

  //register with email and psw

  //sign in
}