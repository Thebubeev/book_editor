import 'package:book_editor/data/models/place_model.dart';
import 'package:book_editor/data/models/places_dao.dart';
import 'package:book_editor/domain/providers/database_provider.dart';

class SqflitePlacesDaoRepository  {
  final dao = PlacesDao();

  DatabaseProvider databaseProvider = DatabaseProvider.staticDataBase;


// Операция добавления
  Future<PlaceModel> insert(PlaceModel place) async {
    final db = await databaseProvider.db();
    place.id = (await db.insert(dao.tableName, dao.toMap(place))).toString();
    return place;
  }

// Операция удаления  
  Future<PlaceModel> delete(PlaceModel place) async {
    final db = await databaseProvider.db();
    await db.delete(dao.tableName,
        where: "${dao.columnId} = ?", whereArgs: [place.id]);
    return place;
  }

// Операция корректировки
  Future<PlaceModel> update(PlaceModel place) async {
    final db = await databaseProvider.db();
    await db.update(dao.tableName, dao.toMap(place),
        where: "${dao.columnId} = ?", whereArgs: [place.id]);
    return place;
  }

// Операция чтения
  Future<List<PlaceModel>> getPlacesDao() async {
    final db = await databaseProvider.db();
    List<Map<String, dynamic>> maps = await db.query(dao.tableName);
    return dao.fromList(maps);
  }
}
