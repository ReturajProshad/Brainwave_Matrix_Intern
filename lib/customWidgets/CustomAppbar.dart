import 'package:flutter/material.dart';

class Customappbar extends StatelessWidget implements PreferredSizeWidget {
  final String headings;
  Customappbar({super.key, required this.headings});
  List<Color> _gradient = [Colors.blue, Colors.purple];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: _gradient,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          headings,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
