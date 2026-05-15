class LoginState {
  final bool ispasswordhidden;
  final bool isrememberme;

  LoginState({this.ispasswordhidden = false, this.isrememberme = false});

  LoginState copyWith({bool? ispasswordhidden, bool? isrememberme}) {
    return LoginState(
      ispasswordhidden: ispasswordhidden ?? this.ispasswordhidden,
      isrememberme: isrememberme ?? this.isrememberme,
    );
  }
}
