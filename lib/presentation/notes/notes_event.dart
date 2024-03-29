import 'package:flutter_note_app/domain/model/note.dart';
import 'package:flutter_note_app/domain/util/note_order.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'notes_event.freezed.dart';

@freezed
sealed class NotesEvent<T> with _$NotesEvent<T> {
  const factory NotesEvent.loadNotes() = LoadNotes;

  const factory NotesEvent.deleteNote(Note note) = DeleteNote;

  const factory NotesEvent.restoreNote() = RestoreNote;

  const factory NotesEvent.changeOrder(NoteOrder noteOrder) = ChangeOrder;

  const factory NotesEvent.toggleOrderSection() = ToggleOrderSection;
}
