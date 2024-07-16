import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  static const appTitle = 'Trang chu';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: appTitle,
      home: FoodAppBar(title: appTitle),
    );
  }
}

class FoodAppBar extends StatefulWidget {
  const FoodAppBar({super.key, required this.title});

  final String title;

  @override
  State<FoodAppBar> createState() => _FoodAppBarState();
}

class _FoodAppBarState extends State<FoodAppBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Đánh giá',
      style: optionStyle,
    ),
    Text(
      'Index 1: Chia sẻ',
      style: optionStyle,
    ),
    Text(
      'Index 2: Gửi bạn bè',
      style: optionStyle,
    ),
    Text(
      'Index 3: Phản hồi',
      style: optionStyle,
    ),
    Text(
      'Index 4: Quà',
      style: optionStyle,
    ),
    Text(
      'Index 5: Thông tin App',
      style: optionStyle,
    )
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(widget.title),
        ),
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu));
        }),
      ),
      // body: Center(
      //   child: _widgetOptions[_selectedIndex],
      // ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          GridTile(
            footer: Container(
              color: Colors.black38,
              padding: EdgeInsets.zero,
              child: const Row(
                children: [
                  Icon(Icons.favorite, color: Colors.pink),
                  Center(
                    child:  Text(
                      'Bánh Cuốn Bà Xuân',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white
                      ),
                    ),
                  ),
                  Icon(Icons.chevron_right, color: Colors.white),
                ],
              ),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(),
              child: const Image(
                image: AssetImage('images/1b86e2cfa14049a98452b370528d6ef8.png'),
              ),
            ),
          ),
          GridTile(
            footer: Container(
              color: Colors.black38,
              child: const Center(
                child:  Text(
                  'Bánh Cuốn Bà Xuân',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white
                  ),
                ),
              ),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(),
              child: const Image(
                image: AssetImage('images/2e4fa70465a940a2a33d61919b8cec2c.png'),
              ),
            ),
          ),
          GridTile(
            footer: Container(
              color: Colors.black38,
              child: const Center(
                child:  Text(
                  'Bánh Cuốn Bà Xuân',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white
                  ),
                ),
              ),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(),
              child: const Image(
                image: AssetImage('images/1446cfe3de32495482afb1ed63b18b7d.png'),
              ),
            ),
          ),
          GridTile(
            footer: Container(
              color: Colors.black38,
              child: const Center(
                child:  Text(
                  'Bánh Cuốn Bà Xuân',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white
                  ),
                ),
              ),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(),
              child: const Image(
                image: AssetImage('images/525861369a3643648daea3853fb8c32e.png'),
              ),
            ),
          ),
          GridTile(
            footer: Container(
              color: Colors.black38,
              child: const Center(
                child:  Text(
                  'Bánh Cuốn Bà Xuân',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white
                  ),
                ),
              ),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(),
              child: const Image(
                image: AssetImage('images/c3985b3e09924519a23c0502bbc6c740.png'),
              ),
            ),
          ),
          GridTile(
            footer: Container(
              color: Colors.black38,
              child: const Center(
                child:  Text(
                  'Bánh Cuốn Bà Xuân',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white
                  ),
                ),
              ),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(),
              child: const Image(
                image: AssetImage('images/ed5a065b62b542d6a1a1dcc085344c9a.png'),
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
              height: 64.0,
              child:  DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Text('Chức Năng', style: TextStyle(color: Colors.white, fontSize: 18),),
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  const Icon(Icons.star),
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.5, color: Colors.black12),
                      ),
                    ),
                    child: const Text(
                      'Đánh giá',
                    ),
                  ),
                ],
              ),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Chia sẻ'),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Gửi bạn bè'),
              selected: _selectedIndex == 2,
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Phản hồi'),
              selected: _selectedIndex == 3,
              onTap: () {
                _onItemTapped(3);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Quà'),
              selected: _selectedIndex == 4,
              onTap: () {
                _onItemTapped(4);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Thông tin app'),
              selected: _selectedIndex == 5,
              onTap: () {
                _onItemTapped(5);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
