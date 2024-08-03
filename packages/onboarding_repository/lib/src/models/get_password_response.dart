
/// GetPasswordResponse
class GetPasswordResponse {

  /// GetPasswordResponse
  const GetPasswordResponse({
    required this.success,
    this.password,
  });

  /// represent if the request was successful
  final bool success;

  /// is returned if the request was successful
  final String? password;
}
