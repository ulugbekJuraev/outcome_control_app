import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:outcome_app/providers/card_note_data.dart';
import 'package:outcome_app/providers/hive_boxes.dart';
import 'package:outcome_app/providers/note_data.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool light = false;
  final _notes = HiveBoxes.notes.values.toList();
  final _cardnotes = HiveBoxes.cardNotes.values.toList();
  TextEditingController searchController = TextEditingController();
  var filteredNotes = <NoteData>[];
  var cardfilteredNotes = <CardNoteData>[];

  void searchNotes() {
    final query = searchController.text;
    if (query.isNotEmpty) {
      filteredNotes = _notes.where((NoteData noteList) {
        return noteList.type.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      filteredNotes = _notes;
    }
    setState(() {});
  }

  void cardSearchNotes() {
    final query = searchController.text;
    if (query.isNotEmpty) {
      cardfilteredNotes = _cardnotes.where((CardNoteData cardNoteList) {
        return cardNoteList.type.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      cardfilteredNotes = _cardnotes;
    }
    setState(() {});
  }

  @override
  void initState() {
    filteredNotes = _notes;
    cardfilteredNotes = _cardnotes;
    searchController.addListener(() {
      searchNotes();
      cardSearchNotes();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
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
                  Text(
                    'Поиск по категории расходов',
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
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 80,
              maxWidth: 300,
            ),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              height: height * 0.097,
              width: width * 1,
              child: TextField(
                controller: searchController,
                maxLines: 1,
                decoration: const InputDecoration(
                  hintText: 'Напишите категорию расхода',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  alignLabelWithHint: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                      color: Color(0xFF9453F4),
                      width: 2,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                      color: Color(0xFF9453F4),
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                      color: Color(0xFF9453F4),
                      width: 2,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 244, 94, 83),
                      width: 3,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                      width: 2,
                      color: Color(0xFF9453F4),
                    ),
                  ),
                ),
              ),
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 300,
              maxHeight: 20,
            ),
            child: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        light ? light = false : light = false;
                      });
                    },
                    child: Text(
                      'По карте',
                      style: TextStyle(
                          color: light ? Colors.black : const Color(0xFFE763F2),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Switch(
                    value: light,
                    activeColor: const Color(0xFF9453F4),
                    activeTrackColor: const Color.fromARGB(255, 170, 127, 235),
                    inactiveThumbColor: const Color(0xFFE763F2),
                    inactiveTrackColor:
                        const Color.fromARGB(255, 223, 144, 230),
                    onChanged: (bool value) {
                      searchController.clear();

                      setState(() {
                        light = value;
                      });
                    },
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        light ? light = true : light = true;
                      });
                    },
                    child: Text(
                      'Наличные',
                      style: TextStyle(
                          color: light ? const Color(0xFF9453F4) : Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.symmetric(vertical: height * 0.01),
              width: width * 0.9,
              height: height * 0.62,
              child: light == false
                  ? Column(
                      children: [
                        Expanded(
                          child: ValueListenableBuilder(
                            valueListenable: HiveBoxes.cardNotes.listenable(),
                            builder: (
                              BuildContext context,
                              Box<CardNoteData> box,
                              child,
                            ) {
                              return HiveBoxes.cardNotes.length > 0
                                  ? ListView.separated(
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        final cardnote =
                                            cardfilteredNotes[index];

                                        return MyListTile(
                                          price: cardnote.price,
                                          typename: cardnote.type,
                                          date: cardnote.date,
                                          func: () {
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                            final item = HiveBoxes
                                                .cardNotes.values
                                                .toList();

                                            for (int i = 0;
                                                i < item.length;
                                                i++) {
                                              var element = item[i];
                                              if (element.date.compareTo(
                                                          cardnote.date) ==
                                                      0 &&
                                                  element.type.compareTo(
                                                          cardnote.type) ==
                                                      0 &&
                                                  element.price.compareTo(
                                                          cardnote.price) ==
                                                      0) {
                                                setState(() {
                                                  HiveBoxes.cardNotes
                                                      .deleteAt(i);
                                                  cardfilteredNotes
                                                      .removeAt(index);
                                                  searchController.clear();
                                                });
                                              }
                                            }

                                            print('deleted');
                                          },
                                        );
                                      },
                                      separatorBuilder: (context, index) =>
                                          SizedBox(
                                        height: height * 0.01,
                                      ),
                                      itemCount: cardfilteredNotes.length,
                                    )
                                  : const Center(
                                      child: Text(
                                        'Нет данных12',
                                      ),
                                    );
                            },
                          ),
                        )
                      ],
                    )
                  : Column(
                      children: [
                        Expanded(
                          child: ValueListenableBuilder(
                              valueListenable: HiveBoxes.notes.listenable(),
                              builder: (
                                BuildContext context,
                                Box<NoteData> box,
                                child,
                              ) {
                                return HiveBoxes.notes.length > 0
                                    ? ListView.separated(
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          final note = filteredNotes[index];

                                          return MyListTile(
                                            price: note.price,
                                            typename: note.type,
                                            date: note.date,
                                            func: () {
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();

                                              final item = HiveBoxes
                                                  .notes.values
                                                  .toList();

                                              for (int i = 0;
                                                  i < item.length;
                                                  i++) {
                                                var element = item[i];

                                                if (element.date.compareTo(
                                                            note.date) ==
                                                        0 &&
                                                    element.type.compareTo(
                                                            note.type) ==
                                                        0 &&
                                                    element.price.compareTo(
                                                            note.price) ==
                                                        0) {
                                                  setState(() {
                                                    HiveBoxes.notes.deleteAt(i);
                                                    filteredNotes
                                                        .removeAt(index);
                                                    searchController.clear();
                                                  });
                                                }
                                              }
                                            },
                                          );
                                        },
                                        separatorBuilder: (context, index) =>
                                            SizedBox(
                                              height: height * 0.01,
                                            ),
                                        itemCount: filteredNotes.length)
                                    : const Center(
                                        child: Text(
                                          'Нет данных',
                                        ),
                                      );
                              }),
                        ),
                      ],
                    )),
        ],
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
            IconButton(
              onPressed: () => func(),
              icon: const Icon(
                Icons.delete,
                size: 20,
                color: Color(0xFF9453F4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
