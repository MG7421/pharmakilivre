

class LoginResponse {
  final String? token;
  final int? code;
  final String? email;
  final String? nom;
  final String? prenom;
  final List<String?> role;
  final String? message;

  LoginResponse({
    required this.token,
    required this.code,
    required this.email,
    required this.nom,
    required this.prenom,
    required this.role,
    required this.message,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      token: json['token'],
      code: json['code'],
      email: json['email'],
      nom: json['nom'],
      prenom: json['prenom'],
      role: List<String>.from(json['role']),
      message: json['message'],
    );
  }
}
