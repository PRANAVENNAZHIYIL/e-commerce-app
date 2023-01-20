import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:menz_cart_app/app/watches/model/watch_model.dart';
import 'package:menz_cart_app/services/api_endpoints.dart';

class WatchColorApiServices {
  Future<WatchModels> fetchWatchColor(String color) async {
    log(color);
    try {
      Response response = await Dio().get(
          "${ApiEndPoints.baseUrl}/api/menzclub/watch/color?watch_color=$color");
      if (response.statusCode == 200) {
        log('response.data');
        log(response.statusCode.toString());

        return WatchModels.fromJson(response.data);
      } else {
        return WatchModels.fromJson(response.data);
      }
    } on DioError catch (e) {
      log('message');
      return WatchModels.fromJson(e.response!.data);
    } catch (e) {
      log(e.toString());
      return WatchModels(
        watch: [],
        status: false,
        message: e.toString(),
      );
    }
  }
}
