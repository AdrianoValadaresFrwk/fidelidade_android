import 'package:fidelidade_android/features/Home/models/Wallets.dart';
import 'package:fidelidade_android/features/Home/presentation/widgets/AppChart.dart';
import 'package:fidelidade_android/features/Home/presentation/widgets/BalanceCoinsCard.dart';
import 'package:fidelidade_android/features/Home/presentation/widgets/BalanceMoneyCard.dart';
import 'package:fidelidade_android/features/Home/presentation/widgets/CoinExchangeModal.dart';
import 'package:fidelidade_android/features/Home/presentation/widgets/HomeHeader.dart';
import 'package:fidelidade_android/features/Home/presentation/widgets/InformationCard.dart';
import 'package:fidelidade_android/features/Home/presentation/widgets/MoneyExchangeModal.dart';
import 'package:fidelidade_android/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fidelidade_android/features/Home/controller/getWalletsController.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GetWalletsController getWalletsController = GetWalletsController();
  late WalletsModel walletsModel;

  void _openCoinExchangeModalBottomSheet(context) {
    final Size _size = MediaQuery.of(context).size;
    showModalBottomSheet(
        isScrollControlled: true,
        constraints: BoxConstraints(
            maxWidth: _size.width * 0.9, minHeight: _size.height * 0.7),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        context: context,
        builder: (BuildContext bc) {
          return CoinExchangeModal(
              wallet: walletsModel.wallet![0],
              walletTargetId: walletsModel.wallet![1].id!.toDouble(),
              onModalDismiss: loadWallets);
        });
  }

  void _openMoneyExchangeModalBottomSheet(context) {
    final Size _size = MediaQuery.of(context).size;
    showModalBottomSheet(
        isScrollControlled: true,
        constraints: BoxConstraints(
            maxWidth: _size.width * 0.9, minHeight: _size.height * 0.7),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        context: context,
        builder: (BuildContext bc) {
          return MoneyExchangeModal(
              moneyAmount: walletsModel.wallet![1].amount!.toDouble(),
              onModalDismiss: loadWallets);
        });
  }

  void loadWallets() {
    getWalletsController.getWallets().then((value) => {
          setState(() {
            print("kapa?");
            print(value);
            // walletsModel = getWalletsController.walletsModel!;
            walletsModel = value;
          })
        });
  }

  @override
  void initState() {
    super.initState();
    loadWallets();
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const HomeHeader(name: 'Nome da pessoa', hasNotification: true),
      body: SingleChildScrollView(
        child: Observer(builder: (context) {
          return Column(
            children: <Widget>[
              // FutureBuilder<String>(
              //   future: getWallets(),
              //   builder: (context, snapshot) {
              //     if (snapshot.hasData) {
              //       setState(() {
              //         _wallets = jsonDecode((snapshot.data ?? ''));
              //       });
              //       return Container();
              //     } else {
              //       return const CircularProgressIndicator(
              //         color: moneyColor,
              //       );
              //     }
              //   },
              // ),
              BalanceCoinsCard(
                size: _size,
                coinAmount: walletsModel.wallet![0].amount!.toDouble(),
                openModal: _openCoinExchangeModalBottomSheet,
              ),
              BalanceMoneyCard(
                size: _size,
                moneyAmout: walletsModel.wallet![1].amount!.toDouble(),
                openModal: _openMoneyExchangeModalBottomSheet,
              ),
              InformationCard(
                size: _size,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(primaryColor)),
                    onPressed: () async {
                      setState(() {
                        loadWallets();
                      });
                    },
                    child: const Icon(
                      Icons.get_app,
                      color: moneyColor,
                      size: 48,
                    )),
              ),
              const AppChart(),
            ],
          );
        }),
      ),
    );
  }
}
