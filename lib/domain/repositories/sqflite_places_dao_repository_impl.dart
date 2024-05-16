import 'package:book_editor/data/models/place_model.dart';
import 'package:book_editor/data/models/places_dao.dart';
import 'package:book_editor/domain/providers/database_provider.dart';

// Объект класса содержит в себе процедуры корректировки, вставки,
// удаления и чтения записей из таблицы:
class SqflitePlacesDaoRepository  {
  final dao = PlacesDao();

  DatabaseProvider databaseProvider = DatabaseProvider.staticDataBase;


/* 
Процедура insert выполняет операцию вставки записи в таблицу. 
Процедура возвращает созданный объект PlaceModel. 
*/
  Future<PlaceModel> insert(PlaceModel place) async {
    final db = await databaseProvider.db();
    place.id = (await db.insert(dao.tableName, dao.toMap(place))).toString();
    return place;
  }

/* 
Процедура delete удаляет запись из таблицы. 
Процедура возвращает удаленных объект PlaceModel.  
*/
  Future<PlaceModel> delete(PlaceModel place) async {
    final db = await databaseProvider.db();
    await db.delete(dao.tableName,
        where: "${dao.columnId} = ?", whereArgs: [place.id]);
    return place;
  }

/* 
Процедура update выполняет корректировку записи в таблице. 
Процедура возвращает скорректированный объект PlaceModel.
*/
  Future<PlaceModel> update(PlaceModel place) async {
    final db = await databaseProvider.db();
    await db.update(dao.tableName, dao.toMap(place),
        where: "${dao.columnId} = ?", whereArgs: [place.id]);
    return place;
  }

// Процедура getPlacesDao возвращает список объектов PlaceModel из таблицы. 
  Future<List<PlaceModel>> getPlacesDao() async {
    final db = await databaseProvider.db();
    List<Map<String, dynamic>> maps = await db.query(dao.tableName);
    return dao.fromList(maps);
  }
}
