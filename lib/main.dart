import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.darkThemeEnabled,
      initialData: false,
      builder: (context, snapshot) => MaterialApp(
          theme: snapshot.data ? ThemeData.dark() : ThemeData.light(),
          home: Scaffold(
            appBar: AppBar(
              title: Text("Dynamic Switching"),
            ),
            body: Center(
              child: Text("Hello world"),
            ),
            drawer: Drawer(
              child: ListView(
                children: [
                  ListTile(
                    title: Text(
                      "Enable Dark Theme",
                    ),
                    trailing: Switch(
                      value: snapshot.data,
                      onChanged: bloc.changeTheme,
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

class Bloc {
  final _themeController = StreamController<bool>();
  get changeTheme => _themeController.sink.add;
  get darkThemeEnabled => _themeController.stream;
}

final bloc = Bloc();

// Initial app with switching screens

// import 'package:flutter/material.dart';
// import 'package:flutter/semantics.dart';

// void main() =>  runApp(MyApp());

// class MyApp extends StatefulWidget{
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {

//   bool darkthemeenabled=false;

//   @override
//   Widget build(BuildContext context){
//     return MaterialApp(
//       theme: darkthemeenabled?ThemeData.dark():ThemeData.light(),
//       home: HomePage(),
//     );
//   }

//   Widget HomePage() {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Dynamic Switching"),
//       ),
//       body: Center(
//         child: Text("Hello world"),
//       ),
//       drawer: Drawer(
//         child: ListView(
//           children: [
//             ListTile(
//               title: Text(
//                 "Enable Dark Theme",
//               ),
//               trailing: Switch(
//                 value: darkthemeenabled,
//                 onChanged: (changedTheme) {
//                   setState(() {
//                     darkthemeenabled=changedTheme;
//                   });

//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
