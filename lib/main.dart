import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo/data/task_data.dart';  
import 'package:todo/presenter/note_presenter.dart';
import 'package:todo/screen/add_note.dart';
import 'package:todo/screen/category_page.dart';
import 'package:todo/screen/home.dart';
import 'package:todo/screen/update_note.dart';
 
Future<void> main() async {
    // Initialize hive
  await Hive.initFlutter();
  // Registering the adapter
  Hive.registerAdapter(TaskDataAdapter() );
  // Opening the box
  await Hive.openBox('todoApp');


  runApp(ChangeNotifierProvider(
    create: (context) => NotePresenter(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/addNote': (context) => const AddNote(),
        '/updaeNote': (context) => const UpdateNote(),
        '/categoryPage': (context) =>  CategoryPage(),
      },
    );
  }
}
