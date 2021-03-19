import "dart:async";

main(List<String> args) {
  print("main start");

  Future(() => print("task1"));//event队列--2

  Future(() => print("task2")).then((_) {
    print("task3");
    scheduleMicrotask(() => print('task4'));
  }).then((_) => print("task5"));

  final future = Future(() => null);
  future.then((_) => print("task6"));

  scheduleMicrotask(() => print('task7'));//mic队列--1

  Future(() => print('task8'))
      .then((_) => Future(() => print('task9')))
      .then((_) => print('task10'));

  print("main end");
}

/*
* https://www.jianshu.com/p/c711fe9d1cce
* Dart中事件循环
* **/