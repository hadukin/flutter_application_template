import 'package:notes/data/data_source/notes_local_data_source.dart';
import 'package:notes/domain/repository/notes_repository.dart';

class const NotesRepositoryImpl({required final NotesLocalDataSource _local})
    implements NotesRepository {
  @override
  Future<String> create(String note) async {
    return _local.create(note);
  }
}
