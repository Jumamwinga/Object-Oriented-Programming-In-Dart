import 'dart:convert';
import 'dart:io';

abstract class Animal {
  void speak();
  void eat();
}

class Dog implements Animal {
  String name;
  int age;

  Dog(this.name, this.age);

  @override
  void speak() {
    print('Bark!');
  }

  @override
  void eat() {
    print('$name is eating.');
  }

  void eatMultipleTimes(int times) {
    for (int i = 0; i < times; i++) {
      eat();
    }
  }
}

class GuardDog extends Dog {
  GuardDog(String name, int age) : super(name, age);

  @override
  void speak() {
    print('Woof! Woof!');
  }

  void guard() {
    print('$name is guarding.');
  }
}

Future<Dog> getDogFromFile() async {
  final file = File('dog_data.json');
  final contents = await file.readAsString();
  final jsonData = jsonDecode(contents);

  return Dog(jsonData['name'], jsonData['age']);
}

void main() async {
  Dog dog = await getDogFromFile();
  dog.speak();
  dog.eatMultipleTimes(3);

  GuardDog guardDog = GuardDog('Max', 4);
  guardDog.speak();
  guardDog.guard();
}
