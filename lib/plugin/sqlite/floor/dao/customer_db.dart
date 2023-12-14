// required package imports
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'package:flutter_demo/plugin/sqlite/floor/dao/customer_dao.dart';
import 'package:flutter_demo/plugin/sqlite/floor/entity/customer.dart';

part 'customer_db.g.dart'; // 编译时必须

@Database(version: 1, entities: [Customer])
abstract class CustomerDatabase extends FloorDatabase {
  CustomerDao get customerDao;
}
