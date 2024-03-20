import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> pages=[       //creating a list to load pages according to index
    CreatePost(),
    ViewPost(),
    ViewPost()
  ];

  int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(backgroundColor: Colors.black,),
        body: pages[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index)
          {
            print(index);
            setState(() {
              currentIndex=index;      //while clicking the menu,currentIndexvalue will change.
            });

          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: "Add Post"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.grid_view_outlined),
                label: "View all"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.view_agenda_outlined),
                label: "View my post")
          ],
        ),
      ),
    );
  }
}
