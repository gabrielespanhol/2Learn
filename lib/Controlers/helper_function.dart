import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {
  //keys
  static String userLoggedInKey = "LOGGEDINKEY";
  static String userNameKey = "USERNAMEKEY";
  static String userEmailKey = "USEREMAILKEY";
  static String userTypeKey = "USERETYPYKEY";
  static String userSexKey = "USERESEXKEY";
  static String userCPFKey = "USERCPFKEY";

  // saving the data to SF

  static Future<bool> saveUserLoggedInStatus(bool isUserLoggedIn) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setBool(userLoggedInKey, isUserLoggedIn);
  }

  static Future<bool> saveUserNameSF(String userName) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userNameKey, userName);
  }

  static Future<bool> saveUserEmailSF(String userEmail) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userEmailKey, userEmail);
  }

  static Future<bool> saveuserTypeKey(String userType) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userTypeKey, userType);
  }

  static Future<bool> saveSexlKey(String userSex) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userSexKey, userSex);
  }

  static Future<bool> saveCPFlKey(String userCPF) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userCPFKey, userCPF);
  }

  // getting the data from SF

  static Future<bool?> getUserLoggedInStatus() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool(userLoggedInKey);
  }

  static Future<String?> getUserEmailFromSF() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userEmailKey);
  }

  static Future<String?> getUserNameFromSF() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userNameKey);
  }

  static Future<String?> getUserSexFromSF() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userSexKey);
  }
}
