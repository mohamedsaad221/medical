import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:medical/model/user_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class LocalDB {
  static final LocalDB instance = LocalDB._init();

  static Database? _database;

  LocalDB._init();

  static const _dbName = 'medical.db';

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB(_dbName);
    return _database!;
  }

  Future<Database> _initDB(String dbName) async {
    final appDocDir = await getApplicationDocumentsDirectory();
    final appDocPath = appDocDir.path;
    final dbPath = '$appDocPath/$dbName';

    debugPrint('----- database created successfully at: $dbPath -----');

    return await openDatabase(dbPath, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    // const intType = 'INTEGER NOT NULL';
    const textType = 'TEXT NOT NULL';
    // const textTypeNull = 'TEXT';

    await db.execute('''
    CREATE TABLE $tableUser (
    ${LocalUserModelFields.userId} INTEGER PRIMARY KEY,
    ${LocalUserModelFields.userName} $textType,
    ${LocalUserModelFields.email} $textType,
    ${LocalUserModelFields.phone} $textType,
    ${LocalUserModelFields.password} $textType,
    ${LocalUserModelFields.gender} $textType
    )
    ''');
  }

  /// working with [saveUserData] ////////////////////////////////////
  Future<void> saveUserData({
    required LocalUserModel localUserModel,
  }) async {
    final db = await instance.database;
    await db.insert(
      tableUser,
      localUserModel.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Future<List<LocalVisitedSchoolsModel>> getVisitedSchoolsData() async {
  //   final db = await instance.database;
  //
  //   List<Map<String, dynamic>> maps = await db.query(
  //     tableVisitedSchools,
  //     columns: LocalVisitedSchoolsFields.values,
  //   );
  //
  //   if (maps.isNotEmpty) {
  //     List<LocalVisitedSchoolsModel> items = maps
  //         .map((element) => LocalVisitedSchoolsModel.fromJson(element))
  //         .toList();
  //
  //     debugPrint(
  //         '----- maps values ${maps.map((e) => e.values).toString()} -----');
  //     debugPrint('----- items length ${items.length.toString()} ------');
  //
  //     return items;
  //   } else {
  //     return [];
  //   }
  // }
  //
  // Future<LocalVisitedSchoolsModel?> getSingleVisitedSchoolsData(
  //     int? schoolId) async {
  //   final db = await instance.database;
  //
  //   List<Map<String, dynamic>> maps = await db.query(
  //     tableVisitedSchools,
  //     columns: LocalVisitedSchoolsFields.values,
  //     where: '${LocalVisitedSchoolsFields.schoolId} = ?',
  //     whereArgs: [schoolId],
  //   );
  //
  //   if (maps.isNotEmpty) {
  //     return LocalVisitedSchoolsModel.fromJson(maps.first);
  //   }
  //
  //   return null;
  // }
  //
  // Future<int> updateVisitedSchoolData(LocalVisitedSchoolsModel localVisitedSchoolsModel) async {
  //   final db = await instance.database;
  //
  //   return await db.update(
  //     tableVisitedSchools,
  //     localVisitedSchoolsModel.toJson(),
  //     where: '${LocalVisitedSchoolsFields.schoolId} = ?',
  //     whereArgs: [localVisitedSchoolsModel.schoolId],
  //   );
  // }
  //
  // /// working with [saveVisitAssessData] ///////////////////////////////////////
  // Future<void> saveVisitAssessData({
  //   required LocalVisitAssessModel localVisitAssessModel,
  //   required String schoolId,
  // }) async {
  //   List<LocalVisitAssessModel> list = await getVisitAssessData();
  //
  //   if (list.isNotEmpty) {
  //     for (var item in list) {
  //       if (item.settingKpiId == localVisitAssessModel.settingKpiId) {
  //         int updateCode = await updateAssesData(localVisitAssessModel);
  //
  //         if (updateCode == 1) {
  //           debugPrint('----- updateCode: $updateCode -----');
  //           debugPrint('----- تم تعديل المعيار -----');
  //           showToast(
  //               text: 'تم تعديل المعيار', stateColor: ShowToastColor.success);
  //         } else {
  //           debugPrint('----- updateCode: $updateCode -----');
  //         }
  //       }
  //     }
  //
  //     final db = await instance.database;
  //     await db
  //         .insert(
  //       tableVisitAssess,
  //       localVisitAssessModel.toJson(),
  //     )
  //         .then((value) {
  //       debugPrint('----- تم حفظ المعيار -----');
  //       showToast(text: 'تم حفظ المعيار', stateColor: ShowToastColor.success);
  //     });
  //   } else {
  //     final db = await instance.database;
  //     await db
  //         .insert(
  //       tableVisitAssess,
  //       localVisitAssessModel.toJson(),
  //     )
  //         .then((value) {
  //       debugPrint('----- تم حفظ المعيار -----');
  //       showToast(text: 'تم حفظ المعيار', stateColor: ShowToastColor.success);
  //     });
  //   }
  // }
  //
  // Future<List<LocalVisitAssessModel>> getVisitAssessData() async {
  //   final db = await instance.database;
  //
  //   List<Map<String, dynamic>> maps = await db.query(
  //     tableVisitAssess,
  //     columns: LocalVisitAssessModelFields.values,
  //   );
  //
  //   if (maps.isNotEmpty) {
  //     List<LocalVisitAssessModel> items = maps
  //         .map((element) => LocalVisitAssessModel.fromJson(element))
  //         .toList();
  //
  //     debugPrint(
  //         '----- maps values ${maps.map((e) => e.values).toString()} -----');
  //     debugPrint('----- items length ${items.length.toString()} ------');
  //
  //     return items;
  //   } else {
  //     return [];
  //   }
  // }
  //
  // Future<int> deleteAssessRawData(int schoolId, int settingKpiId) async {
  //   final db = await instance.database;
  //   return await db.rawDelete(
  //       'DELETE FROM $tableVisitAssess WHERE ${LocalVisitAssessModelFields.schoolId} = ? AND ${LocalVisitAssessModelFields.settingKpiId} = ?',
  //       [schoolId, settingKpiId]);
  // }
  //
  // Future<void> deleteAllAssessData(
  //     {required List<LocalVisitAssessModel> localVisitAssessList}) async {
  //   for (var item in localVisitAssessList) {
  //     await deleteAssessRawData(item.schoolId!, item.settingKpiId!);
  //   }
  // }
  //
  // Future<int> updateAssesData(LocalVisitAssessModel localVisitAssessModel) async {
  //   final db = await instance.database;
  //
  //   return await db.update(
  //     tableVisitAssess,
  //     localVisitAssessModel.toJson(),
  //     where: '${LocalVisitAssessModelFields.settingKpiId} = ?',
  //     whereArgs: [localVisitAssessModel.settingKpiId],
  //   );
  // }
  //
  // /// working with [saveAttachAssessData] //////////////////////////////////////
  // Future<void> saveAttachAssessData({
  //   required LocalAttachmentModel localAttachmentAssessModel,
  //   required String schoolId,
  // }) async {
  //   final db = await instance.database;
  //   await db
  //       .insert(
  //     tableAttachAssess,
  //     localAttachmentAssessModel.toJson(),
  //   )
  //       .then((value) {
  //     debugPrint('----- تم حفظ الملف بنجاح -----');
  //     showToast(text: 'تم حفظ الملف بنجاح', stateColor: ShowToastColor.success);
  //   });
  // }
  //
  // Future<List<LocalAttachmentModel>> getVisitAttachData() async {
  //   final db = await instance.database;
  //
  //   List<Map<String, dynamic>> maps = await db.query(
  //     tableAttachAssess,
  //     columns: LocalAttachmentModelFields.values,
  //     // where: '${LocalAttachmentModelFields.schoolId} = ?',
  //     // whereArgs: [schoolId],
  //   );
  //
  //   if (maps.isNotEmpty) {
  //     List<LocalAttachmentModel> items = maps
  //         .map((element) => LocalAttachmentModel.fromJson(element))
  //         .toList();
  //
  //     debugPrint(
  //         '----- maps values ${maps.map((e) => e.values).toString()} -----');
  //     debugPrint('----- items length ${items.length.toString()} ------');
  //
  //     return items;
  //   } else {
  //     return [];
  //   }
  // }
  //
  // Future<int> updateAttachData(
  //     LocalAttachmentModel localAttachmentModel) async {
  //   final db = await instance.database;
  //
  //   return await db.update(
  //     tableAttachAssess,
  //     localAttachmentModel.toJson(),
  //     where: '${LocalAttachmentModelFields.id} = ?',
  //     whereArgs: [localAttachmentModel.id],
  //   );
  // }
  //
  // Future<int> deleteAttachRawData(
  //     int id, int schoolId, int settingKpiId, String attachmentType) async {
  //   final db = await instance.database;
  //
  //   return await db.rawDelete(
  //       'DELETE FROM $tableAttachAssess WHERE ${LocalAttachmentModelFields.id} = ? AND ${LocalAttachmentModelFields.schoolId} = ? AND ${LocalAttachmentModelFields.settingKpiId} = ? AND ${LocalAttachmentModelFields.attachmentType} = ?',
  //       [id, schoolId, settingKpiId, attachmentType]);
  // }
  //
  // Future<void> deleteAllAttachData(
  //     {required List<LocalAttachmentModel> localAttachmentList}) async {
  //   for (var item in localAttachmentList) {
  //     await deleteAttachRawData(
  //         item.id!, item.schoolId!, item.settingKpiId!, item.attachmentType!);
  //   }
  // }
  //
  // /// working with [closeDB] //////////////////////////////////////
  // Future closeDB() async {
  //   final db = await instance.database;
  //   db.close();
  // }
  //
  // Future deleteDB(String tableName) async {
  //   final db = await instance.database;
  //   db.delete(tableName);
  // }

}
