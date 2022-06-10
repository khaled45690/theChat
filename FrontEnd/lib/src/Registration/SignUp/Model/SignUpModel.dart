class SignUpModel{

  String? email;
  String? password;
  String? confirmPassword;
  String? imageName;
  SignUpModel();
  Map toMap(){
    Map signIn = {
      "email"  : email,
      "password" : password,
      "confirmPassword" : confirmPassword,
      "imageName" : imageName,
    };
    return signIn;
  }

  fromMap(Map signIn){
    email = signIn["email"];
    password = signIn["password"];
    confirmPassword = signIn["confirmPassword"];
    imageName = signIn["imageName"];
  }

  bool isSame(Map signIn){
    if(signIn["email"] == null || signIn["password"] == null || signIn["password"] == null || signIn["confirmPassword"] == null || signIn["imageName"] == null)  return false;

    return true;
  }


}