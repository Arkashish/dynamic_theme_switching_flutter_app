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
                  Container(
                    color: Colors.black,
                    height: 150,
                    width: double.infinity,
                    child: Center(
                        child: Column(
                      children: [
                        Container(
                          // margin: EdgeInsets.only(top:30),
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_92x30dp.png"),
                                fit: BoxFit.fill),
                          ),
                        ),
                        Text("Harsh ",
                            style: TextStyle(fontSize: 22, color: Colors.white))
                      ],
                    )),
                  ),
                  ListTile(
                    title: Text(
                      "Enable Dark Theme",
                    ),
                    trailing: Switch(
                      value: snapshot.data,
                      onChanged: bloc.changeTheme,
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text("Profile"),
                    onTap: () {
                      // we are popping so that the navigator shrinks back to its initial position when we navigate to new screen
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text("Settings"),
                    onTap: () {
                      // we are popping so that the navigator shrinks back to its initial position when we navigate to new screen
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.arrow_back),
                    title: Text("Logout"),
                    onTap: () {
                      // we are popping so that the navigator shrinks back to its initial position when we navigate to new screen
                      Navigator.of(context).pop();
                    },
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
