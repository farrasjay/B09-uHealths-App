import 'package:flutter/material.dart';
import 'main.dart';
import 'form.dart';
import 'data.dart';

class DrawerApp extends StatelessWidget {
  const DrawerApp({key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Menambahkan clickable menu
          ListTile(
            title: const Text('Counter_7'),
            onTap: () {
              // Route menu ke halaman utama
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const CounterScreenState(title: 'counter_7')),
              );
            },
          ),
          ListTile(
            title: const Text('Tambah Budget'),
            onTap: () {
              // Route menu ke halaman tambah budget
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyBudgetFormPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Data Budget'),
            onTap: () {
              // Route menu ke halaman data budget
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyDataBudgetPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}