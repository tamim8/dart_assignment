class Car {
  // Static property to keep track of the number of Car objects created
  static int numberOfCars = 0;

  final String brand;
  final String model;
  final int year;
  late double milesDriven = 0.0;

  // Constructor
  Car({
    required this.brand,
    required this.model,
    required this.year,
  }) {
    // Increment the numberOfCars property, whenever a new Car object is created
    numberOfCars++;
  }

  // this method takes a double parameter and adds it to the milesDriven property
  void drive({required double miles}) {
    milesDriven = miles;
  }

  // this method returns the value of the milesDriven property
  double getMilesDriven() {
    return milesDriven;
  }

  // this method returns the value of the brand property
  String getBrand() {
    return brand;
  }

  // this method returns the value of the model property
  String getModel() {
    return model;
  }

  // this method returns the value of the year property
  int getYear() {
    return year;
  }

  // this method returns the age of the car
  int getAge() {
    return 2024 - year;
  }
}
