/* This would handle all the data  from and to the firebase 

- userprofile 
- post messages 
- likes
- commments
- Account Stuff (report /block / detail  account )
- Follow / UNFOLLOW
- Search Users 


 */

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:u_tweet/models/user.dart';

class DatabaseService {
  final _db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  /*  
  - User Profile
WHEN A NEW USER REGISTER , WE CREATE NEW ACCOUNT FIR THEM AND STORE THIER DETAILS IN THE DATABASE
*/
//Save user info to firebase
  Future<void> saveUserInfoFirebase({
    required String name,
    required String email,
  }) async {
    String uid = _auth.currentUser!.uid;
    String username = email.split('@')[0];
    UserProfile user = UserProfile(
      uid: uid,
      name: name,
      email: email,
      username: username,
      bio: '',
    );

    final userMap = user.toMap();
    await _db.collection('Users').doc(uid).set(userMap);
  }

  //get user profile
  Future<UserProfile?> getUserFromFirebase(String uid) async {
    try {
      DocumentSnapshot userDoc = await _db.collection('Users').doc(uid).get();
      return UserProfile.fromDocument(userDoc);
    } catch (e) {
      print(e);
      return null;
    }
  }

  //************************************************************************** */

  /*  
  - Post messages
  
  */

  //************************************************************************** */
  /*  
  - LIKES
  
  */

  //************************************************************************** */
  /*  
  - COMMENTS 
  
  */
  //************************************************************************** */
  /*  
  - Account Stuff (report /block / detail  account )
  
  */
  //************************************************************************** */
  /*  
  - Follow / UNFOLLOW
  
  */
  //************************************************************************** */
  /*  
  - SEARCH USERS
  
  */
}
