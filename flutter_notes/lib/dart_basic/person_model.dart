import 'sleep.dart';
import 'eat.dart';

class PersonModel implements eat {//implements 实现了eat这个抽象类
  String name;
  String home;

  //必选参数构造函数
  PersonModel(this.name, this.home);

  //定义一个父类的方法
  void stand() {
    print('person stand');
  }

  //接口的实现
  @override
  void eatFood() {
    // TODO: implement eatFood
    print('eat apple');
  }

  @override
  void eatShit() {
    // TODO: implement eatShit
    print('what the hell');
  }
}

/*
* 实现抽象类的方法，必须重写
* 不是抽象类，不能光写声明，不写实现
* */