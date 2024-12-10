import 'package:dartz/dartz.dart';
import 'package:movie_app/data/auth/models/signin_req_params.dart';
import 'package:movie_app/data/auth/models/signup_req_params.dart';
import 'package:movie_app/data/auth/sources/auth_api_service.dart';
import 'package:movie_app/domain/auth/repositories/auth.dart';
import 'package:movie_app/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<bool> isLoggedIn() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();

    var token = sp.getString('token');
    if (token == null) return false;

    return true;
  }

  @override
  Future<Either> signin(SigninReqParams params) async {
    var data = await sl<AuthApiService>().signin(params);
    return data.fold((error) {
      return Left(error);
    }, (data) async {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('token', data['user']['token']);
      return Right(data);
    });
  }

  @override
  Future<Either> signup(SignupReqParams params) async {
    var data = await sl<AuthApiService>().signup(params);
    return data.fold((error) {
      return Left(error);
    }, (data) async {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('token', data['user']['token']);
      return Right(data);
    });
  }
}
