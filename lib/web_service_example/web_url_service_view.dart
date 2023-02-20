import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/user_model.dart';
import 'web_service_provider.dart';

class WebUriServiceView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(
        reponseUsersProvider("https://jsonplaceholder.typicode.com/users"));

    try {
      debugPrint("${(data.value as List<UserModel>).length}");
    } catch (e) {
      debugPrint("${e.toString()}");
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [Container()],
    );
  }
}
