import 'package:floor/floor.dart';

@entity
class Customer {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String? name;
  int? age;
  String? addr;

  Customer({this.id, this.name, this.age, this.addr});

  factory Customer.fromMap(Map<String, dynamic> map) => Customer(
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
