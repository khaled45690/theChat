// ctreate abstract class
abstract class SocketStates{}
// create initstate from abstract class
class SocketINitState extends SocketStates{}

// ctreat class in case of connected
class SocketConnect extends SocketStates {}

// create class in case not connected
class SocketNotConnect extends SocketStates {}