// États
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmakilivre/models/LoginResponse.dart';
import 'package:pharmakilivre/utils/configApi/configApi.dart';

import '../services/ApiLogin_service.dart';


// CREATION DES STATES
abstract class LoginState extends Equatable {
  const LoginState();
  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}
class LoginLoading extends LoginState {}
class LoginSuccess extends LoginState {
  final LoginResponse response;
  const LoginSuccess(this.response);
  @override
  List<Object> get props => [response];
}
class LoginFailure extends LoginState {
  final String error;
  const LoginFailure(this.error);
  @override
  List<Object> get props => [error];
}

// Événements
abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginButtonPressed extends LoginEvent {
  final String email;
  final String password;

  const LoginButtonPressed(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

// BLoC
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final ApiService apiService;

  LoginBloc({required this.apiService}) : super(LoginInitial()) {
    on<LoginButtonPressed>((event, emit) async {
      emit(LoginLoading());

      try {
        const apiURL = '${GlobalApi.ApiUrl}login_check';
        final response = await apiService.postLogin(
          apiURL,
          body: {
            'email': event.email,
            'password': event.password,
          },
        );

        emit(LoginSuccess(response));
      } catch (error) {
        emit(LoginFailure('Login failed: $error'));
      }
    });
  }

// Rest of your code...
}
