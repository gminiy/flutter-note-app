import 'package:flutter_note_app/data/data_source/note_db_helper.dart';
import 'package:flutter_note_app/data/repository/note_repository_imple.dart';
import 'package:flutter_note_app/domain/repository/note_repository.dart';
import 'package:flutter_note_app/domain/use_case/add_note_use_case.dart';
import 'package:flutter_note_app/domain/use_case/get_note_use_case.dart';
import 'package:flutter_note_app/domain/use_case/get_notes_use_case.dart';
import 'package:flutter_note_app/domain/use_case/update_note_use_case.dart';
import 'package:flutter_note_app/domain/use_case/use_cases.dart';
import 'package:flutter_note_app/presentation/add_edit_note/add_edit_note_view_model.dart';
import 'package:flutter_note_app/presentation/notes/notes_view_model.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';
import '../domain/use_case/delete_note_use_case.dart';

final getIt = GetIt.instance;

Future<void> diSetup() async {
  final databasesPath = await getDatabasesPath();
  String path = '$databasesPath/notes_app.db)';

  Database database = await openDatabase(
    path,
    version: 1,
    onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE Note (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, content TEXT, color INTEGER, timestamp INTEGER)');
    },
  );

  getIt.registerSingleton<NoteDbHelper>(NoteDbHelper(database));
  getIt.registerSingleton<NoteRepository>(NoteRepositoryImpl(getIt()));
  getIt.registerSingleton<AddNoteUseCase>(AddNoteUseCase(getIt()));
  getIt.registerSingleton<DeleteNoteUseCase>(DeleteNoteUseCase(getIt()));
  getIt.registerSingleton<GetNoteUseCase>(GetNoteUseCase(getIt()));
  getIt.registerSingleton<GetNotesUseCase>(GetNotesUseCase(getIt()));
  getIt.registerSingleton<UpdateNoteUseCase>(UpdateNoteUseCase(getIt()));
  getIt.registerSingleton<UseCases>(
    UseCases(
      addNoteUseCase: getIt<AddNoteUseCase>(),
      deleteNoteUseCase: getIt<DeleteNoteUseCase>(),
      getNotesUseCase: getIt<GetNotesUseCase>(),
      updateNoteUseCase: getIt<UpdateNoteUseCase>(),
      getNoteUseCase: getIt<GetNoteUseCase>(),
    ),
  );

  getIt.registerFactory(() => NotesViewModel(getIt<UseCases>()));
  getIt.registerFactory(() => AddEditNoteViewModel(getIt<NoteRepository>()));
}
