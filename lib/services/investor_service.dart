import 'package:dio/dio.dart';

import 'package:karachi_connect/model/user_model/user_model.dart';
import 'package:karachi_connect/services/api_service/api_service.dart';
import 'package:karachi_connect/utils/constants/app_urls.dart';

class InvestorService {
  Dio dio = Api().dio;

  Future<List<UserModel>>? getInvestorApi() async {
    try {
      final response = await dio.get(AppUrls.investorEndpoint);
      if (response.statusCode == 200) {
        final investorResponse = UserModel.fromJsonList(response.data);
        return investorResponse;
      }
    } catch (e) {
      rethrow;
    }
    return [] as List<UserModel>;
  }
}
