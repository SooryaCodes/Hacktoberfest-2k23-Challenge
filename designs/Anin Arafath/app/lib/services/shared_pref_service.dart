import 'package:karmalab_assignment/views/home/home_view.dart';
import 'package:karmalab_assignment/views/onboarding/onboarding_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void userLog({String? email, String? token, int? id, int? otp}) async {
    SharedPreferences pref = await _prefs;
    pref.setBool("login", true);
    pref.setString("email", email ?? "email");
    pref.setInt("id", id ?? 0);
    pref.setInt("otp", otp ?? 0);
    pref.setString("token", token ?? "");
  }

  Future<String> start() async {
    SharedPreferences pref = await _prefs;

    var status = pref.getString("email");
    if (status == null) {
      pref.setBool("login", false);
    }

    return status != null ? HomeView.routeName : OnboardingView.routeName;
  }

  Future<Map<String, dynamic>> getUser() async {
    SharedPreferences pref = await _prefs;

    // ? simulate delay
    await Future.delayed(const Duration(seconds: 0));
    var user = Future.value({
      "user": pref.getInt("id"),
      "email": pref.getString("email"),
    });

    return user;
  }

  Future<void> forgotPassCred({String? token, int? otp}) async {
    SharedPreferences pref = await _prefs;
    // ? simulate delay
    await Future.delayed(const Duration(seconds: 0));

    pref.setInt("otp", otp ?? 0);
    pref.setString("token", token ?? "");
  }

  Future<String?> getToken() async {
    SharedPreferences pref = await _prefs;
    return pref.getString("token");
  }

  Future<void> updateToken(String? token) async {
    SharedPreferences pref = await _prefs;
    pref.setString("token", token ?? "");
  }

  void clear() async {
    SharedPreferences pref = await _prefs;
    pref.setBool("login", false);
    pref.remove("email");
    pref.remove("id");
    pref.remove("otp");
  }
}
