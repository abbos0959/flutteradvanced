abstract class HttpClient {
  Future<void> request(
      {required String url, required String methods, Map body});
}

