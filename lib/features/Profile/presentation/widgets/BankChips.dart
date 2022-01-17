import 'package:fidelidade_android/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:fidelidade_android/utils/Alerts.dart';

class BankChips extends StatelessWidget {
  String title;
  BankChips({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Container(
            height: 46.0,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 12, color: Colors.white),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    child: const Icon(Icons.cancel),
                    onTap: () {
                      showAlertDialog(context, "Deletar Banco",
                          "Deseja confirmar a exclusão?");
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
