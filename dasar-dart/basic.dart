// function
void sum(n1, n2) {
  var total;
  total = n1 + n2;
  print(total);
}

// class Mamalia
class Mamalia {
  void menyusui() {
    print('Gave milk to my child');
  }
}

// class with mixin
mixin Skills {
    var run = 100;
}

// class with extends more than 1
class People extends Mamalia with Skills {
  String name;
  int age;

  // constructor
  People(this.name, this.age);
}

void main(List<String> args) {
  print('Hello!');
  // calling function
  sum(1, 2);

  // making an object
  var people1 = People('Ian', 25);
  var people2 = People('Nadin', 22);
  // print an object
  print('Name: ' + people1.name + ' Age: ' + people1.age.toString());
  print(people1.run);
  print('Name: ' + people2.name + ' Age: ' + people2.age.toString());
  people2.menyusui();
}
