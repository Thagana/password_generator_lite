class SavePasswordResponse {
  const SavePasswordResponse({
    required this.success,
    this.password,
    this.plainPassword
  });

  final bool success;
  final String? password;
  final String? plainPassword;
}