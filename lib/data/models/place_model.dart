/* 
Объект класса будет выступать в роли стандартного объекта таблицы. 
Текущий объект будет использоваться для процедур вставки, удаления, 
корректировки и чтения записей.
*/
class PlaceModel {
  String id;
  final String autorName;
  final String bookName;
  final String typeEdition;
  final int copies;
  final String yearEdition;
  final String yearInPrint;
  final String yearOutPrint;
  final int expenses;
  final int priceCopy;
  final int autorSalary;
  PlaceModel(
      {required this.id,
      required this.autorName,
      required this.bookName,
      required this.typeEdition,
      required this.copies,
      required this.yearEdition,
      required this.yearInPrint,
      required this.yearOutPrint,
      required this.expenses,
      required this.priceCopy,
      required this.autorSalary});
}
