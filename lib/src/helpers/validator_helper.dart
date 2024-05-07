String? requiredValidatorCallback(value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a value';
  }
  return null;
}

String? numberValidatorCallback(value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a value';
  }
  final n = int.tryParse(value);
  if (n == null) {
    return 'Please enter a valid number';
  }
  return null;
}

String? decimalValidatorCallback(value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a value';
  }
  final n = double.tryParse(value);
  if (n == null) {
    return 'Please enter a valid decimal';
  }
  return null;
}

String? dropdownValidatorCallback(value) {
  if (value == null) {
    return 'Please select an option';
  }
  return null;
}