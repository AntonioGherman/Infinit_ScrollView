import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'loading_effect.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String photosLinks = '';

  Future<void> apiCall() async {
    final http.Response response;
    response = await http.get(
        Uri.parse('https://api.unsplash.com/photos/random/?client_id=2CMxxZJ5e6lez4zIPjhIpHRgezq49MNJfSLgGnMXlf0'));

    if (response.statusCode == 200) {
      final dynamic mapResponse = json.decode(response.body);
      setState(() {
        final Map<String, dynamic> url = mapResponse['urls'] as Map<String, dynamic>;
        final String urlImage = url['full'] as String;

        photosLinks = urlImage;
        // print(photosLinks);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Random Photo')),
      body: photosLinks == ''
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
        const Icon(
          Icons.favorite_border,
          size: 39,
        ),
        const Text(' Add to favorite', style: TextStyle(fontSize: 17)),
        const Spacer(),
        ElevatedButton(
            onPressed: () {
              apiCall();
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
          child: Image.network(photosLinks, fit: BoxFit.fitHeight, loadingBuilder: _loadingImage),
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
    super.initState();
  }
}
