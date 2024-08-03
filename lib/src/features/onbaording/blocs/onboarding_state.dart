part of 'onboarding_bloc.dart';

class OnboardingState extends Equatable {
  const OnboardingState({
    this.isDone = false,
    this.password = '',
    this.loading = false,
    this.errorMessage = '',
    this.plainPassword = '',
  });

  final bool isDone;
  final String password;
  final bool loading;
  final String errorMessage;
  final String plainPassword;
  ///
  Map<String, dynamic>? toJson() {
    return {
      'isDone': isDone,
      'password': password,
      'loading': loading,
      'errorMessage': errorMessage,
      'plainPassword': plainPassword
    };
  }

  OnboardingState copyWith({
    String? password,
    bool? isDone,
    bool? loading,
    String? errorMessage,
    String? plainPassword
  }) {
    return OnboardingState(
        password: password ?? this.password,
        isDone: isDone ?? this.isDone,
        loading: loading ?? this.loading,
        errorMessage: errorMessage ?? this.errorMessage,
        plainPassword: plainPassword ?? this.plainPassword
    );
  }

  @override
  List<Object?> get props => [isDone, password, loading, plainPassword];
}
