import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();
final _storage = FlutterSecureStorage();

String name;
String email;
String imageUrl;
String current_user_id;

Future<String> signInWithGoogle() async {

  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final AuthResult authResult = await _auth.signInWithCredential(credential);
  final FirebaseUser user = authResult.user;

  // Checking if email and name is null
  assert(user.email != null);
  assert(user.displayName != null);
  assert(user.photoUrl != null);

  name = user.displayName;
  email = user.email;
  imageUrl = user.photoUrl;

  await _storage.write(key: 'name', value: user.displayName);
  await _storage.write(key: 'email', value: user.email);
  await _storage.write(key: 'imageUrl', value: user.photoUrl);

  // Only taking the first part of the name, i.e., First Name
  // if (name.contains(" ")) {
  //   name = name.substring(0, name.indexOf(" "));
  // }

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid == currentUser.uid);

  current_user_id = currentUser.uid;
  await _storage.write(key: 'user_id', value: current_user_id);

  Firestore.instance
      .collection('users')
      .document(currentUser.uid)
      .setData({'name': '$name', 'url': '$imageUrl', 'email': '$email'});
  return '$user';
}

void signOutGoogle() async {
  await googleSignIn.signOut();

  await _storage.delete(key: 'user_id');
   await _storage.delete(key: 'name');
    await _storage.delete(key: 'email');
     await _storage.delete(key: 'imageUrl');

  print("User Sign Out");
}
