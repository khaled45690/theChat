
// ignore_for_file: file_names, non_constant_identifier_names

//factory
 class UserData {
  String? id;
  String? name;
  String? email;
  String? password;
  String? imageName;
  String? token;
  String? friends;
  List? chatOrder;

  UserData();

  Map toMap(){
    Map signIn = {
      "_id"  : id,
      "name"  : name,
      "email"  : email,
      "password" : password,
      "token" : token,
      "friends":friends,
      "chatOrder":chatOrder
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
    friends = Data["friends"];
    chatOrder = Data["chatOrder"];
  }


}