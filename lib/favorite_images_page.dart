import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritePhotosPage extends StatefulWidget {
  const FavoritePhotosPage({Key? key}) : super(key: key);

  @override
  State<FavoritePhotosPage> createState() => _FavoritePhotosPageState();
}

class _FavoritePhotosPageState extends State<FavoritePhotosPage> {
  List<String> _favoriteImages = [];

  Future<void> _getImages() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _favoriteImages = prefs.getStringList('links') ?? [];
    });
  }

  @override
  void initState() {
    _getImages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: _favoriteImages.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SizedBox(
                  //width: MediaQuery.of(context).size.width,
                  //height: MediaQuery.of(context).size.height - MediaQuery.of(context).size.height / 3,
                  child: _imageWidget(context, index),
                ));
          }),
    );
  }

  SizedBox _imageWidget(BuildContext context, int index) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(_favoriteImages[index], fit: BoxFit.fitHeight, loadingBuilder: _loadingImage),
        ),
      ),
    );
  }

  Widget _loadingImage(BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
    if (loadingProgress == null) {
      return child;
    }
    return Container(
      decoration: const BoxDecoration(color: Color(0xFFF4F4F4)),
    );
  }
}
