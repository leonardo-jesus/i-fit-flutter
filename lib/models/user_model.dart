class User {
  String username;
  String password;

  User({required this.username, required this.password});

  // Método para converter um User em JSON
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
    };
  }

  // Método para criar um User a partir de JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      password: json['password'],
    );
  }
}
