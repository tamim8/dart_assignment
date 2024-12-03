class UserModel {
  String? email;
  String? firstName;
  String? lastName;
  String? mobile;
  String? password;
  String? createdDate;
  String? sId;

  UserModel({
    this.email,
    this.firstName,
    this.lastName,
    this.mobile,
    this.password,
    this.createdDate,
    this.sId,
  });

  // From JSON constructor
  UserModel.fromJson(Map<String, dynamic> json)
      : email = json['email'] ?? '',
        firstName = json['firstName'] ?? '',
        lastName = json['lastName'] ?? '',
        mobile = json['mobile'] ?? '',
        password = json['password'] ?? '',
        createdDate = json['createdDate'] ?? '',
        sId = json['_id'] ?? '';

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'mobile': mobile,
      'password': password,
      'createdDate': createdDate,
      '_id': sId,
    };
  }
}
