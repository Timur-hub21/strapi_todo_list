abstract interface class RegistrationRepository {
  Future<void> register({
    required String username,
    required String email,
    required String password,
  }) async {}
}
