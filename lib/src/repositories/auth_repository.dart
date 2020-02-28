import 'package:flutter_architecture/src/helpers/connection_helper.dart';
import 'package:flutter_architecture/src/models/response_model.dart';
import 'package:flutter_architecture/src/repositories/sources/network/auth_api_provider.dart';

class AuthRepository {
  AuthApiProvider api = AuthApiProvider();

  Future<ResponseModel> login(String login, String senha) async {
    ResponseModel response = ResponseModel();

    final hasConnection = await ConnectionHelper.hasConnection();

    if (hasConnection) {
      response = await this.api.login(login, senha);
    } else {
      response.message = "Device offline";
    }

    return response;
  }
}
