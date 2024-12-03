import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/auth_screen.dart';
import 'screens/home_screen.dart';
import 'screens/add_task_screen.dart';
import 'screens/profile_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyAnK8vg7cfCKuoo2iIheHTcWepZAFkR0SE",
      authDomain: "to-do-list-a6bc6.firebaseapp.com",
      projectId: "to-do-list-a6bc6",
      storageBucket: "to-do-list-a6bc6.firebasestorage.app",
      messagingSenderId: "765835965453",
      appId: "1:765835965453:web:878faf116db94b454b1144",
      measurementId: "G-3J7R75JYQC",
    ),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To-Do List',
      onGenerateRoute: (settings) {
        Widget page;
        switch (settings.name) {
          case '/home':
            page = HomeScreen();
            break;
          case '/add_task':
            page = AddTaskScreen();
            break;
          case '/profile':
            page = ProfileScreen();
            break;
          default:
            page = AuthScreen();
        }
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const curve = Curves.easeInOut;
            var tween = Tween(begin: Offset(1.0, 0.0), end: Offset.zero).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);
            return SlideTransition(position: offsetAnimation, child: child);
          },
        );
      },
      initialRoute: '/',
    );
  }
}
