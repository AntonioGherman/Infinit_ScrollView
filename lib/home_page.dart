import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'favorite_images_page.dart';
import 'new_photo_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();

}

int _currentIndex = 0;

class _HomePageState extends State<HomePage> {
  List<Widget> page = <Widget>[NewPhotoPage(), FavoritePhotosPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: _currentIndex == 0 ? Text('Random Photo') : Text('Favorite Photos'),
          centerTitle: true,
        ),
        body: page[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() {
            _currentIndex = index;
          }),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.photo,
                  color: _currentIndex == 0 ? Colors.blue : null),
              label: 'New Photo',

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite,
                  color: _currentIndex == 1 ? Colors.redAccent : null),
              label: 'Favorite photos',
            )
          ],
        ));
  }
}