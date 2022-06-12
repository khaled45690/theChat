// create abstract class

abstract class UserDataState{}
// create initstate from abstract class
class UserDataINitState extends UserDataState{}

// create class in case of connected
class UserDataConnect extends UserDataState {}

// create class in case not connected
class UserDataNotConnect extends UserDataState {}