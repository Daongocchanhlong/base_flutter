class LoginMethod {
  LoginMethod({
    this.userName,
    this.password,
  });

  String? userName;
  String? password;

  Map<String, dynamic> get toJson => <String, dynamic>{
        'email': userName ?? '',
        'password': password ?? ''
      };
}
