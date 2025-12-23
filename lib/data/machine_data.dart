import 'package:kestirimci_bakim/models/machine.dart';

final List<Machine> machines = [
  Machine(
    id: "m1",
    name: "CNC Torna 01",
    status: "Normal",
    health: 92,
    temp: 55.2,
    speed: 1200,
    data1: "Titreşim: 2.3 mm/s",
    data2: "Spindle Yükü: %57",
   
  ),
  Machine(
    id: "m2",
    name: "Frez Makinesi 02",
    status: "Kritik",
    health: 48,
    temp: 78.6,
    speed: 900,
    data1: "Titreşim: 6.8 mm/s",
    data2: "Spindle Yükü: %82",
  ),
  Machine(
    id: "m2",
    name: "Kesim Robotu 03",
    status: "Normal",
    health: 75,
    temp: 62.0,
    speed: 1400,
    data1: "Vibrasyon RMS: 1.9 mm/s",
    data2: "Motor Akımı: 11.4 A",
  ),
];
Machine getMachineById(String id) {
  return machines.firstWhere((m) => m.id== id);
}