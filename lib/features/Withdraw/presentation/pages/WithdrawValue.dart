import 'package:fidelidade_android/shared/presentation/widgets/CustomAppBar.dart';
import 'package:fidelidade_android/shared/presentation/widgets/Input.dart';
import 'package:fidelidade_android/shared/presentation/widgets/RoundedButton.dart';
import 'package:fidelidade_android/shared/presentation/widgets/RoundedInputField.dart';
import 'package:fidelidade_android/utils/constants.dart';
import 'package:flutter/material.dart';

class WithdrawValue extends StatelessWidget {
  const WithdrawValue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      appBar: CustomAppBar(
        title: "Sacar",
        automaticallyImplyLeading: true,
      ),
      body: Container(
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            if (!isKeyboardOpen)
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Quanto gostaria de sacar?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 40,
                      letterSpacing: 4,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor),
                ),
              ),
            Container(
              width: size.width,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              color: primaryColor,
              child: Column(children: const [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Saldo total',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: Text(
                    'R\$3.200.00',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        letterSpacing: 4,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ]),
            ),
            RoundedInputField(
              labelText: 'Valor',
              hintText: 'Entre com o valor desejado',
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "Sacar",
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}
