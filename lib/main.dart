import 'package:flutter/material.dart';
import 'pages/ai_chat_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'โปรไฟล์ของฉัน',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('โปรไฟล์ของฉัน'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        // เพิ่มส่วนนี้เพื่อรองรับกรณีหน้าจอมือถือเล็ก ป้องกัน UI ล้น (Overflow)
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),

              // รูปโปรไฟล์
              const CircleAvatar(
                radius: 60,
                backgroundColor: Colors.orange,
                child: Icon(Icons.person, size: 60, color: Colors.white),
              ),

              const SizedBox(height: 16),

              // ชื่อของคุณ
              const Text(
                'Nirapada Khattiya',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 8),

              // รหัสนักศึกษาของคุณ
              const Text(
                'รหัสนักศึกษา: 67030118',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),

              const SizedBox(height: 24),

              // Card ข้อมูล
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      _buildInfoRow(
                        Icons.school,
                        'คณะ',
                        'ครุศาสตร์อุตสาหกรรมและเทคโนโลยี',
                      ),
                      const Divider(),
                      _buildInfoRow(Icons.code, 'วิชาที่ชอบ', 'IT Support'),
                      const Divider(),
                      _buildInfoRow(
                        Icons.star,
                        'เป้าหมาย',
                        'มีเงินร้อยล้านจากการทำงาน',
                      ),
                      const Divider(),
                      _buildInfoRow(
                        Icons.email,
                        'email',
                        '67030118@kmitl.ac.th',
                      ),
                      const Divider(),
                      _buildInfoRow(Icons.phone, 'phone', '0923620828'),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // ปุ่มทดลอง AI Chat สำหรับกดข้ามหน้าไป pages/ai_chat_page.dart
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AiChatPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
                icon: const Icon(Icons.smart_toy),
                label: const Text(
                  'ทดลอง AI Chat',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper Method สำหรับสร้างแถวข้อมูล (ย้ายมาอยู่นอกสุดของคลาสให้ถูกต้อง)
  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.orange),
          const SizedBox(width: 12),
          Text('$label: ', style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
