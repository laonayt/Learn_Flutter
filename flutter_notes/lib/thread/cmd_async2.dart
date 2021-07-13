void main() async {
  // methodA();
  // await methodB();
  // await methodC('main');
  // methodD();

  //-------
  // method1();
  method2();
}

methodA(){
  print('A');
}

methodB() async {
  print('B start');
  await methodC('B');
  print('B end');
}

methodC(String from) async {
  print('C start from $from');

  Future((){                // <== 该代码将在未来的某个时间段执行
    print('C running Future from $from');
  }).then((_){
    print('C end of Future from $from');
  });

  print('C end from $from');
}

methodD(){
  print('D');
}

//------------------------------------------------------------
void method1(){
  List<String> myArray = <String>['a','b','c'];
  print('before loop');
  myArray.forEach((String value) async {
    await delayedPrint(value);
  });
  print('end of loop');
}

void method2() async {
  List<String> myArray = <String>['a','b','c'];
  print('before loop');
  for(int i=0; i<myArray.length; i++) {
    await delayedPrint(myArray[i]);
  }
  print('end of loop');
}
/*
*1
before loop
end of loop
delayedPrint: a
delayedPrint: b
delayedPrint: c
* 2
before loop
delayedPrint: a
delayedPrint: b
delayedPrint: c
end of loop
* */

Future<void> delayedPrint(String value) async {
  await Future.delayed(Duration(seconds: 1));
  print('delayedPrint: $value');
}