import 'package:flutter/material.dart';
class AddButton extends StatelessWidget {
  final Function func;
  const AddButton({Key? key, required this.func}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        func();
      },
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 150,
          maxHeight: 50,
        ),
        child: Container(
          width: width * 0.36,
          height: height * 0.060,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  color: Color.fromARGB(255, 187, 182, 182),
                  spreadRadius: 2,
                  blurRadius: 1,
                  offset: Offset(1, 1))
            ],
            borderRadius: BorderRadius.circular(30),
            gradient: const LinearGradient(
              colors: [
                Color(0xFF9453F4),
                Color(0xFFE763F2),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: const Center(
            child: Text(
              'Добавить',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
