import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/contact.dart';
import 'set_state/contact_page.dart';

void main() {
  ///Using SetState
  // runApp(const MyApp());

  /// Using Provider
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<Contact>(
        create: (BuildContext context) {
          return Contact();
        },
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ContactPage());
  }
}
