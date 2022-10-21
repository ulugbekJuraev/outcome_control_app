import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outcome_app/providers/note_provider.dart';
import 'package:outcome_app/providers/outcome_type_provider.dart';
import 'package:provider/provider.dart';
import '../cashAddComps/const_input.dart';
import '../listWheel/list_wheel.dart';
import 'cash_add_btn.dart';

class CashModalContainer extends StatelessWidget {
  CashModalContainer({
    Key? key,
  }) : super(key: key);

  final TextEditingController inputController = TextEditingController();
  final FixedExtentScrollController scrollController =
      FixedExtentScrollController();

  @override
  Widget build(BuildContext context) {
    final model = context.watch<NoteProvider>();
    final outmodel = context.watch<OutTypeProvider>();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxHeight: 500,
        ),
        child: Container(
          height: height * 0.60,
          margin: EdgeInsets.symmetric(
              horizontal: width * 0.02, vertical: height * 0.01),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 5,
                  maxWidth: 35,
                ),
                child: Container(
                  width: width * 0.08,
                  height: height * 0.006,
                  decoration: const BoxDecoration(color: Colors.grey),
                ),
              ),
              const Text(
                'Быберите тип расхода',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              ListWheel(
                scrollController: model.scrollController,
              ),
              CostTypeInput(
                inputController: model.priceController,
              ),
              CashAddButton(
                func: () {
                  String typename = '';
                  if (model.priceController.text.isNotEmpty) {
                    for (var i = 0; i < outmodel.typeList.length; i++) {
                      if (model.scrollController.selectedItem == i) {
                        typename = outmodel.typeList[i];
                        model.addNote(typename);
                        model.priceController.clear();
                      }
                    }

                    Navigator.pop(context);
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => const CupertinoAlertDialog(
                        title: Text('Укажите сумму расхода'),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
