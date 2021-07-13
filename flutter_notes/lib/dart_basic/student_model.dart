
import 'sleep.dart';

class StudentModel extends sleep {

  @override
  void sleepLater() {
    // TODO: implement sleepLater
    print('student: sleepLater');
    super.sleepLater();
  }

  //父类没实现的，子类实现
  @override
  void sleepSafe() {
    // TODO: implement sleepSafe
  }
}

/*
* 抽象类不但可以 implements(实现)还可以extends(继承)
* */