class Car {
  String brand;
  String model;
  int year;
  Car(this.brand, this.model, this.year);

  void vroom() {
    print("Vroom Vroom");
  }
}

class ElectricCar extends Car {
  int batteryLife;
  ElectricCar(String brand, String model, int year, this.batteryLife)
      : super(brand, model, year);
}

void main() {
  Car myCar = Car('Porsche', '911', 2011);
  print('My car details:');
  print('Brand: ${myCar.brand}');
  print('Model: ${myCar.model}');
  print('Year: ${myCar.year}');
  myCar.vroom();
}
