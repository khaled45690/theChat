// create abstract class
import 'package:socket_io_client/socket_io_client.dart';

abstract class SocketStates{}
// create initstate from abstract class
class SocketINitState extends SocketStates{}

// create class in case of connected
class SocketConnect extends SocketStates {}

// create class in case not connected
class SocketNotConnect extends SocketStates {}