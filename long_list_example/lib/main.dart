import 'package:flutter/material.dart';
import 'package:long_list_example/constants.dart';
import 'package:rive/rive.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: UIStrings.title,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(title: UIStrings.homeTitle),
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
  late int _selectedIndex;
  late List<Widget> _widgetOptions;

  @override
  void initState() {
    _selectedIndex = 0;
    _widgetOptions = <Widget>[
      ListView.builder(
        itemCount: Measures.longListLength,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: Measures.vehiclePadding,
            child: SizedBox(
              height: Measures.vehicleHeight,
              child: RiveAnimation.network(
                URLS.vehicle,
                fit: BoxFit.fitWidth,
              ),
            ),
          );
        },
      ),
      SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 0; i < Measures.wrongListLength; i++)
              Padding(
                padding: Measures.vehiclePadding,
                child: SizedBox(
                  height: Measures.vehicleHeight,
                  child: RiveAnimation.network(
                    URLS.vehicle,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              )
          ],
        ),
      ),
    ];
    super.initState();
  }

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
            label: UIStrings.longListTab,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.no_accounts,
            ),
            label: UIStrings.wrongListTab,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        onTap: (int index) => setState(
          () => _selectedIndex = index,
        ),
      ),
    );
  }
}
