void validateMove(String? input) {
  if (input == null) {
    throw 'Invalid input data. It is not possible to enter null or empty value';
  }

  var regexp = RegExp(r"^([1-9][a-z])$");
  if (!regexp.hasMatch(input)) {
    throw 'Invalid input data. Please enter your move using format [Number][Letter]. For example: 1a';
  }
}