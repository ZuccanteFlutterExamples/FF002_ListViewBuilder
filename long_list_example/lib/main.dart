import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    ListView.builder(
      itemCount: 10000,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 300,
          child: RiveAnimation.network(
            'https://cdn.rive.app/animations/vehicles.riv',
            fit: BoxFit.fitWidth,
          ),
        );
      },
    ),
    SingleChildScrollView(
      child: Column(
        children: [
          for (int i = 0; i < 100; i++)
            SizedBox(
              height: 300,
              child: RiveAnimation.network(
                'https://cdn.rive.app/animations/vehicles.riv',
                fit: BoxFit.fitWidth,
              ),
            )
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_tree_sharp,
            ),
            label: 'looong list',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.no_accounts,
            ),
            label: 'wrong list',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber,
        onTap: (int index) => setState(
          () => _selectedIndex = index,
        ),
      ),
    );
  }
}

/*
ListView.builder(
          itemCount: animations,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 300,
              child: RiveAnimation.network(
                url,
                fit: BoxFit.fitWidth,
              ),
            );
          },
        ),
*/
