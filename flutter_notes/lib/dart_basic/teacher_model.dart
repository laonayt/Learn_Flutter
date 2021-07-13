import 'person_model.dart';

class TeacherModel extends PersonModel{
  String teach;
  String school;

  //默认的TeacherModel(this.teach, this.school)
  //继承父类后
  TeacherModel(this.teach, this.school) : super('王老师', '北京');

  //子类实现并重写父类的方法
  @override
  void stand() {
    print('${this.name} :stand');
    // TODO: implement stand
    super.stand();//这行也可以不写
  }

}

/*
* 继承后的构造函数
* */