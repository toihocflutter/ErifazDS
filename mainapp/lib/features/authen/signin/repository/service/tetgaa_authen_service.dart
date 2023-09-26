import 'package:http/http.dart';

class TetgaaAuthenService {
  final String _baseUrl;
  final Client _httpClient;

  TetgaaAuthenService({required String baseUrl, required Client httpClient})
      : _baseUrl = baseUrl,
        _httpClient = httpClient;

  Uri getUrl({required String url, Map<String, String>? queryParameters}) {
    return Uri.parse('$_baseUrl/$url')
        .replace(queryParameters: queryParameters);
  }

  Future<void> signIn(
      {required String userName, required String password}) async {
    final response = await _httpClient.post(getUrl(
        url: 'auth/signin',
        queryParameters: {'email': userName, 'password': password}));
    print(response.bodyBytes);
  }
}
