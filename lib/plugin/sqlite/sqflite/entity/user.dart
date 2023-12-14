class User {
  final int id;
  final String name;
  final int? age;
  final String? addr;

  User({required this.id, required this.name, this.age, this.addr});

  factory User.fromMap(Map<String, dynamic> map) => User(
        id: map["id"],
        name: map["name"],
        age: map["age"],
        addr: map["addr"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "age": age,
        "addr": addr,
      };
}
