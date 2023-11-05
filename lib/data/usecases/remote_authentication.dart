// import 'package:course/data/http/http-client.dart';
import '../http/http.dart';
import '../../domain/usecases/usecases.dart';

class RemoteAuthentication {
  final HttpClient httpClient;
  final String url;

  RemoteAuthentication({required this.httpClient, required this.url});
  Future<void> auth(AuthenticationParams params) async {
    await httpClient.request(url: url, methods: "post", body: params.toJson());
  }
}
