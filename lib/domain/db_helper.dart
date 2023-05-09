import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:asalhapuja/domain/models/models.dart';
import 'package:sqflite/sqflite.dart';
import 'package:asalhapuja/data/utils/utils.dart';

class DBHelper {
  DBHelper._privateConstrctor();
  static final DBHelper instance = DBHelper._privateConstrctor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    // final databasePath = await getDatabasesPath();
    final databasePath = await getApplicationDocumentsDirectory();
    final path = join(databasePath.path, 'asalhapuja.db');

    // Only copy if the database doesn't exist
    // if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound) {
    //   // Load database from asset and copy
    //   File file = new File(path);

    //   if (!await file.exists()) {
    //     ByteData data = await rootBundle.load(path);
    //     List<int> bytes =
    //         data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

    //     // Save copied asset to documents
    //     await new File(path).writeAsBytes(bytes);
    //   }
    // }
    log('path: $path');
    return openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    final batch = db.batch();
    // batch.execute('DROP DATABASE IF EXISTS patrol.db');

    batch.execute('''
    CREATE TABLE IF NOT EXISTS peserta (
    nik             TEXT        PRIMARY KEY
                                NOT NULL,
    region_f_id     INTEGER     NOT NULL,
    nik_koordinator TEXT        NOT NULL,
    organization    TEXT        NOT NULL,
    ktp             TEXT        NOT NULL,
    name            TEXT        NOT NULL,
    printed_name    TEXT        NOT NULL,
    gender          TEXT (1)    NOT NULL,
    address         TEXT        NOT NULL,
    phone_number    TEXT        NOT NULL,
    meal            TEXT (2)    NOT NULL,
    photo           TEXT        NOT NULL,
    isUpload        INTEGER (1) DEFAULT (0) 
    )
    WITHOUT ROWID;
    ''');

    batch.execute('''
    CREATE TABLE IF NOT EXISTS region (
    id INTEGER    PRIMARY KEY,
    kabupaten   TEXT    NOT NULL,
    vihara      TEXT    NOT NULL,
    quota       INTEGER NOT NULL
    )
    WITHOUT ROWID;
    ''');

    List<dynamic> res = await batch.commit();
    log('res: $res');
  }

  Future<List<Region>> getRegion() async {
    var data;
    await DBHelper.instance.database.then((db) async {
      data = await db.query('region');
    });
    List<Region> region = [];
    int len = data.length as int;
    for (var i = 0; i < len; i++) {
      region.add(Region.fromJson(data[i] as Map<String, dynamic>));
    }
    print(region);
    return region;
  }

  Future<List<Forms>> getPeserta() async {
    var data;
    await DBHelper.instance.database.then((db) async {
      data = await db.query('peserta');
    });
    List<Forms> peserta = [];
    int len = data.length as int;
    for (var i = 0; i < len; i++) {
      peserta.add(Forms.fromJson(data[i] as Map<String, dynamic>));
    }
    return peserta;
  }

  Future insertPeserta(Forms peserta) async {
    var data;
    await DBHelper.instance.database.then((db) async {
      data = await db.rawInsert(
          'INSERT INTO peserta ( nik,region_f_id,nik_koordinator,organization,ktp,name,printed_name,gender,address,phone_number,meal,photo) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
          [
            peserta.ktp,
            peserta.region_f_id,
            peserta.nik_koordinator,
            peserta.organization,
            peserta.ktp,
            peserta.name,
            peserta.printed_name,
            peserta.gender,
            peserta.address,
            peserta.phone_number,
            peserta.meal,
            peserta.photo,
          ]);
    });
    return;
  }

  Future insertRegion(Region region) async {
    var data;
    await DBHelper.instance.database.then((db) async {
      data = await db.rawInsert(
          'INSERT INTO region (id, kabupaten, vihara, quota) VALUES (?, ?, ?, ?)',
          [
            region.id,
            region.kabupaten,
            region.vihara,
            region.quota,
          ]);
      // data = await db.insert('region', region.toJson());
    });
    print(data);
    return;
  }

  Future<int> updateQouta(int id, int quota) async {
    var data;
    await DBHelper.instance.database.then((db) async {
      data = await db.update(
        'region',
        {'quota': quota},
        where: 'id = ?',
        whereArgs: [id],
      );
    });
    return quota;
  }

  Future updatePeserta(int id) async {
    var data;
    await DBHelper.instance.database.then((db) async {
      data = await db.update(
        'peserta',
        {'isUpload': 1},
        where: 'nik = ?',
        whereArgs: [id],
      );
    });
    return;
  }
}
