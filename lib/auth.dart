import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projectmusic/list.dart';
import 'package:projectmusic/main.dart';

class Auth {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final CollectionReference users = FirebaseFirestore.instance.collection("users");
  final CollectionReference playlists = FirebaseFirestore.instance.collection("playlists");
  final CollectionReference musics = FirebaseFirestore.instance.collection("musics");

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
      MyApp.nameUser = querySnapshot.docs[0]['name'];
      MyApp.emailUser = querySnapshot.docs[0]['email'];
      print('Name: '+MyApp.nameUser);
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

  Future<List<QueryDocumentSnapshot>> getPlaylist() async {
    QuerySnapshot querySnapshot = await playlists.where('own_user', isEqualTo: MyApp.emailUser).get();

    if (querySnapshot.docs.isNotEmpty) {
      return querySnapshot.docs;
    } else {
      return List.empty();
    }
  }
  
  Future<List<QueryDocumentSnapshot>> getMusics() async {
    QuerySnapshot querySnapshot = await musics.get();

    if (querySnapshot.docs.isNotEmpty) {
      return querySnapshot.docs;
    } else {
      return List.empty();
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}