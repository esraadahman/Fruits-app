part of 'auth_cubit_cubit.dart';

@immutable
sealed class AuthCubitState {}

final class AuthCubitInitial extends AuthCubitState {}

final class GoogleSignInLoading extends AuthCubitState {}
final class GoogleSignInSuccess extends AuthCubitState {}
final class GoogleSignInFailure extends AuthCubitState {
  final String error;
  GoogleSignInFailure(this.error);
}
