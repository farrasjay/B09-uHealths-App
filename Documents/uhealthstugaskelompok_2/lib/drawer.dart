import 'package:flutter/material.dart';
import 'package:uhealthstugaskelompok/page/infografik1.dart';
import 'package:uhealthstugaskelompok/page/infografik_home.dart';
import '../page/login.dart';
import '../page/home.dart';
import '../page/menu.dart';
import '../page/healthstatus_page.dart';
class DrawerClass extends StatefulWidget {
  DrawerClass({Key? key}) : super(key: key);

  @override
  _DrawerClassState createState() => _DrawerClassState();
}

class _DrawerClassState extends State<DrawerClass> {

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
              ),
              accountEmail: Text(PassData.fetcher + '@uhealths.co'),
              accountName: Text(
                PassData.fetcher,
                style: TextStyle(fontSize: 20),
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 15, 125),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text(
                'Home',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const MyHomePage(
                      title: 'Home',
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.password),
              title: const Text(
                'Login',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const LoginPage(),
                  ),
                );
              },
            ),
            const Divider(
              height: 10,
              thickness: 2,
            ),
            ListTile(
              leading: const Icon(Icons.menu_book),
              title: const Text(
                'Menu',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => UserMenuPage(
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.auto_graph),
              title: const Text(
                'Infographics',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => Infografik1Page(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.health_and_safety),
              title: const Text(
                'Health Status',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => HealthStatusPage(
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.calculate),
              title: const Text(
                'BMI & BMR',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const MyHomePage(
                      title: 'BMI & BMR',
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.forum),
              title: const Text(
                'Forums',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const MyHomePage(
                      title: 'Forums',
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.question_mark),
              title: const Text(
                'FAQ',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const MyHomePage(
                      title: 'FAQ',
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      );
  }
}