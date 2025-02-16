import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  final Function(String) onCategorySelected;

  Sidebar({required this.onCategorySelected});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          Container(
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
                TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(Icons.search, color: Colors.white),
                  ),
                  style: TextStyle(color: Colors.white),
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
          Positioned(
            bottom: 16,
            right: 16,
            child: FloatingActionButton(
              onPressed: () {
                // Handle search action
                showSearchDialog(context);
              },
              child: Icon(Icons.search),
              backgroundColor: Colors.blueGrey[700],
            ),
          ),
        ],
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

  void showSearchDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Search"),
          content: TextField(
            decoration: InputDecoration(hintText: "Enter search term"),
            onSubmitted: (value) {
              Navigator.pop(context);
              // Perform search action
              onCategorySelected(value);
            },
          ),
          actions: [
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text("Search"),
              onPressed: () {
                // Perform search action
                Navigator.pop(context);
                onCategorySelected("Search term");
              },
            ),
          ],
        );
      },
    );
  }
}
