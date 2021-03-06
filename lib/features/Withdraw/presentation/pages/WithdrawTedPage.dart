import 'package:fidelidade_android/shared/presentation/widgets/CustomAppBar.dart';
import 'package:fidelidade_android/features/Withdraw/presentation/widgets/TedCardWidget.dart';
import 'package:fidelidade_android/utils/constants.dart';
import 'package:flutter/material.dart';

class WithDrawTedPage extends StatefulWidget {
  const WithDrawTedPage({Key? key}) : super(key: key);

  @override
  _WithDrawTedPageState createState() => _WithDrawTedPageState();
}

class _WithDrawTedPageState extends State<WithDrawTedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Sacar - TED",
        automaticallyImplyLeading: true,
      ),
      body: ListView(
        children: [
          Container(
            height: 15,
          ),
          Center(
            child: Text(
              'Selecione o destino',
              style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  letterSpacing: 2.0),
            ),
          ),
          Container(
            height: 15,
          ),
          TedCardWidget(
            bank: 'Santander',
            agency: '2920',
            accountNumber: '21908-0',
            type: 'Poupança',
          ),
          TedCardWidget(
            bank: 'Bradesco',
            agency: '4200',
            accountNumber: '03104-9',
            type: 'Corrente',
          ),
        ],
      ),
    );
  }
}
