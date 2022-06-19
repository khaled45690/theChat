// ignore_for_file: file_names

class SignInModel{

  String? email;
  String? password;
  SignInModel();
  Map toMap(){
    Map signIn = {
      "email"  : email,
      "password" : password
    };
    return signIn;
  }

  fromMap(Map signIn){
    email = signIn["email"];
   password = signIn["password"];
  }

  bool isSame(Map signIn){
    if(signIn["email"] == null || signIn["password"] == null)  return false;

    return true;
  }


}