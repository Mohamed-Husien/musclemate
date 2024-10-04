class UserDataModel {
  final String name;
  final String email;

  UserDataModel({required this.name, required this.email});

  factory UserDataModel.fromJson(Map<String, dynamic> data) {
    return UserDataModel(
        name: data['username'].toString(), email: data['email'].toString());
  }
}
