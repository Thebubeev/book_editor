import 'package:book_editor/data/models/place_model.dart';
import 'package:book_editor/domain/repositories/sqflite_places_dao_repository_impl.dart';
import 'package:book_editor/presentation/screens/change_screen.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final PlaceModel place;
  final BuildContext context;
  final Function function;
  const CardWidget(
      {super.key,
      required this.place,
      required this.context,
      required this.function});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const SizedBox(
          height: 10,
        ),
        Text(
          place.bookName,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Имя автора - ${place.autorName}",
          style: const TextStyle(fontSize: 19, color: Colors.black),
        ),
        Text(
          "Название книги - ${place.bookName}",
          style: const TextStyle(fontSize: 19, color: Colors.black),
        ),
        Text(
          "Вид издания - ${place.typeEdition}",
          style: const TextStyle(fontSize: 19, color: Colors.black),
        ),
        Text(
          "Тираж - ${place.copies.toString()} шт",
          style: const TextStyle(fontSize: 19, color: Colors.black),
        ),
        Text(
          "Год издания - ${place.yearEdition}г",
          style: const TextStyle(fontSize: 19, color: Colors.black),
        ),
        Text(
          "Дата сдачи рукописи в печать - ${place.yearInPrint}г",
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 19, color: Colors.black),
        ),
        Text(
          "Дата выхода книги из печати - ${place.yearOutPrint}г",
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 19, color: Colors.black),
        ),
        Text(
          "Расходы на издание - ${place.expenses}р",
          style: const TextStyle(fontSize: 19, color: Colors.black),
        ),
        Text(
          "Цена за экземпляр - ${place.priceCopy}р",
          style: const TextStyle(fontSize: 19, color: Colors.black),
        ),
        Text(
          "Авторский гонорар - ${place.autorSalary}р",
          style: const TextStyle(fontSize: 19, color: Colors.black),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChangeScreen(
                                initialPlace: place,
                              )));
                },
                child: const Text('Редактировать')),
            ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.red)),
                onPressed: () async {
                  await showDialog(
                      context: context,
                      builder: (
                        context,
                      ) {
                        return AlertDialog(
                          backgroundColor: Colors.red,
                          title: const Text(
                            'Вы уверены, что хотите удалить?',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                          actionsAlignment: MainAxisAlignment.center,
                          actions: [
                            TextButton(
                                onPressed: () {
                                  SqflitePlacesDaoRepository().delete(place);
                                  function();
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  'Да',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                )),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  'Нет',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                )),
                          ],
                        );
                      });
                },
                child: const Text('Удалить'))
          ],
        ),
        const SizedBox(
          height: 10,
        ),
      ]),
    );
  }
}
