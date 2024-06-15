class UserModel {
  final String uid;
  final String? email;
  final String password;

  UserModel(
      {required this.uid,
      required this.email,
      required this.password,});

  Map toMap(UserModel user) {
    var data = Map<String, dynamic>();
    data['uid'] = user.uid;
    data['email'] = user.email;
    data['password'] = user.password;
    return data;
  }

  factory UserModel.fromMap(Map<dynamic, dynamic> mapData) {
    return UserModel(
      uid: mapData['uid'],
      email: mapData['email'],
      password: mapData['password'],
    );
  }
}
