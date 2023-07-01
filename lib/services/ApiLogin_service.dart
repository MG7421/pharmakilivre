import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pharmakilivre/models/LoginResponse.dart';
import 'package:pharmakilivre/utils/configApi/configApi.dart';

class ApiService {
  Future<LoginResponse> postLogin(String url, {required Map<String, dynamic> body}) async {
    print('=====connexion url ${url}   ${body}');
        // Création de l'URI
        final uri = Uri.parse(url);
        // En-têtes de la requête
        final headers = <String, String>{
          'Content-Type': 'application/json', // Spécifie le type de contenu JSON
        };
    // Conversion du corps de la requête en JSON
         final encodedBody = jsonEncode(body);
    // Envoi de la requête POST
       final response = await http.post(uri, body: encodedBody, headers: headers);
       print('connexion code status, ${response.statusCode}');
        if (response.statusCode == 200 || response.statusCode == 401) {
          final responseData = jsonDecode(response.body);
          print("=======> RESPONSE API AUTH ${responseData}");
          return LoginResponse.fromJson(responseData);
        } else {
          print('connexion impossible');
          throw Exception('connexion impossible');
        }
  }
}
