// ignore_for_file: file_names

class SignUpModel{

  String? name;
  String? email;
  String? password;
  String? confirmPassword;
  String? imageName;
  SignUpModel();
  Map toMap(){
    Map signIn = {
      "name"  : name,
      "email"  : email,
      "password" : password,
      "confirmPassword" : confirmPassword,
    };
    return signIn;
  }

  fromMap(Map signIn){
    name = signIn["name"];
    email = signIn["email"];
    password = signIn["password"];
    confirmPassword = signIn["confirmPassword"];
  }

  bool isSame(Map signIn){
    if(signIn["email"] == null || signIn["password"] == null || signIn["password"] == null || signIn["confirmPassword"] == null || signIn["name"] == null)  return false;

    return true;
  }


}