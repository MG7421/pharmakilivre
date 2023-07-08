import 'package:shared_preferences/shared_preferences.dart';

class RouteUtil {
  static SharedPreferences? _prefs;

  // Fonction pour initialiser les préférences partagées
  static Future<void> initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Fonction pour sauvegarder la dernière route visitée
  static Future<void> saveLastRoute(String route) async {
    await _prefs?.setString('lastRoute', route);
  }

  // Fonction pour récupérer la dernière route visitée
  static String getLastRoute() {
    return _prefs?.getString('lastRoute') ?? '/splash'; // Retourne une route par défaut si aucune n'est enregistrée
  }













}
