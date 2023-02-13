import 'dart:async';

import 'package:dietx/app/model/auth/auth_status.dart';
import 'package:dietx/app/model/auth/auth_use_case.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class AuthUseCaseImpl extends AuthUseCase {
  final FirebaseAuth _firebaseAuth;
  final BehaviorSubject<AuthStatus> _changes = BehaviorSubject.seeded(AuthStatus.loggedOut);

  AuthUseCaseImpl(this._firebaseAuth) {
    _firebaseAuth.idTokenChanges().listen((user) async {
      final AuthStatus newStatus;
      final AuthStatus oldStatus = _changes.value;
      if (user != null) {
        newStatus = AuthStatus.loggedIn;
      } else {
        newStatus = AuthStatus.loggedOut;
      }
      if (newStatus != oldStatus) {
        _changes.add(newStatus);
      }
    });
  }

  @override
  Stream<AuthStatus> onAuthChanged() => _changes;

  @override
  Future<void> login({required String email, required String password}) {
    return _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> register({required String email, required String password}) {
    return _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> logout() {
    return _firebaseAuth.signOut();
  }
}
