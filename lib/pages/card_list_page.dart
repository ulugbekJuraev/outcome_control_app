import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:outcome_app/providers/card_note_data.dart';
import '../components/top_items.dart';
import '../providers/hive_boxes.dart';

class CardListPage extends StatelessWidget {
  const CardListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: 170,
            maxWidth: width,
          ),
          child: Container(
            padding: EdgeInsets.only(
              top: height * 0.07,
              left: width * 0.04,
              right: width * 0.04,
              bottom: height * 0.02,
            ),
            width: width,
            height: height * 0.20,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF9453F4),
                    Color(0xFFE763F2),
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 199, 192, 192),
                    spreadRadius: 2,
                    blurRadius: 1,
                    offset: Offset(0, 2),
                  )
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                // TopItems(
                //   icon: Icons.menu,
                //   func: () {},
                // ),
                 Text(
                  'Расходы по карте',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        const MyCardList(),
      ],
    );
  }
}

class MyCardList extends StatelessWidget {
  const MyCardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 411,
        maxHeight: 598,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: height * 0.01),
        width: width * 0.9,
        height: height * 0.73,
        child: Column(
          children: [
            Expanded(
                child: ValueListenableBuilder(
                    valueListenable: HiveBoxes.cardNotes.listenable(),
                    builder: (
                      BuildContext context,
                      Box<CardNoteData> box,
                      child,
                    ) {
                      final noteList = box.values.toList();
                      return HiveBoxes.cardNotes.length > 0
                          ? ListView.separated(
                              physics: const ScrollPhysics(
                                  parent: BouncingScrollPhysics()),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemBuilder: (context, int) => MyListTile(
                                    price: noteList[int].price,
                                    typename: noteList[int].type,
                                    date: noteList[int].date,
                                    func: () {
                                      box.deleteAt(int);
                                    },
                                  ),
                              separatorBuilder: (context, int) => SizedBox(
                                    height: height * 0.01,
                                  ),
                              itemCount: noteList.length)
                          : const Center(
                              child: Text(
                                'Нет данных',
                              ),
                            );
                    })),
          ],
        ),
      ),
    );
  }
}

class MyListTile extends StatelessWidget {
  final String price;
  final String typename;
  final String date;
  final Function func;

  const MyListTile({
    Key? key,
    required this.price,
    required this.typename,
    required this.date,
    required this.func,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: 70,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: height * 0.01, horizontal: width * 0.02),
        height: height * 0.08,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(
            color: const Color(0xFF9453F4),
            width: 2,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  typename,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(date),
              ],
            ),
            AutoSizeText(
              '-$price',
              maxFontSize: 18,
              minFontSize: 12,
              stepGranularity: 1,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                decorationColor: Colors.white,
                backgroundColor: Colors.white,
                color: Color.fromARGB(255, 97, 66, 63),
              ),
            ),
            // InkWell(
            IconButton(
              onPressed: () => func(),
              icon: const Icon(
                Icons.delete,
                size: 20,
                color: Color(0xFF9453F4),
              ),
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
