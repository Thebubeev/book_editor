import 'package:book_editor/data/models/place_model.dart';

// Общая модель базы данных
class PlacesDao {
  final tableName = 'places';
  final columnId = 'id';
  final _columnAutorName = 'autorName';
  final _columnBookName = 'bookName';
  final _columnTypeEdition = 'typeEdition';
  final _columnCopies = 'copies';
  final _columnYearEdition = 'yearEdition';
  final _columnYearInPrint = 'yearInPrint';
  final _columnYearOutPrint = 'yearOutPrint';
  final _columnExpenses = 'expenses';
  final _columnPriceCopy = 'priceCopy';
  final _columnAutorSalary = 'autorSalary';

  String get createTableQuery =>
      "CREATE TABLE $tableName($columnId INTEGER PRIMARY KEY,"
      " $_columnAutorName TEXT,"
      " $_columnBookName TEXT,"
      " $_columnTypeEdition TEXT,"
      " $_columnCopies TEXT,"
      " $_columnYearEdition TEXT,"
      " $_columnYearInPrint TEXT,"
      " $_columnYearOutPrint TEXT,"
      " $_columnExpenses TEXT,"
      " $_columnPriceCopy TEXT,"
      " $_columnAutorSalary TEXT)";

  PlaceModel fromMap(Map<String, dynamic> query) {
    PlaceModel place = PlaceModel(
      id: query[columnId].toString(),
      autorName: query[_columnAutorName],
      bookName: query[_columnBookName],
      typeEdition: query[_columnTypeEdition],
      copies: int.parse(query[_columnCopies]),
      yearEdition: query[_columnYearEdition],
      yearInPrint: query[_columnYearInPrint],
      yearOutPrint: query[_columnYearOutPrint],
      expenses: int.parse(query[_columnExpenses]),
      priceCopy: int.parse(query[_columnPriceCopy]),
      autorSalary: int.parse(query[_columnAutorSalary]),
    );
    return place;
  }

  Map<String, dynamic> toMap(PlaceModel object) {
    return <String, dynamic>{
      _columnAutorName: object.autorName,
      _columnBookName: object.bookName,
      _columnTypeEdition: object.typeEdition,
      _columnCopies: object.copies,
      _columnYearEdition: object.yearEdition,
      _columnYearInPrint: object.yearInPrint,
      _columnYearOutPrint: object.yearOutPrint,
      _columnExpenses: object.expenses,
      _columnPriceCopy: object.priceCopy,
      _columnAutorSalary: object.autorSalary,
    };
  }
  
  List<PlaceModel> fromList(List<Map<String, dynamic>> query) {
    List<PlaceModel> placesList = <PlaceModel>[];
    for (Map<String, dynamic> map in query) {
      placesList.add(fromMap(map));
    }
    return placesList;
  }
}
