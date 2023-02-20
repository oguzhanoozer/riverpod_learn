import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'riverpod_learn.dart';

class RvLearnView extends ConsumerWidget {
  final studentController = ChangeNotifierProvider<Student>((ref) => Student());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(studentController);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(data.totalStudents.toString()),
        ElevatedButton(
            onPressed: () {
              ref.read(studentController).changeStudents();
            },
            child: Text("Click"))
      ],
    );
  }
}

class RvLearnConsumerView extends StatelessWidget {
  RvLearnConsumerView({super.key});

  final studentController = ChangeNotifierProvider<Student>((ref) => Student());

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final data = ref.watch(studentController);

        ref.listen(studentController, (previous, next) {
          print("previous");
          print(previous?.totalStudents.toString());
          print(next);
          print(next?.totalStudents.toString());
        });

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(data.totalStudents.toString()),
            ElevatedButton(
                onPressed: () {
                  ref.read(studentController).changeStudents();
                },
                child: Text("Click"))
          ],
        );
      },
    );
  }
}
