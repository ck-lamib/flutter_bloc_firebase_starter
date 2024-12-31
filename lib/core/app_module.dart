import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

///this is used for single instance of the class
@module
abstract class AppModule {
  @singleton
  Connectivity get connectivity => Connectivity();
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;
  FirebaseFirestore get firestore => FirebaseFirestore.instance;
  FirebaseStorage get firebaseStorage => FirebaseStorage.instance;
  GoogleSignIn get googleSignIn => GoogleSignIn(scopes: ["email", "profile"]);
}
