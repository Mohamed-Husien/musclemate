String? validateName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Name is required';
  }

  if (value.length < 2) {
    return 'Name must be at least 2 characters long';
  }

  if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
    return 'Name can only contain letters and spaces';
  }

  return null;
}
