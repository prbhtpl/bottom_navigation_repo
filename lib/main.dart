// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Bottom Navigation bar';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyWidget(),
    );
  }
}

enum SingingCharacter { Male, Female }

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    FirstPage(),
    SecondPage(),
    ThirdPage(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  SingingCharacter? _character = SingingCharacter.Male;

  void _showbottomBar(context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(40),
          ),
        ),
        enableDrag: true,
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height: MediaQuery.of(context).size.height / 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    selected: false,
                    title: const Text('Male'),
                    leading: Radio<SingingCharacter>(
                      value: SingingCharacter.Male,
                      groupValue: _character,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Female'),
                    leading: Radio<SingingCharacter>(
                      value: SingingCharacter.Female,
                      groupValue: _character,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () {
              _showbottomBar(context);
            },
            icon: Icon(
              Icons.settings,
              size: 30,
              color: Colors.amber,
            ),
          ),
        ],
        title: Text('Bottom Navigation Bar'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: JustPage(),
    );
  }
}

class JustPage extends StatefulWidget {
  const JustPage({Key? key}) : super(key: key);

  @override
  _JustPageState createState() => _JustPageState();
}

class _JustPageState extends State<JustPage> {
  bool hasBanner = false;
  final styleContent = TextStyle(color: Colors.white, fontSize: 16);
  final styleAction = TextStyle(color: Colors.white, fontSize: 20);
  void updateCard() => Scaffold.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(SnackBar(
      backgroundColor: Colors.greenAccent,
      content: Text('Clicked on Update'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {},
      ),
    ));
  void hideBanner() => setState(() {
        hasBanner = false;
      });
  void showBanner() => setState(() {
        hasBanner = true;
      });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        actions: [
          if (!hasBanner)
            IconButton(
              onPressed: showBanner,
              icon: Icon(Icons.visibility),
            ),
        ],
      ),
      body: Column(
        children: <Widget>[
          if (hasBanner)
            GestureDetector(
              onTap: updateCard,
              child: MaterialBanner(
                leading: Icon(
                  Icons.credit_card,
                  color: Colors.white,
                  size: 28,
                ),
                content: Text(
                    'Your card expired.Update your credit card information'),
                actions: [
                  TextButton(
                    onPressed: hideBanner,
                    child: Text('Dismiss', style: styleAction),
                  )
                ],
                padding: EdgeInsets.all(16),
                backgroundColor: Colors.indigoAccent,
                contentTextStyle: styleContent,
              ),
            )
          // Expanded(
          //   child: ListView(children: buildImages(),),
          // ),
        ],
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircleAvatar(
          radius: 56,
          backgroundImage: AssetImage('assets/download.jpg'),
        ),
      ),
    );
  }
}

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  SingingCharacter? _character = SingingCharacter.Male;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextButton(
          onPressed: () {},
          child: Text('Open for nothing'),
        ),
        ListTile(
          title: const Text('Lafayette'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.Male,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Thomas Jefferson'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.Female,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
