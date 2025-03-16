// ignore_for_file: inference_failure_on_uninitialized_variable, unused_local_variable

import 'dart:developer';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:asalhapuja/domain/models/models.dart';
import 'package:sqflite/sqflite.dart';

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
    return openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<dynamic> _onCreate(Database db, int version) async {
    final batch = db.batch();

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
    tahun_ikut      TEXT        ,
    clothes_size    TEXT        ,
    white_cloth_size TEXT        ,
    white_pants_size TEXT        ,
    isUpload        INTEGER (1) DEFAULT (0), 
    active          INTEGER (1)   NOT NULL 
    )
    WITHOUT ROWID;
    ''');

    batch.execute('''
    CREATE TABLE IF NOT EXISTS region (
    id INTEGER    PRIMARY KEY,
    vihara      TEXT    NOT NULL
    )
    WITHOUT ROWID;
    ''');

    batch.execute('''
    CREATE TABLE IF NOT EXISTS user (
    nik TEXT PRIMARY KEY
    )
    WITHOUT ROWID;
    ''');

    final res = await batch.commit();
    log('res: $res');
  }

  Future<void> closeDB() async {
    await DBHelper.instance.database.then((db) async {
      await db.close();
    });
  }

  Future<void> openDB() async {
    final databasePath = await getApplicationDocumentsDirectory();
    final path = join(databasePath.path, 'asalhapuja.db');

    log('path: $path');

    _database = await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<List<Region>> getRegion() async {
    var data;
    await DBHelper.instance.database.then((db) async {
      data = await db.query('region', orderBy: 'id');
    });
    final region = <Region>[];
    final len = data.length as int;
    for (var i = 0; i < len; i++) {
      region.add(Region.fromJson(data[i] as Map<String, dynamic>));
    }
    log(region.toString());
    return region;
  }

  Future<List<Forms>> getPeserta(String vihara) async {
    var data;
    await DBHelper.instance.database.then((db) async {
      data = await db.query(
        'peserta',
        where: 'organization = ?',
        whereArgs: [vihara],
      );
    });
    final peserta = <Forms>[];
    final len = data.length as int;
    for (var i = 0; i < len; i++) {
      peserta.add(Forms.fromJson(data[i] as Map<String, dynamic>));
    }
    return peserta;
  }

  Future<Forms> getPesertabyNik(String nik) async {
    var data;
    await DBHelper.instance.database.then((db) async {
      data = await db.query(
        'peserta',
        orderBy: 'isUpload',
        where: 'ktp = ?',
        whereArgs: [nik],
        limit: 1,
      );
    });

    final peserta = Forms.fromJson(data[0] as Map<String, dynamic>);

    return peserta;
  }

  Future<List<Forms>> getPesertaAll() async {
    var data;
    await DBHelper.instance.database.then((db) async {
      data = await db.query('peserta', orderBy: 'isUpload');
    });
    final peserta = <Forms>[];
    final len = data.length as int;
    for (var i = 0; i < len; i++) {
      peserta.add(Forms.fromJson(data[i] as Map<String, dynamic>));
    }
    return peserta;
  }

  Future<int> getBlmUpload() async {
    var data;
    await DBHelper.instance.database.then((db) async {
      data = await db.query('peserta', where: 'isUpload = ?', whereArgs: [0]);
    });
    final peserta = <Forms>[];
    final len = data.length as int;
    for (var i = 0; i < len; i++) {
      peserta.add(Forms.fromJson(data[i] as Map<String, dynamic>));
    }
    return peserta.length;
  }

  Future<void> insertPeserta(Forms peserta) async {
    var data;
    await DBHelper.instance.database.then((db) async {
      data = await db.rawInsert(
        'INSERT INTO peserta ( nik,region_f_id,nik_koordinator,organization,ktp,name,printed_name,gender,address,phone_number,meal,photo, tahun_ikut, active, clothes_size, white_cloth_size, white_pants_size) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
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
          peserta.tahun_ikut,
          peserta.active,
          peserta.size,
          peserta.baju,
          peserta.celana,
        ],
      );
    });
  }

  Future<void> replacePeserta(Forms peserta) async {
    var data;
    await DBHelper.instance.database.then((db) async {
      data = await db.rawUpdate('''
      UPDATE peserta 
      SET region_f_id = ${peserta.region_f_id},
          organization = "${peserta.organization}",
          gender = "${peserta.gender}",
          address = "${peserta.address}",
          phone_number = "${peserta.phone_number}",
          meal = "${peserta.meal}",
          photo = "${peserta.photo}",
          tahun_ikut = "${peserta.tahun_ikut}",
          clothes_size = "${peserta.size}",
          white_cloth_size = "${peserta.baju}",
          white_pants_size = "${peserta.celana}",
          isUpload = 0
      WHERE nik = "${peserta.ktp}" AND ktp = "${peserta.ktp}"
''');
      print(data);
    });
  }

  Future<int> checkNik(String nik) async {
    var data;
    await DBHelper.instance.database.then((db) async {
      data = await db.query('peserta', where: 'nik = ?', whereArgs: [nik]);
    });
    return data.length as int;
  }

  Future<void> insertRegion(Region region) async {
    var data;
    await DBHelper.instance.database.then((db) async {
      data = await db.rawInsert(
        'INSERT INTO region (id, vihara) VALUES (?, ?)',
        [region.id, region.vihara],
      );
      // data = await db.insert('region', region.toJson());
    });
    log(data.toString());
  }

  // Future<String> updateQouta(int id, int quota) async {
  //   await DBHelper.instance.database.then((db) async {
  //     await db.update(
  //       'region',
  //       {'quota': quota},
  //       where: 'id = ?',
  //       whereArgs: [id],
  //     );
  //   });
  //   return 'Update Success';
  // }

  // Future<int> getQouta(int id) async {
  //   var data;
  //   await DBHelper.instance.database.then((db) async {
  //     data = await db.query(
  //       'region',
  //       columns: ['quota'],
  //       where: 'id = ?',
  //       whereArgs: [id],
  //     );
  //   });
  //   return data[0]['quota'] as int;
  // }

  Future<String> updatePeserta(String id) async {
    await DBHelper.instance.database.then((db) async {
      await db.update(
        'peserta',
        {'isUpload': 1},
        where: 'nik = ?',
        whereArgs: [id],
      );
    });
    return 'Perserta Upload Success';
  }

  Future<String> updateFotoPath(String id, String foto) async {
    final directory = await getExternalStorageDirectory();
    await DBHelper.instance.database.then((db) async {
      await db.update(
        'peserta',
        {'photo': '${directory!.path}/$foto'},
        where: 'nik = ?',
        whereArgs: [id],
      );
    });
    return 'Perserta PathFoto Updated';
  }

  Future<void> updateActive(String ktp, int active) async {
    await DBHelper.instance.database.then((db) async {
      await db.update(
        'peserta',
        {'active': active, 'isUpload': 0},
        where: 'ktp = ?',
        whereArgs: [ktp],
      );
    });
  }

  Future<void> deletePeserta(String id) async {
    await DBHelper.instance.database.then((db) async {
      await db.delete('peserta', where: 'nik = ?', whereArgs: [id]);
    });
  }

  Future<void> deleteAllData() async {
    await DBHelper.instance.database.then((db) async {
      await db.rawQuery('DELETE FROM peserta');
      await db.rawQuery('DELETE FROM region');
    });
  }

  Future<void> insertNIK(String nik) async {
    await DBHelper.instance.database.then((db) async {
      await db.rawInsert('INSERT INTO user (nik) VALUES (?)', [nik]);
    });
  }

  Future<int> checkStatus(String nik) async {
    var data;
    await DBHelper.instance.database.then((db) async {
      data = await db.query('user', where: 'nik = ?', whereArgs: [nik]);
    });
    return data.length as int;
  }
}
