class Machine {
  final String name;
  final String status;   // Normal / Kritik
  final int health;      // Sağlık %
  final double temp;     // Sıcaklık (°C)
  final int speed;       // RPM
  final String data1;    
  final String data2;    

  Machine({
    required this.name,
    required this.status,
    required this.health,
    required this.temp,
    required this.speed,
    required this.data1,
    required this.data2,
  });
}
