part of 'password_cubit.dart';

sealed class PasswordCubitState extends Equatable {
  const PasswordCubitState();
}

final class PasswordInitial extends PasswordCubitState {
  @override
  List<Object> get props => [];
}
