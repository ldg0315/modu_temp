import 'package:modu_temp/login/service/firebase_auth_service.dart';

class LoginServiceRepository{

  final FirebaseAuthService _auth = FirebaseAuthService();

  Future<bool> createUserWithEmail({required String email, required String password}) async => _auth.createUserWithEmail(email, password);
  Future<bool> signInWithEmail({required String email, required String password}) async => _auth.signInWithEmail(email, password);
  void signOut() => _auth.signOut();

}