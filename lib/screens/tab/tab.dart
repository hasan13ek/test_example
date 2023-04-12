import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_example/screens/tab/complaint_page/complaint_page.dart';
import 'package:test_example/view_models/tab_view_model.dart';

class TabBox extends StatefulWidget {
  const TabBox({Key? key}) : super(key: key);

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  List<Widget> screens = [];

  @override
  void initState() {
    screens.add(Container(
      color: Colors.white,
      child: const Center(
        child: Text('Home Screen'),
      ),
    ));
    screens.add(const ComplaintScreen());
    screens.add(Container(
      color: Colors.white,
      child: const Center(
        child: Text('Add Screen'),
      ),
    ));
    screens.add(Container(
      color: Colors.white,
      child: const Center(
        child: Text('Search Screen'),
      ),
    ));
    screens.add(Container(
      color: Colors.white,
      child: const Center(
        child: Text('Profile Screen'),
      ),
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var index = context.watch<TabViewModel>().activePageIndex;
    return Scaffold(
      backgroundColor: Colors.black,
      body: screens[index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) => Provider.of<TabViewModel>(context, listen: false)
            .changePageIndex(value),
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: index == 0 ? Colors.blue : Colors.grey,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.category,
                color: index == 1 ? Colors.blue : Colors.grey,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add,
                color: index == 2 ? Colors.blue : Colors.grey,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: index == 3 ? Colors.blue : Colors.grey,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: index == 4 ? Colors.blue : Colors.grey,
              ),
              label: ""),
        ],
      ),
    );
  }
}
