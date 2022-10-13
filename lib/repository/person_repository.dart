import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:showcase/model/person.dart';

abstract class BasePersonRepository {
  Future<List<Person>> fetchPersons();
  Future<void> addPerson(Person person);
  Future<void> removePerson(Person person);
}

class PersonRepository extends BasePersonRepository {
  @override
  Future<Person> addPerson(Person person) async {
    final docRef = await FirebaseFirestore.instance.collection("persons").add({
      "name": person.name,
      "age": person.age,
      "city": person.city,
    });

    Person p = Person(
      name: person.name,
      age: person.age,
      city: person.city,
      id: docRef.id,
    );
    return p;
  }

  @override
  Future<List<Person>> fetchPersons() async {
    final snapshot =
        await FirebaseFirestore.instance.collection("persons").get();
    final persons = snapshot.docs.map((doc) {
      final data = doc.data();
      final person = Person(
        name: data["name"],
        age: data["age"],
        city: data["city"],
        id: doc.id,
      );
      return person;
    }).toList();
    return persons;
  }

  @override
  Future<void> removePerson(Person person) async {
    if (person.id != null) {
      await FirebaseFirestore.instance
          .collection("persons")
          .doc(person.id)
          .delete();
    }
  }
}
