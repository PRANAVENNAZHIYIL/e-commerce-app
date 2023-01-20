import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:menz_cart_app/app/user/model/user_model.dart';
import 'package:menz_cart_app/services/api_endpoints.dart';

class UserApiService {
  Future<UserModel> getUserData(String mail) async {
    log('reached get user');
    log(mail);
    try {
      Response response = await Dio().get(
        '${ApiEndPoints.baseUrl}/api/menzclub/get-users?user_mail=$mail',
      );
      if (response.statusCode! == 200) {
        log('reached Dio');
        log(response.data.toString());
        return UserModel.fromJson(response.data);
      } else {
        return UserModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      log('message');
      return UserModel.fromJson(e.response!.data);
    } catch (e) {
      log(e.toString());
      return UserModel(user: [], status: false, message: e.toString());
    }
  }
}
