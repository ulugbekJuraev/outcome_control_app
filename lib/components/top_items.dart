import 'package:flutter/material.dart';

class TopItems extends StatelessWidget {
  final Function func;
  final IconData icon;
  const TopItems({
    Key? key,
    required this.func,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            func();
          },
          icon: Icon(
            icon,
            size: 35,
            color: Colors.white,
          ),
        ),
        // IconButton(
        //   onPressed: () {},
        //   icon: const Icon(
        //     Icons.search,
        //     size: 35,
        //     color: Colors.black,
        //   ),
        // ),
      ],
    );
  }
}
