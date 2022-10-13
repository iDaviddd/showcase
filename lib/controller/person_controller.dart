import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:showcase/model/person.dart';
import 'package:showcase/provider/person_repository_provider.dart';

class PersonNotifier extends StateNotifier<List<Person>> {
  PersonNotifier({required this.ref}) : super([]) {
    fetchPersons();
  }

  final StateNotifierProviderRef ref;

  void addPerson(Person person) async {
    final addedPerson =
        await ref.read(personRepositoryProvider).addPerson(person);
    state = [...state, addedPerson];
  }

  void removePerson(Person person) async {
    await ref.read(personRepositoryProvider).removePerson(person);
    state = [
      for (final p in state)
        if (p != person) p,
    ];
  }

  void fetchPersons() async {
    final persons = await ref.read(personRepositoryProvider).fetchPersons();
    state = persons;
  }
}
