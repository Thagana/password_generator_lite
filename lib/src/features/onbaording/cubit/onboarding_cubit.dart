import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingCubitState> {
  OnboardingCubit() : super(OnboardingInitial());

  // BehaviorSubject
  final _passwordController = BehaviorSubject<String>.seeded('');


  String get password => _passwordController.value;

  // Stream
  Stream<String> get passwordStream {
    return _passwordController.stream;
  }

  void updatePassword(String password) {
    _passwordController.sink.add(password);
  }

  @override
  Future<void> close() async {
    await super.close();
    await _passwordController.close();
  }

}
