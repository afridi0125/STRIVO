import 'package:shared_preferences/shared_preferences.dart';

class SessionService {

  static const String loggedInKey = "logged_in";
  static const String goalCompletedKey = "goal_completed";
  static const String workoutKey = "selected_workout";

  /// save login state
  static Future setLoggedIn(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(loggedInKey, value);
  }

  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(loggedInKey) ?? false;
  }

  /// save goal completion
  static Future setGoalCompleted(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(goalCompletedKey, value);
  }

  static Future<bool> isGoalCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(goalCompletedKey) ?? false;
  }

  /// save workout selection
  static Future saveWorkout(String workout) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(workoutKey, workout);
  }

  static Future<String?> getWorkout() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(workoutKey);
  }

  /// logout
  static Future logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

}