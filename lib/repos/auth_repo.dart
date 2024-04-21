

abstract class AuthRepo {

  String getAuthToken();

  Future<bool> saveAuthToken(String authToken);

  String getRefreshToken();

  Future<bool> saveRefreshToken(String refreshToken);

}
