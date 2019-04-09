class ValidationMixin {
  String validateEmail(value) {
    if (!value.contains('@')) {
      return 'Please enter the email correctly';
    }
    return null;
  }

  String validatePassword(a) {
    if (a.length < 5) {
      return 'Please enter the password of min 5 character';
    }
    return null;
  }
}
