import 'package:flutter/material.dart';
import '../cashAddComps/card_modal_container.dart';

class CardOutcomeBtn extends StatelessWidget {
  const CardOutcomeBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(vertical: width * 0.04),
      child: InkWell(
        onTap: (() {
          showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            context: context,
            builder: (context) => ModalContainer(),
          );
        }),
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 300,
            maxHeight: 50,
          ),
          child: Container(
            padding: EdgeInsets.only(left: width * 0.01),
            width: width * 0.72,
            height: height * 0.06,
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(
                  Icons.credit_card,
                  color: Colors.white,
                ),
                const Text(
                  'Добавить расходы по Карте',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: width * 0.04,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
