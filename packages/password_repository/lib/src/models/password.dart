import 'dart:convert';

///
class Password {
  ///
  const Password({
    required this.password,
    required this.date,
    required this.name,
    required this.logo,
    required this.strength,
    this.show = false,
  });

  ///
  factory Password.fromJson(Map<String, dynamic> json) {
    return Password(
      password: json['password'] as String,
      date: json['date'] as String,
      name: json['name'] as String,
      logo: json['logo'] as String,
      strength: json['strength'] as double,
    );
  }

  ///
  factory Password.empty() {
    return const Password(
      password: '',
      date: '',
      name: '',
      logo: '',
      strength: 0,
    );
  }

  ///
  final String password;

  ///
  final String date;

  ///
  final String name;

  ///
  final String logo;

  ///
  final double strength;

  final bool show;

  ///
  Password copyWith(
      {String? password,
      String? date,
      String? name,
      String? logo,
      double? strength,
      bool? show}) {
    return Password(
        password: password ?? this.password,
        date: date ?? this.date,
        name: name ?? this.name,
        logo: logo ?? this.logo,
        strength: strength ?? this.strength,
        show: show ?? this.show);
  }

  /// toJson
  static Map<String, dynamic> toJson(Password password) {
    return {
      'password': password.password,
      'date': password.date,
      'name': password.name,
      'logo': password.logo,
      'strength': password.strength,
      'show': password.show
    };
  }

  ///
  Map<String, Object?> toMap() {
    return {
      'password': password,
      'date': date,
      'name': name,
      'logo': logo,
      'strength': strength,
      'show': show
    };
  }

  ///
  static String encode(List<Password> passwords) => json.encode(
        passwords.map<Map<String, dynamic>>(Password.toJson).toList(),
      );

  ///
  static List<Password> decode(String password) =>
      (json.decode(password) as List<dynamic>)
          .map<Password>(
            (item) => Password.fromJson(
              item as Map<String, dynamic>,
            ),
          )
          .toList();
}
