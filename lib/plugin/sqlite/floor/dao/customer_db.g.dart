// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_db.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorCustomerDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$CustomerDatabaseBuilder databaseBuilder(String name) =>
      _$CustomerDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$CustomerDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$CustomerDatabaseBuilder(null);
}

class _$CustomerDatabaseBuilder {
  _$CustomerDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$CustomerDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$CustomerDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<CustomerDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$CustomerDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$CustomerDatabase extends CustomerDatabase {
  _$CustomerDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  CustomerDao? _customerDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Customer` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT, `age` INTEGER, `addr` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  CustomerDao get customerDao {
    return _customerDaoInstance ??= _$CustomerDao(database, changeListener);
  }
}

class _$CustomerDao extends CustomerDao {
  _$CustomerDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _customerInsertionAdapter = InsertionAdapter(
            database,
            'Customer',
            (Customer item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'age': item.age,
                  'addr': item.addr
                },
            changeListener),
        _customerDeletionAdapter = DeletionAdapter(
            database,
            'Customer',
            ['id'],
            (Customer item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'age': item.age,
                  'addr': item.addr
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Customer> _customerInsertionAdapter;

  final DeletionAdapter<Customer> _customerDeletionAdapter;

  @override
  Future<List<Customer>> queryAll() async {
    return _queryAdapter.queryList('SELECT * FROM customer',
        mapper: (Map<String, Object?> row) => Customer(
            id: row['id'] as int?,
            name: row['name'] as String?,
            age: row['age'] as int?,
            addr: row['addr'] as String?));
  }

  @override
  Stream<Customer?> queryCustomerById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM customer WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Customer(
            id: row['id'] as int?,
            name: row['name'] as String?,
            age: row['age'] as int?,
            addr: row['addr'] as String?),
        arguments: [id],
        queryableName: 'Customer',
        isView: false);
  }

  @override
  Future<void> insertCustomer(Customer customer) async {
    await _customerInsertionAdapter.insert(customer, OnConflictStrategy.abort);
  }

  @override
  Future<void> deletePerson(Customer customer) async {
    await _customerDeletionAdapter.delete(customer);
  }
}
