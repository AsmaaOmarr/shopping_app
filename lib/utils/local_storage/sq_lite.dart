import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shopping_app/features/authentication/models/user.dart';
import 'package:shopping_app/features/home/models/store.dart';

class DatabaseService {
  static const String _dbName = 'shopping_app.db';
  static const String _userTable = 'users';
  static const String _storeTable = 'stores';

  static Future<Database> _getDb() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, _dbName);
    return openDatabase(path, version: 1, onCreate: _onCreate);
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
        longitude REAL,
        isFavorite INTEGER
      )
    ''');
  }

  static Future<void> addUser(User user) async {
    final db = await _getDb();
    await db.insert(_userTable, user.toJson());
  }

  static Future<void> removeUser(String email) async {
    final db = await _getDb();
    await db.delete(
      _userTable,
      where: 'email = ?',
      whereArgs: [email],
    );
  }

  static Future<List<User>> getAllUsers() async {
    final db = await _getDb();
    final List<Map<String, dynamic>> maps = await db.query(_userTable);
    return List.generate(maps.length, (i) {
      return User(
        image: maps[i]['image'],
        name: maps[i]['name'],
        email: maps[i]['email'],
        password: maps[i]['password'],
      );
    });
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
      columns: ['email'],
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    return maps.isNotEmpty;
  }

  static Future<void> saveStores(List<StoreModel> stores) async {
    final db = await _getDb();
    // First, clear the existing data
    //await db.delete(_storeTable);

    for (var store in stores) {
      await db.insert(_storeTable, store.toJson());
    }
  }

  static Future<void> removeAllStores() async {
    final db = await _getDb();
    await db.delete(_storeTable);
  }

  static Future<List<StoreModel>> getAllStores() async {
    final db = await _getDb();
    final List<Map<String, dynamic>> maps = await db.query(_storeTable);
    return List.generate(maps.length, (i) {
      return StoreModel(
        name: maps[i]['name'],
        address: maps[i]['address'],
        imageUrl: maps[i]['imageUrl'],
        latitude: maps[i]['latitude'],
        longitude: maps[i]['longitude'],
        isFavorite: maps[i]['isFavorite'] == 1,
      );
    });
  }

  static Future<void> addToFavorites(StoreModel store) async {
    final db = await _getDb();
    await db.update(
      _storeTable,
      {'isFavorite': 1},
      where: 'name = ?',
      whereArgs: [store.name],
    );
  }

  static Future<void> removeFromFavorites(StoreModel store) async {
    final db = await _getDb();
    await db.update(
      _storeTable,
      {'isFavorite': 0},
      where: 'name = ?',
      whereArgs: [store.name],
    );
  }

  static Future<List<StoreModel>> getFavoriteStores() async {
    final db = await _getDb();
    final List<Map<String, dynamic>> maps = await db.query(
      _storeTable,
      where: 'isFavorite = ?',
      whereArgs: [1],
    );
    return List.generate(maps.length, (i) {
      return StoreModel(
        name: maps[i]['name'],
        address: maps[i]['address'],
        imageUrl: maps[i]['imageUrl'],
        latitude: maps[i]['latitude'],
        longitude: maps[i]['longitude'],
        isFavorite: maps[i]['isFavorite'] == 1,
      );
    });
  }
}
