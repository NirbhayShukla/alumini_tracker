import 'package:firebase_auth/firebase_auth.dart';

import 'package:alumini_tracker/models/user.dart';

class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userfromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged
        .map(_userfromFirebaseUser);
  }

  Future signOut() async{
    try{
return await _auth.signOut();
  }catch(e){
    print(e.toString());
    return null;
  }
}
}