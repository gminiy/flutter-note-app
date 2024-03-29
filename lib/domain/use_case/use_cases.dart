import 'package:flutter_note_app/domain/use_case/add_note_use_case.dart';
import 'package:flutter_note_app/domain/use_case/delete_note_use_case.dart';
import 'package:flutter_note_app/domain/use_case/get_note_use_case.dart';
import 'package:flutter_note_app/domain/use_case/get_notes_use_case.dart';
import 'package:flutter_note_app/domain/use_case/update_note_use_case.dart';

class UseCases {
  final AddNoteUseCase addNoteUseCase;
  final DeleteNoteUseCase deleteNoteUseCase;
  final GetNotesUseCase getNotesUseCase;
  final UpdateNoteUseCase updateNoteUseCase;
  final GetNoteUseCase getNoteUseCase;

  const UseCases({
    required this.addNoteUseCase,
    required this.deleteNoteUseCase,
    required this.getNotesUseCase,
    required this.updateNoteUseCase,
    required this.getNoteUseCase,
  });
}
