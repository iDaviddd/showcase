import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:showcase/model/person.dart';
import 'package:showcase/provider/person_controller_provider.dart';

class AddWidget extends HookConsumerWidget {
  AddWidget({
    Key? key,
  }) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final personController = useTextEditingController();

    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: personController,
            decoration: const InputDecoration(hintText: "Namn, ålder, stad"),
          ),
          ElevatedButton(
            onPressed: () {
              final vals = personController.text.split(",");
              final name = vals[0].trim();
              final age = int.parse(vals[1].trim());
              final city = vals[2].trim();

              Person p = Person(name: name, age: age, city: city);
              ref.read(personNotifierProvider.notifier).addPerson(p);
            },
            child: const Text("Lägg till"),
          ),
        ],
      ),
    );
  }
}
