// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:pocketbook/repos/auth_repo.dart';
import 'package:pocketbook/services/local_storage/auth_local_storage.dart';

class AuthRepoImpl implements AuthRepo {
  AuthLocalStorage authLocalStorage;

  AuthRepoImpl({required this.authLocalStorage});

  @override
  String getAuthToken() {
    final accessToken = authLocalStorage.getAuthToken() ?? '';
    return accessToken;
  }

  @override
  Future<bool> saveAuthToken(String authToken) async {
    return authLocalStorage.saveAuthToken(authToken);
  }

  @override
  String getRefreshToken() {
    final refreshToken = authLocalStorage.getRefreshToken() ?? '';
    return refreshToken;
  }

  @override
  Future<bool> saveRefreshToken(String refreshToken) async {
    return await authLocalStorage.saveRefreshToken(refreshToken);
  }
}
