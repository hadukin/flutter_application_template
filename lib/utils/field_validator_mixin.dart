mixin FieldValidatorMixin {
  static const _patternEmail =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  bool isValidEmail(String email) {
    final RegExp regex = RegExp(_patternEmail);
    return regex.hasMatch(email);
  }
}
