import 'package:flutter/material.dart';

class ChatTechnicianScreenBody extends StatelessWidget {
  const ChatTechnicianScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("المحادثات"), centerTitle: true),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.blue.withValues(alpha: .1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.chat, size: 50, color: Colors.blue),
              ),

              const SizedBox(height: 24),

              const Text(
                "ميزة الدردشة قريبًا",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 12),

              const Text(
                "نحن نعمل على إضافة ميزة الدردشة لتتمكن من التواصل بسهولة مع العملاء.\nتابعنا وسيتم تفعيلها قريبًا!",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, height: 1.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
