class User {
  final int id;
  final String firstName;
  final String lastName;
  final String about;
  final String image;
  final String email;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.about,
    required this.image,
    required this.email,
  });

  String get fullName => '$firstName $lastName';
}
