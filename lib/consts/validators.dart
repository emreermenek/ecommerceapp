class Validators {
  static String? emailValidator(String? email) {
    if (email!.isEmpty) {
      return "Enter an email";
    }
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      return "Please enter a valid email";
    }
    return null;
  }

  static String? displayNameValidator(String? name) {
    if (name == null || name.isEmpty) {
      return "Name cannot be empty";
    }
    if (name.length < 3 || name.length > 20) {
      return "Name must be between 3 to 20 characters";
    }
    return null;
  }

  static String? passwordValidator(String? password) {
    if (password!.isEmpty) {
      return "Please enter a password";
    }
    if (password.length < 6) {
      return "Password must be longer than 6 character";
    }
  }
}
