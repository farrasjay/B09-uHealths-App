import 'package:flutter/material.dart';
import 'package:uhealths/faq/page/question.dart';
import 'package:uhealths/pages/healthstatus_page.dart';
import 'package:uhealths/pages/login.dart';
import 'package:uhealths/pages/home.dart';
import 'package:uhealths/pages/menu.dart';
import 'package:uhealths/pages/discussionPage.dart';
import 'package:uhealths/pages/infografik1.dart';
import 'package:uhealths/pages/infografik_home.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class DrawerClass extends StatefulWidget {
  DrawerClass({Key? key}) : super(key: key);

  @override
  _DrawerClassState createState() => _DrawerClassState();
}

class _DrawerClassState extends State<DrawerClass> {

  @override
  Widget build(BuildContext context) {
    final request = context.read<CookieRequest>();
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
              ),
              accountEmail: Text(PassData.fetcher + '@uhealths.co', style: TextStyle(color: Colors.white),),
              accountName: Text(
                PassData.fetcher,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              decoration: BoxDecoration(
                color: Color(0xFF0D47A1),
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
             ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text("Logout", style: TextStyle(fontSize: 20)),
              onTap: () async {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          UserMenuPage(),
                ));
                PassData.username = "";
                final response = await request.logout(
                    "https://pbp-midterm-project-b09-production.up.railway.app/logout-flutter/");
                // "http://localhost:8000/logout-flutter/");
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Row(
                      children: const [
                        Icon(Icons.info_outline_rounded,
                            size: 30, color: Colors.white),
                        Spacer(
                          flex: 1,
                        ),
                        Text("Logout successful",
                            style: TextStyle(color: Colors.white, fontSize: 20))
                      ],
                    ),
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
                    builder: (BuildContext context) => const Infografik1Page(),
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
              leading: const Icon(Icons.forum),
              title: const Text(
                'Forums',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const Forum(),
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
                    builder: (BuildContext context) => const QuestionPage(
                      // title: 'FAQ',
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