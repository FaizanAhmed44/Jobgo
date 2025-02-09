// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jobgo/features/screen/model/user_model.dart';
import 'package:jobgo/main.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        // Sign-in process was canceled
        return null;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in with the credential
      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      JobSeeker user = JobSeeker(
        uid: userCredential.user!.uid,
        name: userCredential.user!.displayName!,
        email: userCredential.user!.email!,
        phone: '',
        createdAt: DateTime.now(),
        profileImage: '',
        bio: '',
        education: [],
        experience: [],
        skills: [],
        resumeUrl: '',
        portfolioUrl: '',
        location: '',
        appliedJobs: [],
      );

      await _firestore
          .collection("job_seekers")
          .doc(userCredential.user!.uid)
          .set(user.toMap());
      return userCredential.user;
    } catch (e) {
      return null;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    box1.put('isLogedIn', false);
    await _googleSignIn.signOut();
  }

  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
  }) async {
    String res = "Some error ocurred";

    try {
      if (email.isNotEmpty || password.isNotEmpty || username.isNotEmpty) {
        // register user in authentication part
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        JobSeeker user = JobSeeker(
          uid: cred.user!.uid,
          name: username,
          email: email,
          phone: '',
          createdAt: DateTime.now(),
          profileImage: '',
          bio: '',
          education: [],
          experience: [],
          skills: [],
          resumeUrl: '',
          portfolioUrl: '',
          location: '',
          appliedJobs: [],
        );
        await _firestore
            .collection("users")
            .doc(cred.user!.uid)
            .set(user.toMap());

        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> logInUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error ocurred";

    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);

        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> logOutUser() async {
    String res = "Some error ocurred";

    try {
      await _auth.signOut();

      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<DocumentSnapshot> getUserDetail() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    return snap;
  }

  Future<DocumentSnapshot> getUserDetailWithUid(String uid) async {
    DocumentSnapshot snap =
        await FirebaseFirestore.instance.collection("users").doc(uid).get();

    return snap;
  }

  Future<DocumentSnapshot> getDiffUserDetail(String uid) async {
    DocumentSnapshot snap =
        await FirebaseFirestore.instance.collection("users").doc(uid).get();

    return snap;
  }
}
