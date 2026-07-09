import 'package:flutter/material.dart';

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
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue, // กำหนดโทนสีหลักของแอป
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Weather Forecast'),
          centerTitle: true,
        ),
        body: const Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            // เรียกใช้งาน WeatherCard พร้อมส่งค่าตัวอย่าง (UI เหมือนเดิม 100%)
            child: WeatherCard(
              cityName: 'Bangkok',
              temperature: 32.5,
              weatherCondition: 'sunny',
              humidity: 65,
            ),
          ),
        ),
      ),
    );
  }
}

// ==========================================
// WeatherCardชิ้นเดิมของคุณ (UI เหมือนเดิมทุกประการ)
// ==========================================
class WeatherCard extends StatelessWidget {
  final String cityName;
  final double temperature;
  final String weatherCondition; // 'sunny', 'cloudy', 'rainy'
  final int humidity;

  // Constructor รับค่าผ่าน Parameters
  const WeatherCard({
    super.key,
    required this.cityName,
    required this.temperature,
    required this.weatherCondition,
    required this.humidity,
  });

  // ฟังก์ชันเลือกไอคอนตามสภาพอากาศ
  IconData _getWeatherIcon() {
    switch (weatherCondition.toLowerCase()) {
      case 'sunny':
        return Icons.wb_sunny_rounded;
      case 'cloudy':
        return Icons.cloud_rounded;
      case 'rainy':
        return Icons.umbrella_rounded;
      default:
        return Icons.help_outline_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      // ใช้ colorScheme สำหรับ Material 3 (สีพื้นหลัง Card แบบอ่อน)
      color: Theme.of(context).colorScheme.surfaceVariant,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ชื่อเมือง
            Text(
              cityName,
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // ไอคอนสภาพอากาศและอุณหภูมิ
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  _getWeatherIcon(),
                  size: 64,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 20),
                Text(
                  '${temperature.toStringAsFixed(1)}°',
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // ความชื้น
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.water_drop_outlined, size: 18),
                const SizedBox(width: 4),
                Text(
                  'Humidity: $humidity%',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
