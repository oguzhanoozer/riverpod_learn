import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'web_service_provider.dart';

class WebServiceView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(reponseProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        data.map(
            data: (data) => Text(data.value),
            error: (err) => Text(err.error.toString()),
            loading: (_) => CircularProgressIndicator())
      ],
    );
  }
}
