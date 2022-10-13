import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:showcase/repository/person_repository.dart';

final personRepositoryProvider = Provider<PersonRepository>((ref) {
  return PersonRepository();
});
