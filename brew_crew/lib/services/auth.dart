import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/services/database.dart';
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

  //auth change user stream
  Stream <UserId> get userStream {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
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
  Future signInWithEmailAndPassword(String email, String password) async {
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //register with email and psw
  Future registerWithEmailAndPassword(String email, String password) async {
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;

      //create a new document for the user with the uid
      await DatabaseService(uid: user.uid).updateUserData('0', 'new crew member', 100);
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future sigOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}