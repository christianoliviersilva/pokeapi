abstract class LocalStorageProvider {
  //db.insert('keyName', value)
  Future<int> insertItem(String tableName, Map<String, dynamic> values);

  //db.query('keyName')
  Future<Map<String, Object?>> getItem({
    required String tableName,
    required List<String> values,
    required int itemId,
  });

  Future<List<Map<String, Object?>>> getAllItems(String tableName);

  //db.update('keyName', value, where: 'id == ?', whereArgs: [item.id])
  Future<int> updateItem({
    required String tableName,
    required Map<String, dynamic> values,
    required int itemId,
  });

  //db.delete('keyName', value, where: 'id == ?', whereArgs: [item.id])
  Future<int> deleteItem(String tableName, int itemId);

  Future<int> deleteTable(String tableName);
}
