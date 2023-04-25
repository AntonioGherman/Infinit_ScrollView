import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'loading_effect.dart';

class NewPhotoPage extends StatefulWidget {
  const NewPhotoPage({super.key});

  @override
  State<NewPhotoPage> createState() => _NewPhotoPageState();
}

class _NewPhotoPageState extends State<NewPhotoPage> {
  String _photosLinks = '';
  Color _iconColor = Colors.black12;
  IconData _icon = Icons.favorite_border;
  List<String> _favoriteImageLink = <String>[''];

  Future<void> _loadImage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _favoriteImageLink = prefs.getStringList('links') ?? <String>[''];
    });
  }

  Future<void> _storeImages(List<String> favoriteImage) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setStringList('links', favoriteImage);
    });
  }

  Future<void> apiCall() async {
    final http.Response response;
    response = await http.get(
        Uri.parse('https://api.unsplash.com/photos/random/?client_id=2CMxxZJ5e6lez4zIPjhIpHRgezq49MNJfSLgGnMXlf0'));

    if (response.statusCode == 200) {
      final dynamic mapResponse = json.decode(response.body);
      setState(() {
        final Map<String, dynamic> url = mapResponse['urls'] as Map<String, dynamic>;
        final String urlImage = url['full'] as String;

        _photosLinks = urlImage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _photosLinks == ''
          ? const LoadingEffect()
          : Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - MediaQuery.of(context).size.height / 3,
                    child: Column(
                      children: <Widget>[
                        _imageWidget(context),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                          child: _option(),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  Row _option() {
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            setState(() {
              if (_icon == Icons.favorite_border) {
                _icon = Icons.favorite;
                _iconColor = Colors.redAccent;
                _favoriteImageLink.add(_photosLinks);
                _storeImages(_favoriteImageLink);
              } else {
                _icon = Icons.favorite_border;
                _iconColor = Colors.black12;
                _favoriteImageLink.remove(_photosLinks);
              }
            });
          },
          child: Icon(
            _icon,
            size: 39,
            color: _iconColor,
          ),
        ),
        const Text(' Add to favorite', style: TextStyle(fontSize: 17)),
        const Spacer(),
        ElevatedButton(
            onPressed: () {
              setState(() {
                apiCall();
                _iconColor = Colors.black12;
                _icon = Icons.favorite_border;
              });
            },
            child: const Text('New photo'))
      ],
    );
  }

  SizedBox _imageWidget(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(_photosLinks, fit: BoxFit.fitHeight, loadingBuilder: _loadingImage),
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

  @override
  void initState() {
    apiCall();
    _loadImage();
    super.initState();
  }
}
