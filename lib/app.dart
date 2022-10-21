import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:outcome_app/pages/card_list_page.dart';
import 'package:outcome_app/pages/cash_list_page.dart';
import 'package:outcome_app/pages/home_page.dart';
import 'package:outcome_app/providers/card_note_provider.dart';

import 'package:provider/provider.dart';

import 'pages/search_page.dart';
import 'providers/note_provider.dart';
import 'providers/outcome_type_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<OutTypeProvider>(
          create: (context) => OutTypeProvider(),
        ),
        ChangeNotifierProvider<CardNoteProvider>(
          create: (context) => CardNoteProvider(),
        ),
        ChangeNotifierProvider<NoteProvider>(
          create: (context) => NoteProvider(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainScaffoldNavigationBar(),
      ),
    );
  }
}

class MainScaffoldNavigationBar extends StatefulWidget {
  const MainScaffoldNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  State<MainScaffoldNavigationBar> createState() =>
      _MainScaffoldNavigationBarState();
}

class _MainScaffoldNavigationBarState extends State<MainScaffoldNavigationBar> {
  int _page = 0;

  List<Widget> pages = [
    const HomePage(),
    const CardListPage(),
    const CashListPage(),
    const SearchPage(),
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: height * 0.06,
        animationCurve: Curves.linear,
        animationDuration: const Duration(milliseconds: 300),
        backgroundColor: Colors.white,
        buttonBackgroundColor: const Color(0xFF9453F4),
        color: const Color(0xFF9453F4),
        items: const [
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          Icon(
            Icons.credit_card,
            color: Colors.white,
          ),
          Icon(
            Icons.attach_money_rounded,
            color: Colors.white,
          ),
          Icon(
            Icons.search,
            color: Colors.white,
          ),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: pages.elementAt(_page),
      ),
    );
  }
}
