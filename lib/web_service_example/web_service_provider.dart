import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learn/model/user_model.dart';
import 'package:riverpod_learn/web_service_example/web_service.dart';

final httpClient = Provider((ref) => WebService());

final reponseProvider = FutureProvider.autoDispose((ref) async {
  final http = ref.watch<WebService>(httpClient);
  return http.fakeHttpData(url: "https://jsonplaceholder.typicode.com/users");
});

final reponseUsersProvider =
    FutureProvider.family<dynamic, String>((ref, apiUrl) async {
  final http = ref.watch<WebService>(httpClient);
  List<UserModel> res =
      await http.getUsers<UserModel>(url: apiUrl, model: UserModel());
  return res;
});
