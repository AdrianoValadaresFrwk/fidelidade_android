import 'package:fidelidade_android/appEnv.dart';
import 'package:fidelidade_android/core/infrastructure/http_client.dart';
import 'package:fidelidade_android/features/Home/models/Wallets.dart';

class GetWalletsApi {
  getWallets() async {
    try {
      final map = await HttpClient.getListAsync(
        '$apiBaseUrl/Wallet/GetByUserId/1',
        headers: {},
      );
      return WalletsModel.fromJson(map);
    } catch (e) {
      throw Exception(e);
    }
  }
}
