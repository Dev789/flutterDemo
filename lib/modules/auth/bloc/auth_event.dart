part of 'auth_bloc.dart';

/// [AuthEvent] abstract class is used Event of bloc.
abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

/// [AuthUser] abstract class is used Auth Event
class AuthUser extends AuthEvent {
  const AuthUser({required this.url, required this.body});

  final String url;
  final Map<String, dynamic> body;

  @override
  List<Object> get props => [url, body];
}
