import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final _databaseName = "Movie.db";
  static final _databaseVersion = 1;

  static final table = 'bookmarks';
  static final title = 'title';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    String criacao = '''
          CREATE TABLE $table (
            $title TEXT NOT NULL
          )
          ''';
    await db.execute(criacao);
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  Future<int> queryRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $table'));
  }

  Future<List<Map<String, dynamic>>> getSingle(String title) async {
    Database db = await instance.database;
    return db.rawQuery('SELECT * FROM $table WHERE (?)', [title]);
  }

  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    String titleStr = row[title];
    return await db
        .update(table, row, where: '$title = ?', whereArgs: [titleStr]);
  }

  Future<int> delete(String title) async {
    Database db = await instance.database;
    return await db.delete(table, where: 'title = ?', whereArgs: [title]);
  }

  Future<void> insertBookmark({@required String title}) async {
    Map<String, dynamic> row = {DatabaseHelper.title: title};
    await insert(row);
  }

  Future<void> getAllBookmarks() async {
    final allRows = await queryAllRows();
    allRows.forEach((row) => print(row));
  }

  Future<void> deleteBookmark({@required String title}) async {
    final rowsDeleted = await delete(title);
    print('deleted $rowsDeleted row(s): title $title');
  }

  Future<bool> isBookmarked({@required String title}) async {
    List<Map<String, dynamic>> allRows = await queryAllRows();

    for (int i = 0; i < allRows.length; i++) {
      if (allRows[i].containsValue(title)) {
        return true;
      }
    }
    return false;
  }
}
