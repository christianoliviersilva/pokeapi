import 'package:minha_pokedex/src/infra/contracts/local_storage_provider.dart';
import 'package:sqflite/sqflite.dart';

class LocalStorageProviderImpl implements LocalStorageProvider {
  final Future<Database> database;

  LocalStorageProviderImpl({
    required this.database,
  });

  @override
  Future<int> insertItem(String tableName, Map<String, dynamic> values) async {
    final db = await database;

    return await db.insert(tableName, values);
  }

  @override
  Future<Map<String, Object?>> getItem({
    required String tableName,
    required List<String> values,
    required int itemId,
  }) async {
    final db = await database;

    try {
      final resultMaps = await db.query(
        tableName,
        columns: values,
        where: '_id = ?',
        whereArgs: [itemId],
      );

      return resultMaps.first;
    } catch (_) {
      throw Exception('ID: $itemId not found');
    }
  }

  @override
  Future<List<Map<String, Object?>>> getAllItems(String tableName) async {
    final db = await database;

    return await db.query(tableName);
  }

  @override
  Future<int> updateItem({
    required String tableName,
    required Map<String, dynamic> values,
    required int itemId,
  }) async {
    final db = await database;

    return await db.update(
      tableName,
      values,
      where: '_id = ?',
      whereArgs: [itemId],
    );
  }

  @override
  Future<int> deleteItem(String tableName, int itemId) async {
    final db = await database;

    return await db.delete(
      tableName,
      where: '_id = ?',
      whereArgs: [itemId],
    );
  }

  @override
  Future<int> deleteTable(String tableName) async {
    final db = await database;

    return await db.delete(tableName);
  }
}
