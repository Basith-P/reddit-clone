import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/functions.dart';
import '../repository/auth_repository.dart';

final authControllerProvider = Provider(
    (ref) => AuthController(authRepository: ref.read(authRepositoryProvider)));

class AuthController {
  final AuthRepository _authRepository;

  AuthController({required AuthRepository authRepository})
      : _authRepository = authRepository;

  Future<void> signInWithGoogle() async {
    final user = await _authRepository.signInWithGoogle();
    user.fold((l) => showSnackbar(l.message), (r) => null);
  }
}
