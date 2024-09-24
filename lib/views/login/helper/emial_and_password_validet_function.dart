String? validateEmail(String value) {
  if (value.isEmpty) {
    return 'Field cannot be empty';
  } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
      .hasMatch(value)) {
    return 'Enter a valid email';
  }
  return null;
}

String? validatePassword(String value) {
  if (value.isEmpty) {
    return 'Field cannot be empty';
  } else if (value.length < 6) {
    return 'Password must be at least 6 characters long';
  }
  return null;
}
