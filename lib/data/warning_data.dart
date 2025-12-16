import 'package:kestirimci_bakim/models/warning.dart';

final List<WarningItem> warnings = [
  WarningItem(
    title: "CNC Torna 01",
    message: "Titreşim değeri eşik değeri aştı!",
    time: "5 dk önce",
  ),
  WarningItem(
    title: "Frez Makinesi 02",
    message: "Sıcaklık yükseliyor (85°C)",
    time: "12 dk önce",
  ),
  WarningItem(
    title: "Kesim Robotu 03",
    message: "Motor akımı anormal",
    time: "23 dk önce",
  ),
];
