import 'package:floor/floor.dart';
import 'package:flutter_demo/plugin/sqlite/floor/entity/customer.dart';

@dao
abstract class CustomerDao {
  @Query('SELECT * FROM customer')
  Future<List<Customer>> queryAll();

  @Query('SELECT * FROM customer WHERE id = :id')
  Stream<Customer?> queryCustomerById(int id);

  @insert
  Future<void> insertCustomer(Customer customer);

  @delete
  Future<void> deletePerson(Customer customer);
}
