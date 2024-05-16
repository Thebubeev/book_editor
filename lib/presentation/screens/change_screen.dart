import 'package:book_editor/data/models/place_model.dart';
import 'package:book_editor/domain/repositories/sqflite_places_dao_repository_impl.dart';
import 'package:book_editor/presentation/screens/main_screen.dart';
import 'package:book_editor/presentation/widgets/button_widget.dart';
import 'package:book_editor/presentation/widgets/card_date_widget.dart';
import 'package:book_editor/presentation/widgets/card_text_widget.dart';
import 'package:book_editor/presentation/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class ChangeScreen extends StatefulWidget {
  final PlaceModel? initialPlace;
  const ChangeScreen({super.key, this.initialPlace});

  @override
  State<ChangeScreen> createState() => _ChangeScreenState();
}

class _ChangeScreenState extends State<ChangeScreen> {
  late PlaceModel? placeModel;
  @override
  void initState() {
    setState(() {
      placeModel = widget.initialPlace;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController autorNameController =
        TextEditingController(text: placeModel?.autorName);
    TextEditingController bookNameController =
        TextEditingController(text: placeModel?.bookName);
    TextEditingController typeEditionController =
        TextEditingController(text: placeModel?.typeEdition);
    TextEditingController copiesController =
        TextEditingController(text: placeModel?.copies.toString());
    TextEditingController yearEditionController =
        TextEditingController(text: placeModel?.yearEdition);
    TextEditingController yearInPrintcontroller =
        TextEditingController(text: placeModel?.yearInPrint);
    TextEditingController yearOutPrintcontroller =
        TextEditingController(text: placeModel?.yearOutPrint);
    TextEditingController expensesController =
        TextEditingController(text: placeModel?.expenses.toString());
    TextEditingController priceCopyController =
        TextEditingController(text: placeModel?.priceCopy.toString());
    TextEditingController autorSalaryController = TextEditingController(
        text: widget.initialPlace?.autorSalary.toString());
    final formKey = GlobalKey<FormState>();

    
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MainScreen()));
            },
          ),
        ),
        body: Form(
          key: formKey,
          child: SafeArea(
            child: ListView(
              children: [
                const TitleWidget(),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Column(
                    children: [
                      CardTextWidget(
                        text: 'Имя автора',
                        controller: autorNameController,
                        isNumber: false,
                      ),
                      CardTextWidget(
                        text: 'Название книги',
                        controller: bookNameController,
                        isNumber: false,
                      ),
                      CardTextWidget(
                        text: 'Вид издания',
                        controller: typeEditionController,
                        isNumber: false,
                      ),
                      CardTextWidget(
                        text: 'Тираж',
                        controller: copiesController,
                        isNumber: true,
                      ),
                      CardTextWidget(
                        text: 'Год издания',
                        controller: yearEditionController,
                        isNumber: true,
                      ),
                      CardDateWidget(
                        text: 'Дата сдачи рукописи в печать',
                        controller: yearInPrintcontroller,
                      ),
                      CardDateWidget(
                        text: 'Дата выхода книги из печати',
                        controller: yearOutPrintcontroller,
                      ),
                      CardTextWidget(
                        text: 'Расходы на издания',
                        controller: expensesController,
                        isNumber: true,
                      ),
                      CardTextWidget(
                        text: 'Цена за экземпляр',
                        controller: priceCopyController,
                        isNumber: true,
                      ),
                      CardTextWidget(
                        text: 'Авторский гонорар',
                        controller: autorSalaryController,
                        isNumber: true,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 70, right: 70, bottom: 20),
                  child: ButtonWidget(
                    text: 'Сохранить',
                    function: () async {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        if (widget.initialPlace != null) {
                          await SqflitePlacesDaoRepository()
                              .update(PlaceModel(
                            id: widget.initialPlace!.id,
                            autorName: autorNameController.text.trim(),
                            bookName: bookNameController.text.trim(),
                            typeEdition: typeEditionController.text.trim(),
                            copies: int.parse(copiesController.text.trim()),
                            yearEdition: yearEditionController.text.trim(),
                            yearInPrint: yearInPrintcontroller.text.trim(),
                            yearOutPrint: yearOutPrintcontroller.text.trim(),
                            expenses: int.parse(expensesController.text.trim()),
                            priceCopy:
                                int.parse(priceCopyController.text.trim()),
                            autorSalary:
                                int.parse(autorSalaryController.text.trim()),
                          ))
                              .then((value) {
                            setState(() {
                              placeModel = value;
                            });
                          });
                        } else {
                          await SqflitePlacesDaoRepository().insert(PlaceModel(
                            id: '',
                            autorName: autorNameController.text.trim(),
                            bookName: bookNameController.text.trim(),
                            typeEdition: typeEditionController.text.trim(),
                            copies: int.parse(copiesController.text.trim()),
                            yearEdition: yearEditionController.text.trim(),
                            yearInPrint: yearInPrintcontroller.text.trim(),
                            yearOutPrint: yearOutPrintcontroller.text.trim(),
                            expenses: int.parse(expensesController.text.trim()),
                            priceCopy:
                                int.parse(priceCopyController.text.trim()),
                            autorSalary:
                                int.parse(autorSalaryController.text.trim()),
                          ));
                          setState(() {});
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
