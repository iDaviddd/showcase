import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:showcase/provider/person_controller_provider.dart';
import 'package:showcase/view/add_widget.dart';
import 'package:showcase/view/person_card_widget.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(children: [
              AddWidget(),

              // * Personer titel
              Text(
                "Personer",
                style: GoogleFonts.sen(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // * Lista med personer
              const PersonsSection(),
            ]),
          ),
        ),
      ),
    );
  }
}

class PersonsSection extends ConsumerWidget {
  const PersonsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final persons = ref.watch(personNotifierProvider);
    return Column(
      children: [
        if (persons.isEmpty) const Text("Inga personer här"),
        for (final person in persons)
          PersonCard(
            person: person,
          ),
      ],
    );
  }
}
