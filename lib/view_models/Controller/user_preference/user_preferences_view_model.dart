import 'package:shared_preferences/shared_preferences.dart';
import '../../../models/login_model.dart';

class UserPreference {
  Future<bool> saveuser(LoginModel loginModel) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', loginModel.token.toString());
    return true;
  }

  Future<LoginModel> getuser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? sptoken = sp.getString('token');
    return LoginModel(
      token: sptoken
    );
  }

  Future<bool> removeuser() async {
     SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    return true;
  }
}
