class UpdateUserDto {
  final int userid;
  final String firstName;
  final String lastName;
  final String phone;
  final String gender;
  final String dateofBirth;
  final String? address;
  final String email;

  UpdateUserDto(
      {required this.userid,
      required this.firstName,
      required this.lastName,
      required this.phone,
      required this.dateofBirth,
      required this.gender,
      this.address,
      required this.email});
  Map<String, dynamic> toJson() {
    return {
      "id": userid,
      "first_name": firstName,
      "last_name": lastName,
      "phone": phone,
      "email": email,
      "gender": gender,
      "address":address,
      "date_of_birth": dateofBirth
    };
  }
}
