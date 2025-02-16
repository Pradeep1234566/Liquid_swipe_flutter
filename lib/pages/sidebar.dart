import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  final Function(String) onCategorySelected;

  Sidebar({required this.onCategorySelected});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.blueGrey[900], // Change background color
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blueGrey[700]),
              child: Text(
                "Categories",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            _drawerItem(context, "Nature"),
            _drawerItem(context, "Cars"),
            _drawerItem(context, "Animals"),
            _drawerItem(context, "Technology"),
            _drawerItem(context, "Space"),
            _drawerItem(context, "Abstract"),
          ],
        ),
      ),
    );
  }

  Widget _drawerItem(BuildContext context, String category) {
    return ListTile(
      title: Text(
        category,
        style:
            TextStyle(fontSize: 18, color: Colors.white), // Change text color
      ),
      onTap: () {
        Navigator.pop(context); // Close sidebar
        onCategorySelected(category); // Pass selected category back
      },
    );
  }
}
