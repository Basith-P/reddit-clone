import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../core/constants/firebase_constants.dart';
import '../../../core/failure.dart';
import '../../../core/models/user_model.dart';
import '../../../core/providers/firebaes_providers.dart';
import '../../../core/typedef.dart';

final authRepositoryProvider = Provider((ref) => AuthRepository(
      auth: ref.read(authProvider),
      googleSignIn: ref.read(googleSignInProvider),
      firestore: ref.read(firestoreProvider),
    ));

class AuthRepository {
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;
  final FirebaseFirestore _firestore;

  AuthRepository(
      {required FirebaseAuth? auth,
      required GoogleSignIn? googleSignIn,
      required FirebaseFirestore? firestore})
      : _auth = auth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn(),
        _firestore = firestore ?? FirebaseFirestore.instance;

  CollectionReference get _usersCollection =>
      _firestore.collection(FirebaseConstants.usersCollection);

  FutureEither<AppUser> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential authResult =
          await _auth.signInWithCredential(credential);

      final User? user = authResult.user;
      late AppUser appUser;

      if (authResult.additionalUserInfo!.isNewUser) {
        appUser = AppUser(
          uid: user!.uid,
          displayImage: user.photoURL ?? '',
          displayName: user.displayName ?? '',
          banner: '',
          isAuthenticated: true,
          karma: 0,
          awards: [],
        );
        await _usersCollection.doc(user.uid).set(appUser.toMap());
      } else {
        appUser = await getUser(user!.uid).first;
      }
      return right(appUser);
    } on FirebaseAuthException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Stream<AppUser> getUser(String uid) {
    return _usersCollection.doc(uid).snapshots().map((snapshot) =>
        AppUser.fromMap(snapshot.data()! as Map<String, dynamic>));
  }
}
