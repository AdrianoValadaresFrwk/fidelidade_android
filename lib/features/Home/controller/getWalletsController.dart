import 'package:fidelidade_android/features/Home/api/getWalletsApi.dart';
import 'package:fidelidade_android/features/Home/models/Wallets.dart';
import 'package:mobx/mobx.dart';

part 'getWalletsController.g.dart';

class GetWalletsController = _GetWalletsController with _$GetWalletsController;

abstract class _GetWalletsController with Store {
  GetWalletsApi getWalletApi = GetWalletsApi();

  @observable
  WalletsModel? walletsModel;

  @action
  Future<WalletsModel> getWallets() async {
    try {
      return walletsModel = await getWalletApi.getWallets();
    } catch (e) {
      throw Exception(e);
    }
  }

  @action
  void setWallets(WalletsModel wallets) {
    walletsModel = wallets;
  }
}
