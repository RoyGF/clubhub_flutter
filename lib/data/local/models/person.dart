class Person {
  String id;
  String name;
  String surname;
  String email;
  String phone;
  String cell;
  String imageURL;
  int age;

  Person({
    required this.id,
    required this.name,
    required this.surname,
    required this.email,
    required this.phone,
    required this.cell,
    required this.imageURL,
    required this.age,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'surname': surname,
      'email': email,
      'phone': phone,
      'cell': cell,
      'imageURL': imageURL,
      'age': age,
    };
  }

  String getFullName() {
    return '$name $surname';
  }

  @override
  String toString() {
    return 'Person{id: $id, name: $name, surname: $surname, email: $email, phone: $phone, cell: $cell, imageURL: $imageURL, age: $age}';
  }
}
