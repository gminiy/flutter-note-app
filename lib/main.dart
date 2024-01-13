import 'package:flutter/material.dart';
import 'package:flutter_note_app/di/di_setup.dart';
import 'package:flutter_note_app/presentation/add_edit_note/add_edit_note_view_model.dart';
import 'package:flutter_note_app/presentation/notes/notes_screen.dart';
import 'package:flutter_note_app/presentation/notes/notes_view_model.dart';
import 'package:flutter_note_app/ui/colors.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await diSetup();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => getIt<NotesViewModel>()),
        ChangeNotifierProvider(create: (_) => getIt<AddEditNoteViewModel>()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          unselectedWidgetColor: Colors.white,
          primaryColor: Colors.white,
          appBarTheme: AppBarTheme.of(context).copyWith(color: darkGray),
          scaffoldBackgroundColor: darkGray,
          useMaterial3: true,
          floatingActionButtonTheme:
              Theme.of(context).floatingActionButtonTheme.copyWith(
                    backgroundColor: Colors.white,
                    foregroundColor: darkGray,
                  ),
        ),
        home: const NotesScreen());
  }
}
