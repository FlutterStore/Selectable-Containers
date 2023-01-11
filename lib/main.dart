// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:selectable_container/selectable_container.dart';
import 'selectable_container_grid.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _select1 = false;
  bool _select2 = false;
  bool _select3 = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Selectable Container',style: TextStyle(color: Colors.white,fontSize: 15)),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SelectableContainer(
              selectedBackgroundColorIcon: Colors.green,
              selectedBorderColor: Colors.green,
              onValueChanged: (newValue) {
                setState(() {
                  _select1 = newValue;
                });
              },
              marginColor: Colors.transparent,
              selected: _select1,
              padding: 8.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const <Widget>[
                  Text(
                    "Selectable Container",
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    "Default theme colors",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              )
            ),
          ),
          const SizedBox(height: 16.0),
          SelectableContainer(
            selectedBorderColor: Colors.teal.shade700,
            selectedBackgroundColor: Colors.grey.shade100,
            unselectedBorderColor: Colors.teal.shade600,
            unselectedBackgroundColor: Colors.grey.shade200,
            iconAlignment: Alignment.topLeft,
            icon: Icons.thumb_up,
            unselectedIcon: Icons.add_box,
            marginColor: Colors.transparent,
            elevation: 0,
            iconSize: 24,
            unselectedOpacity: 1,
            selectedOpacity: 0.8,
            selected: _select2,
            selectedBackgroundColorIcon: Colors.green,
            padding: 8.0,
            child: 
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const <Widget>[
                Text(
                  "Custom color",
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  'Icon, size, position en opacitiy changed',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            onValueChanged: (newValue) {
              setState(() {
                _select2 = newValue;
              });
            },
          ),
          const SizedBox(height: 16.0),
          SelectableContainer(
            iconSize: 20,
            icon: Icons.star,
            selectedBorderColor: Colors.green,
            marginColor: Colors.transparent,
            unselectedOpacity: 0.3,
            // opacityAnimationDuration: 300,
            selected: _select3,
            padding: 16.0,
            onValueChanged: (newValue) {
              setState(() {
                _select3 = newValue;
              });
            },
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/flutter.png'),
                      radius: 25.0,
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      'Develop with Flutter',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20.0,
                          color: Colors.green.shade700),
                    ),
                  ],
                )
              ],
            )
          ),
          const SizedBox(height: 16.0),
          const Expanded(child: SelectableContainerGrid()),
        ],
      ),
    );
  }

}