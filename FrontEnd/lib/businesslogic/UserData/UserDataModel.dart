
//factory
 class UserData {
  String? id;
  String? name;
  String? email;
  String? password;
  String? imageName;
  String? token;
  UserData();
  Map toMap(){
    Map signIn = {
      "_id"  : id,
      "name"  : name,
      "email"  : email,
      "password" : password,
      "token" : token,
    };
    return signIn;
  }

  fromMap(Map Data){
    id =  Data["_id"];
    name = Data["name"];
    email = Data["email"];
    password = Data["password"];
    imageName = Data["imageName"];
    token = Data["token"];
  }


}