import 'package:book_editor/data/models/place_model.dart';
import 'package:book_editor/domain/repositories/sqflite_places_dao_repository_impl.dart';
import 'package:book_editor/presentation/screens/change_screen.dart';
import 'package:book_editor/presentation/widgets/button_widget.dart';
import 'package:book_editor/presentation/widgets/card_widget.dart';
import 'package:book_editor/presentation/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<PlaceModel> places = [];
  String controller = '';

  @override
  void initState() {
    getPlaces();
    super.initState();
  }


  getPlaces() async {
    final updatedPlaces = await SqflitePlacesDaoRepository().getPlacesDao();
    setState(() {
      places = updatedPlaces;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(children: [
          const TitleWidget(),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(10)),
              child: TextFormField(
                onChanged: (val) {
                  setState(() {
                    controller = val;
                  });
                },
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                    label: Text(
                      'Введите значение для поиска',
                      style: TextStyle(color: Colors.white),
                    ),
                    icon: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 30,
                      ),
                    )),
              ),
            ),
          ),
          SizedBox(
            height: 500,
            child: ListView.builder(
              itemCount: places.length,
              itemBuilder: (BuildContext context, int index) {
                final place = places[index];
                if (controller.isEmpty) {
                  return CardWidget(
                      place: place,
                      context: context,
                      function: getPlaces);
                }
                if (places[index]
                    .bookName
                    .toLowerCase()
                    .startsWith(controller.toLowerCase())) {
                  return CardWidget(
                      place: place,
                      context: context,
                      function: getPlaces);
                }
                return Container();
              },
            ),
          ),
          ButtonWidget(
            text: 'Добавить запись в БД',
            function: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ChangeScreen()));
            },
          ),
        ]),
      ),
    );
  }
}
