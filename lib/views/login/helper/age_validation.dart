String? validateAge(String? value) {
  if (value == null || value.isEmpty) {
    return 'Age is required';
  }

  final int? age = int.tryParse(value);

  if (age == null) {
    return 'Please enter a valid number';
  }

  if (age <= 0) {
    return 'Age must be greater than 0';
  }

  if (age > 120) {
    return 'Please enter a realistic age';
  }

  return null; // Age is valid
}
