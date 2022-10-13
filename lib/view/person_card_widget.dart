import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:showcase/model/person.dart';
import 'package:showcase/provider/person_controller_provider.dart';

class PersonCard extends ConsumerWidget {
  const PersonCard({
    Key? key,
    required this.person,
  }) : super(key: key);

  final Person person;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        color: Colors.grey.shade200,
        padding: const EdgeInsets.all(
          15,
        ),
        margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(person.name),
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    ref
                        .read(personNotifierProvider.notifier)
                        .removePerson(person);
                  },
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${person.age} år gammal"),
                Text(person.city),
              ],
            ),
          ],
        ));
  }
}
