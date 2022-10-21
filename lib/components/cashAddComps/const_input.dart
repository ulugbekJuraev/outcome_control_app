import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CostTypeInput extends StatelessWidget {
  final TextEditingController inputController;

  const CostTypeInput({
    Key? key,
    required this.inputController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: 80,
        maxWidth: 200,
      ),
      child: SizedBox(
        height: height * 0.097,
        width: width * 0.48,
        child: TextField(
          maxLength: 7,
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          controller: inputController,
          maxLines: 1,
          decoration: const InputDecoration(
            hintText: 'Напишите сумму',
            labelText: 'Сумма расхода',
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
    );
 
 
 
 
  }
}
