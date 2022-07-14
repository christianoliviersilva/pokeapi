import 'dart:io';
import 'package:minha_pokedex/src/external/local_storage/pokemons/fav_pokemons_db_fields.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class FavPokemonsDbService {
  static final FavPokemonsDbService instance = FavPokemonsDbService._instance();
  FavPokemonsDbService._instance();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    if (Platform.isWindows || Platform.isLinux) {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
    }

    _database = await _initDb('favorites.db');
    return _database!;
  }

  Future<Database> _initDb(String databasesPath) async {
    final dbDirectory = await getApplicationDocumentsDirectory();
    final path = join(dbDirectory.path, databasesPath);

    try {
      await dbDirectory.create(recursive: true);

      return await openDatabase(
        path,
        version: 1,
        onCreate: _createDb,
      );
    } catch (_) {
      throw Exception('Caminho do database não existe');
    }
  }

  Future<void> _createDb(Database db, int version) async {
    final intType = 'INTEGER';
    final textType = 'TEXT NOT NULL';

    await db.execute(
      '''CREATE TABLE $favPokemonsTable (
      ${FavPokemonsFields.id} $intType,
      ${FavPokemonsFields.pokedexNumber} $intType,
      ${FavPokemonsFields.name} $textType,
      ${FavPokemonsFields.imageUrl} $textType,
      ${FavPokemonsFields.types} $textType
      )''',
    );
  }

  Future<void> closeDb() async {
    final db = await instance.database;

    db.close();
  }
}
