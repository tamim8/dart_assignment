import 'package:dart_assignment/car.dart';

/* This is the first assignment of ostad flutter batch seven
  * Completed by TAMIM HASAN 
  * Date: 15-06-2024
  */
  
void main() {
  //-- create a new car object
  Car car1 = Car(brand: 'Ford', model: 'GT', year: 2022);
  car1.drive(miles: 200); // drive the car
  _printCar(car: car1, name: 'Mustang'); // print the car

  //-- create a new car object
  Car car2 = Car(brand: 'Honda', model: 'EX', year: 2021);
  car2.drive(miles: 350); // drive the car
  _printCar(car: car2, name: 'Civic'); // print the car

  //-- create a new car object
  Car car3 = Car(brand: 'Toyota', model: 'XSE', year: 2023);
  car3.drive(miles: 1500); // drive the car
  _printCar(car: car3, name: 'Camry'); // print the car

  //-- print total number of car objects
  print('Toral Car: ${Car.numberOfCars}');
}

//-- this method is called to print the car object.
void _printCar({required Car car, required String name}) {
  print('\nCar Name: $name \nBrand: ${car.getBrand()}');
  print('Model: ${car.getModel()}\nYear: ${car.getYear()}');
  print('MilesDriven: ${car.getMilesDriven()}\nAge: ${car.getAge()}');
  print('________________________________________________');
}
