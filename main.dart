import 'dart:async';

void main() async {
  StreamController<String> streamController = StreamController(sync: true);
  streamController.add('0');
  streamController.add('1');
  await Future.delayed(Duration(milliseconds: 10));
  final broadCast = streamController.stream.asBroadcastStream();
  final aa= broadCast.listen((n) => print(n));
  streamController.add('b');
  await Future.delayed(Duration(milliseconds: 10));

  aa.cancel();
  await Future.delayed(Duration(milliseconds: 10));
  streamController.add('c');
  streamController.add('d');
  await Future.delayed(Duration(milliseconds: 10));
  broadCast.listen((n) => print('[$n]'));
  await Future.delayed(Duration(milliseconds: 10));
  
  streamController.add('e');
}
