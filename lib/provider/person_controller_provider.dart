import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:showcase/controller/person_controller.dart';
import 'package:showcase/model/person.dart';

final personNotifierProvider =
    StateNotifierProvider<PersonNotifier, List<Person>>((ref) {
  return PersonNotifier(ref: ref);
});
