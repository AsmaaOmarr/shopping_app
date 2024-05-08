import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shopping_app/features/authentication/models/user.dart';
import 'package:shopping_app/features/home/models/store.dart';

class DatabaseService {
  static const String _dbName = 'shopping_app.db';
  static const String _userTable = 'users';
  static const String _storeTable = 'stores';
  static const String _favStoresTable = 'fav_stores'; // New table

  static Future<Database> _getDb() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, _dbName);
    return openDatabase(path,
        version: 2, onCreate: _onCreate); // Version updated
  }

  static Future<void> _onCreate(Database db, int version) async {
    // Create users table
    await db.execute('''
      CREATE TABLE $_userTable(
        id INTEGER PRIMARY KEY,
        image BLOB,
        name TEXT,
        email TEXT UNIQUE,
        password TEXT
      )
    ''');

    // Create stores table
    await db.execute('''
      CREATE TABLE $_storeTable(
        id INTEGER PRIMARY KEY,
        name TEXT,
        address TEXT,
        imageUrl TEXT,
        latitude REAL,
        longitude REAL
      )
    ''');

    // Create user favorite stores table
    await db.execute('''
      CREATE TABLE $_favStoresTable(
        id INTEGER PRIMARY KEY,
        user_email TEXT,
        store_id INTEGER,
        FOREIGN KEY (user_email) REFERENCES $_userTable(email) ON DELETE CASCADE,
        FOREIGN KEY (store_id) REFERENCES $_storeTable(id) ON DELETE CASCADE
      )
    ''');
  }

  static Future<void> addUser(User user) async {
    final db = await _getDb();
    await db.insert(_userTable, user.toJson());
  }

  static Future<bool> doesEmailExist(String email) async {
    final db = await _getDb();
    final List<Map<String, dynamic>> maps = await db.query(
      _userTable,
      columns: ['email'],
      where: 'email = ?',
      whereArgs: [email],
    );
    return maps.isNotEmpty;
  }

  static Future<bool> doEmailAndPasswordMatch(
      String email, String password) async {
    final db = await _getDb();
    final List<Map<String, dynamic>> maps = await db.query(
      _userTable,
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    return maps.isNotEmpty;
  }

  static Future<void> saveStores(List<StoreModel> stores) async {
    final db = await _getDb();
    for (var store in stores) {
      await db.insert(_storeTable, store.toJson());
    }
  }

  static Future<List<StoreModel>> getAllStores() async {
    final db = await _getDb();
    final List<Map<String, dynamic>> maps = await db.query(_storeTable);
    return List.generate(maps.length, (i) {
      return StoreModel(
        id: maps[i]['id'],
        name: maps[i]['name'],
        address: maps[i]['address'],
        imageUrl: maps[i]['imageUrl'],
        latitude: maps[i]['latitude'],
        longitude: maps[i]['longitude'],
      );
    });
  }

  static Future<void> addToFavoriteStores(String userEmail, int storeId) async {
    final db = await _getDb();
    await db.insert(
        _favStoresTable, {'user_email': userEmail, 'store_id': storeId});
  }

  static Future<void> removeFromFavoriteStores(
      String userEmail, int storeId) async {
    final db = await _getDb();
    await db.delete(
      _favStoresTable,
      where: 'user_email = ? AND store_id = ?',
      whereArgs: [userEmail, storeId],
    );
  }

  static Future<List<int>> getUserFavStoreIds(String userEmail) async {
    final db = await _getDb();
    final List<Map<String, dynamic>> maps = await db.query(
      _favStoresTable,
      columns: ['store_id'],
      where: 'user_email = ?',
      whereArgs: [userEmail],
    );
    return List.generate(maps.length, (i) {
      return maps[i]['store_id'] as int;
    });
  }

  static Future<List<StoreModel>> getFavoriteStores(String userEmail) async {
    final db = await _getDb();
    final List<Map<String, dynamic>> maps = await db.rawQuery('''
    SELECT $_storeTable.*
    FROM $_storeTable
    JOIN $_favStoresTable ON $_storeTable.id = $_favStoresTable.store_id
    WHERE $_favStoresTable.user_email = ?
  ''', [userEmail]);
    return List.generate(maps.length, (i) {
      return StoreModel(
        id: maps[i]['id'],
        name: maps[i]['name'],
        address: maps[i]['address'],
        imageUrl: maps[i]['imageUrl'],
        latitude: maps[i]['latitude'],
        longitude: maps[i]['longitude'],
      );
    });
  }
}
