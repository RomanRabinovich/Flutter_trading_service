

class EmailValidator {
  static String? email(String? value) {
    const emailRegex =
    r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";

    if (!RegExp(emailRegex).hasMatch(value!)) return "Invalid E-Mail address";

    return null;
  }
}

class PasswordValidator {
  static String? password(String? value) {
    const passwordRegex =
    r"""^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^a-zA-Z0-9_]).{8,}$""";
    if (!RegExp(passwordRegex).hasMatch(value!))
      return "Password must contain at least 8 character, at least one capital letter, one special symbol and one number!";
    return null;
  }
}

class RequiredValidator {
  static String? required(String? value) {
    if (value == null || '$value'.isEmpty) return "Value is required";
    return null;
 }
}

// abstract class Validators<T> {
//   static Function compose(List<Function> validators) {
//     return (value) {
//       String result;
//       for (final fn in validators) {
//         result = fn(value);
//
//         if (result != null) return result;
//       }
//
//       return null;
//     };
//   }
//
//
//
//   static String? required(String? value) {
//     if (value == null || '$value'.isEmpty) return "Value is required";
//     return null;
//   }
//
//   static String? phone(String? value) {
//     const phoneRegex = r"""^(\+[0-9]{11,12})$""";
//     if (!RegExp(phoneRegex).hasMatch(value!)) return "Invalid Phone Number";
//     return null;
//   }
//
//   static String? password(String? value) {
//     const passwordRegex =
//     r"""^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^a-zA-Z0-9_]).{8,}$""";
//     if (!RegExp(passwordRegex).hasMatch(value!))
//       return "Password must contain at least 8 character, at least one capital letter, one special symbol and one number!";
//     return null;
//   }
//
//   static String? email(String? value) {
//     const emailRegex =
//     r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
//
//     if (!RegExp(emailRegex).hasMatch(value!)) return "Invalid E-Mail address";
//
//     return null;
//   }
//
//   static String? zipcode(String? value) {
//     const zipcodeRegex = r"""^\d{5}(?:[-\s]\d{4})?$""";
//     if (!RegExp(zipcodeRegex).hasMatch(value!))
//       return 'Zip-code should be 5-digits long';
//     return null;
//   }
// }
