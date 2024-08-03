import 'package:onboarding_repository/src/data/onboarding_api_repository.dart';
import 'package:onboarding_repository/src/models/index.dart';

///
class OnboardingRepository {
  final OnboardingApiProvider _provider = OnboardingApiProvider();

  ///
  Future<GetPasswordResponse> getPassword() {
    return _provider.getPassword();
  }

  ///
  Future<SavePasswordResponse> saveMainPassword(String password){
    return _provider.saveMainPassword(password);
  }

}