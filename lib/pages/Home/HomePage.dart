import 'package:fidelidade_android/components/RoundedInputField.dart';
import 'package:fidelidade_android/pages/Home/components/HomeHeader.dart';
import 'package:fidelidade_android/components/CustomAppBar.dart';
import 'package:fidelidade_android/constants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String amount = "500";
  const HomePage({Key? key}) : super(key: key);

  void _configurandoModalBottomSheet(context) {
    final Size _size = MediaQuery.of(context).size;
    showModalBottomSheet(
        constraints: BoxConstraints(
            maxWidth: _size.width * 0.8, minHeight: _size.height),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: Wrap(
              // spacing: 5,
              children: <Widget>[
                CustomAppBar(
                  title: 'teste',
                  isOnmodal: true,
                ),
                const Center(
                  child: Icon(
                    Icons.error_outline,
                    size: 48,
                    color: primaryColor,
                  ),
                ),
                const Center(
                  child: Text(
                    "A cada 100 Moedas, você pode trocar por R\$ 1,00.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: primaryColor, fontSize: 24),
                  ),
                ),
                Card(
                  color: primaryColor,
                  margin: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Center(
                            child: Text(
                          'Você Possui:',
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        )),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset('assets/images/coin.png'),
                            ),
                            Stack(
                              children: <Widget>[
                                Text(
                                  amount,
                                  style: TextStyle(
                                    fontSize: 40,
                                    foreground: Paint()
                                      ..style = PaintingStyle.stroke
                                      ..strokeWidth = 6
                                      ..color = moneyColor,
                                  ),
                                ),
                                Text(
                                  amount,
                                  style: const TextStyle(
                                    fontSize: 40,
                                    color: primaryColor,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                RoundedInputField(
                  hintText: "Moedas",
                  onChanged: (value) {},
                ),
                const Card(
                  color: background,
                  child: Center(
                    child: Text('R\$ 00,00'),
                  ),
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeHeader(name: 'Nome da pessoa', hasNotification: true),
      body: Column(
        children: <Widget>[
          Center(
            heightFactor: 5,
            child: ElevatedButton(
              child: const Text('open'),
              onPressed: () {
                _configurandoModalBottomSheet(context);
              },
            ),
          ),
          // const AppChart(),
        ],
      ),
    );
  }
}
