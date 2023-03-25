import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/models/user_model.dart';
import '../../../core/utils/functions.dart';
import '../repository/auth_repository.dart';

final userProvider = StateProvider<AppUser?>((ref) => null);

final authControllerProvider = StateNotifierProvider<AuthController, bool>(
    (ref) => AuthController(
        authRepository: ref.watch(authRepositoryProvider), ref: ref));

final authStateChangeProvider = StreamProvider<User?>(
    (ref) => ref.watch(authControllerProvider.notifier).authStateChanges);

final getUserDataProvider = StreamProvider.family((ref, String uid) =>
    ref.watch(authControllerProvider.notifier).getUserData(uid));

class AuthController extends StateNotifier<bool> {
  final Ref _ref;
  final AuthRepository _authRepository;

  AuthController({required AuthRepository authRepository, required Ref ref})
      : _authRepository = authRepository,
        _ref = ref,
        super(false); // false means not loading

  Stream<User?> get authStateChanges => _authRepository.authStateChanges;

  Future<void> signInWithGoogle() async {
    state = true;
    final user = await _authRepository.signInWithGoogle();
    state = false;
    user.fold(
        (l) => showSnackbar(l.message),
        (appUser) =>
            _ref.read(userProvider.notifier).update((state) => appUser));
  }

  Stream<AppUser> getUserData(String uid) => _authRepository.getUserData(uid);
}
