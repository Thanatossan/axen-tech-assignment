class Person {
  final String id;
  final String name;
  final String email;
  final String? imageUrl;

  Person({
    required this.id,
    required this.name,
    required this.email,
    this.imageUrl,
  });
}
