import 'package:flutter/material.dart';

// เพิ่มฟังก์ชัน main() เพื่อเป็นจุดเริ่มต้นของแอปพลิเคชัน
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      home: Scaffold(
        backgroundColor:
            Colors.grey.shade100, // สีพื้นหลังแอปเพื่อขับให้ Card เด่นขึ้น
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            // เรียกใช้งาน WeatherCard ตัวใหม่ของคุณ พร้อมส่งค่าตัวอย่าง
            child: WeatherCard(
              city: 'Bangkok',
              temperature: 32.5,
              condition: 'sunny',
              humidity: 65,
            ),
          ),
        ),
      ),
    );
  }
}

// ==========================================
// คลาส WeatherCard ของคุณ (UI เหมือนเดิม 100% ห้ามเปลี่ยน)
// ==========================================
class WeatherCard extends StatelessWidget {
  final String city;
  final double temperature;
  final String condition;
  final int humidity;

  const WeatherCard({
    super.key,
    required this.city,
    required this.temperature,
    required this.condition,
    required this.humidity,
  });

  IconData _getWeatherIcon() {
    switch (condition.toLowerCase()) {
      case 'sunny':
        return Icons.wb_sunny;
      case 'cloudy':
        return Icons.cloud;
      case 'rainy':
        return Icons.water_drop;
      default:
        return Icons.wb_cloudy_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        width: 300,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [Colors.blue.shade800, Colors.blue.shade400],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              city,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 20),
            Icon(_getWeatherIcon(), size: 80, color: Colors.white),
            const SizedBox(height: 20),
            Text(
              '${temperature.toStringAsFixed(1)}°C',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 64,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              condition.toUpperCase(),
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Divider(color: Colors.white24, height: 30, thickness: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.water_drop, color: Colors.white, size: 20),
                const SizedBox(width: 8),
                Text(
                  'Humidity: $humidity%',
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
