class SignInModel{

  String? userName;
  String? password ;
  SignInModel();
  Map toMap(){
    Map signIn = {
      "userName"  : userName,
      "password" : password
    };
    return signIn;
  }

  fromMap(Map signIn){
   userName = signIn["userName"];
   password = signIn["password"];
  }

  bool isSame(Map signIn){
    if(signIn["username"] == null || signIn["password"] == null)  return false;

    return true;
  }


}