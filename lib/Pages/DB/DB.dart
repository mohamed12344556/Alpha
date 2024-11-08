// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

// import 'Doctor.dart';

// class DatabaseHelper {
//   static const _databaseName = 'doctors.db';
//   static const _databaseVersion = 1;

//   static const table = 'doctors';

//   DatabaseHelper._privateConstructor();
//   static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

//   static Database? _database;

//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDatabase();
//     return _database!;
//   }

//   _initDatabase() async {
//     var dbPath = await getDatabasesPath();
//     String path = join(dbPath, _databaseName);
//     return await openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
//   }

//   Future _onCreate(Database db, int version) async {
//     await db.execute('''
//       CREATE TABLE $table (
//         id INTEGER PRIMARY KEY,
//         name TEXT,
//         yearsOfExperience INTEGER,
//         rating REAL,
//         specialty TEXT,
//         imagePath TEXT
//       )
//     ''');
//   }

//   Future<int> insertDoctor(Doctor doctor) async {
//     Database db = await instance.database;
//     return await db.insert(table, doctor.toMap());
//   }

//   Future<List<Doctor>> getDoctors() async {
//     Database db = await instance.database;
//     var res = await db.query(table);
//     List<Doctor> doctors = res.isNotEmpty
//         ? res.map((c) => Doctor.fromMap(c)).toList()
//         : [];
//     return doctors;
//   }
// }

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'Doctor.dart';

class DatabaseHelper {
  // معلومات قاعدة البيانات
  static const _databaseName = 'doctors.db';
  static const _databaseVersion = 1;
  static const table = 'doctors';

  // Singleton و Constructor خاص
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // متغير لتخزين قاعدة البيانات
  static Database? _database;

  // Getter للوصول إلى قاعدة البيانات
  Future<Database?> get db async {
    if (_database != null && _database!.isOpen) {
      return _database;
    }
    _database = await _initDatabase();
    return _database;
  }

  // الوصول إلى قاعدة البيانات باستخدام اسم `database`
  Future<Database> get database async {
    if (_database != null && _database!.isOpen) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // تهيئة قاعدة البيانات
  Future<Database> _initDatabase() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  // إنشاء الجدول
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $table (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      yearsOfExperience INTEGER,
      rating REAL,
      specialty TEXT,
      imagePath TEXT
    )
  ''');
  }

  // التعامل مع تحديثات قاعدة البيانات
  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    log('Database upgrade from version $oldVersion to $newVersion');
    // يمكن إضافة الأعمدة الجديدة هنا عند التحديث
  }

  // دالة إدراج بيانات الطبيب في قاعدة البيانات
  Future<int> insertDoctor(Doctor doctor) async {
    Database db = await instance.database;

    // تحقق من عدم وجود id
    var existingDoctor = await db.query(
      table,
      where: 'id = ?',
      whereArgs: [doctor.id],
    );

    if (existingDoctor.isNotEmpty) {
      debugPrint('Doctor with ID ${doctor.id} already exists.');
      return -1; // تعني أن الإدراج فشل بسبب تكرار ID
    }

    int response = await db.insert(table, doctor.toMap());
    debugPrint('Insert Response: $response');
    return response;
  }

  // دالة قراءة بيانات الأطباء من قاعدة البيانات
  Future<List<Doctor>> getDoctors() async {
    Database db = await database;
    final List<Map<String, dynamic>> response = await db.query(table);
    List<Doctor> doctors = response.map((row) => Doctor.fromMap(row)).toList();
    debugPrint(doctors.toString());
    return doctors;
  }

  // دالة تحديث بيانات الطبيب
  Future<int> updateDoctor(Doctor doctor) async {
    Database db = await database;
    int response = await db.update(
      table,
      doctor.toMap(),
      where: 'id = ?',
      whereArgs: [doctor.id],
    );
    debugPrint('Update Response: $response');
    return response;
  }

  // دالة حذف بيانات الطبيب
  Future<int> deleteDoctor(int id) async {
    Database db = await database;
    int response = await db.delete(
      table,
      where: 'id = ?',
      whereArgs: [id],
    );
    debugPrint('Delete Response: $response');
    return response;
  }

  // دالة حذف قاعدة البيانات بالكامل
  Future<void> deleteDB() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, _databaseName);
    await deleteDatabase(path);
    debugPrint('Database has been deleted: $path');
  }
}
