class Point {
  int x = 0;
  int y = 0;

  Point(int j, int k) {
    this.x = j;
    this.y = k;
  }

  Point.axis(this.x);  
  Point.origin();
}

class Class {
  String name = "";
  int number = 0;
  int grade = 0;

  // populate every value
  // just fill in name and number
  Class(this.name, this.number, this.grade);
  Class.ungraded(this.name, this.number);
}

class Student {
  String name = "";
  int student_id = 0;
  List<Class> courses = [];

  Student(this.name, this.student_id);
  Student.transfer(this.name);
  Student.template();

  void add_class(Class course) {
    this.courses.add(course);
  }

  String get_classes() {
    String courses_list = "Courses: ";
    for (int i = 0; i < courses.length; i++) {
      Class c = courses[i];
      print("\n [ " + c.name + " " + c.number.toString() + ", ${c.grade} ]");
    }
    return courses_list;
  }

  

  String information() {
    return "$name @$student_id";
  }
}

int main() {
  Student ken = new Student("Ken", 999);
  print(ken.information());
  
  Class csc202 = new Class("Data Structures", 202, 95);
  Class csc203 = new Class.ungraded("OOP", 203);

  ken.add_class(csc202);
  ken.add_class(csc203);

  print(ken.get_classes());
  return 0;
}