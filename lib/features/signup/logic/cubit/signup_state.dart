part of 'signup_cubit.dart';

@freezed
class SignupState<T> with _$SignupState<T> {
  const factory SignupState.initial() = _Initial;
  const factory SignupState.loading() = Loading;
  const factory SignupState.success(T data) = Success<T>;
  const factory SignupState.failure({required String errMessage}) = Failure;
}
