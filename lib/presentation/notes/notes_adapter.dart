import 'package:flutter_application_template/ui_di_module.dart';
import 'package:notes/notes.dart';

class NotesNavigationAdapterImpl({required final Graph _router})
    implements NotesNavigationAdapter {
  @override
  Future<void> goDetail() async {
    _router.navigator.navigate('/notes/detail');
  }

  @override
  Future<void> goProfile() async {
    _router.navigator.navigate('/profile');
  }
}
