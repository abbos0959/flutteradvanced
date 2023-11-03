import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class RemoteAuthentication {
  final HttpClient httpClient;
  final String url;
  // final String methods;

  RemoteAuthentication({required this.httpClient, required this.url});
  Future<void> auth() async {
    await httpClient.request(url: url, methods: "post");
  }
}

abstract class HttpClient {
  Future<void> request({required String url, required String methods});
}

class HttpclientSpy extends Mock implements HttpClient {}

void main() {
  test("bu prosta birinchi test", () async {
    final httpClient = HttpclientSpy();
    final url = faker.internet.httpUrl();
    final sut = RemoteAuthentication(httpClient: httpClient, url: url);
    await sut.auth();
    verify(httpClient.request(url: url, methods: "post"));
  });
}
