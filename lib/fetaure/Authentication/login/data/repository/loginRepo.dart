
import 'package:baps_app/config/url/const_url.dart';

import '../../../../../core/network/network_api_services.dart';

class LoginRepo{
  final api = NetworkApiServices();
  Future<dynamic> loginApi({
    required data,
  }) async {
    dynamic response = await api.postApi(data, AppUrl.baseUrl);
    return response;
  }
}