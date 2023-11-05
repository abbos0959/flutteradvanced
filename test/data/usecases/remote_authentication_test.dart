import 'package:course/data/http/http.dart';
import 'package:course/data/usecases/remote_authentication.dart';
import 'package:course/domain/usecases/usecases.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class HttpclientSpy extends Mock implements HttpClient {}

void main() {
  test("bu prosta birinchi test", () async {
    final httpClient = HttpclientSpy();
    final url = faker.internet.httpUrl();
    final sut = RemoteAuthentication(httpClient: httpClient, url: url);
    final params = AuthenticationParams(
        email: faker.internet.email(), password: faker.internet.password());
    await sut.auth(params);
    verify(httpClient.request(
        url: url,
        methods: "post",
        body: {"email": params.email, "password": params.password}));
  });
}
