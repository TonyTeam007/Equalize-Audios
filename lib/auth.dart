import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Auth {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final CollectionReference users = FirebaseFirestore.instance.collection("users");

  String? nameUser = "";

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signInWithEmailAndPass({
    required String email,
    required String password
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    users.where('email', isEqualTo: email).get()
      .then((QuerySnapshot querySnapshot) {
    if (querySnapshot.docs.isNotEmpty) {
      // If a document with the specified email is found, retrieve the name
      nameUser = querySnapshot.docs[0]['name'];
      print('Name: $nameUser');
    } else {
      // Handle the case when no matching document is found
      print('No user found with the specified email');
    }
  });
  }

  Future<void> createUser({
    required String name,
    required String email,
    required String password
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    users.add({
            'email': email, // John Doe
            'name': name
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}