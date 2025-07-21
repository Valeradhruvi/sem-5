class UserModel{
  int? _id;

  int get id => _id!;

  set id(int value) {
    _id = value;
  }

  String? _name;

  String get name => _name!;

  set name(String value) {
    _name = value;
  }

  UserModel({int? userID, String? userName}){
    _id = userID;
    _name = userName;
  }

  Map<String, Object?> toMap() {
    final map = <String , Object?>{};
    if(_id != null) map["USER_ID"] = _id;
                    map["USER_NAME"] = _name;
    return map;
  }

  UserModel fromMap(Map<String, Object?> userData) {
    return UserModel(
      userID: userData["USER_ID"] as int,
      userName: userData["USER_NAME"].toString(),
    );
  }

}