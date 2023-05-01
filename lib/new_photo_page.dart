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
  final String _apiKey = '2CMxxZJ5e6lez4zIPjhIpHRgezq49MNJfSLgGnMXlf0';
  // final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController =ScrollController();
  final String _categorie = 'star wars';
  Color _iconColor = Colors.black12;
  IconData _icon = Icons.favorite_border;
  final List<String> _photosLinks = <String>[];
  List<String> _favoriteImageLink = <String>[''];
  int _page=1;
  bool _isLoading=false;

  @override
  void initState() {
    _loadImage();
    super.initState();
    apiCall(_categorie, _page);
    _scrollController.addListener(_onScroll);
  }

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

  Future<void> apiCall(String? search, int page) async {
    setState(() {
      _isLoading=true;
    });
    final String query = search ?? _categorie;
    final http.Client client = http.Client();
    final Uri uri =
        Uri.parse('https://api.unsplash.com/search/photos?query=$query&per_page=30&page=$page');
    final http.Response response;
    response = await client.get(uri,
        headers: <String, String>{'Authorization': 'Client-ID $_apiKey'});
    if (response.statusCode == 200) {
      final Map<String, dynamic> mapResponse =
          json.decode(response.body) as Map<String, dynamic>;
      final List<dynamic> result = mapResponse['results'] as List<dynamic>;
      setState(() {
        for (final dynamic imageResult in result) {
          final Map<String, dynamic> image =
              imageResult as Map<String, dynamic>;
          final Map<String, dynamic> url =
              image['urls'] as Map<String, dynamic>;
          final String urlImage = url['small'] as String;
          _photosLinks.add(urlImage);
        }
        _isLoading=false;
      });
    }
  }

  void _onScroll(){
    final double height=MediaQuery.of(context).size.height;
    final double offset= _scrollController.position.pixels;
    final double maxScroll= _scrollController.position.maxScrollExtent;
    if(!_isLoading &&maxScroll - offset < 2*height){
      ++_page;
      apiCall(_categorie, _page);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _photosLinks.isEmpty
            ? const LoadingEffect()
            : GridView.builder(
          controller: _scrollController,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: _photosLinks.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                      onLongPress: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(30, 30, 30, 155),
                                child: Card(
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: SizedBox(
                                    height: MediaQuery.of(context).size.height -
                                        MediaQuery.of(context).size.height / 2,
                                    child: Column(
                                      children: <Widget>[
                                        _imageWidget(context, index),
                                        Padding(
                                            padding: const EdgeInsets.all(20),
                                            child: _option(index))
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      },
                      child: Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: _imageWidget(context, index),
                            ),
                            Expanded(child: _option(index))
                          ]
                        ),
                      ));
                }));
  }

  Row _option(int index) {
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            setState(() {
              if (_icon == Icons.favorite_border) {
                _icon = Icons.favorite;
                _iconColor = Colors.redAccent;
                _favoriteImageLink.add(_photosLinks[index]);
                _storeImages(_favoriteImageLink);
              } else {
                _icon = Icons.favorite_border;
                _iconColor = Colors.black12;
                _favoriteImageLink.remove(_photosLinks[index]);
              }
            });
          },
          child: Icon(
            _icon,
            color: _iconColor,
          ),
        ),
        const Text(' Add to favorite'),
        // const Spacer(),
        // ElevatedButton(
        //     onPressed: () {
        //       setState(() {
        //         apiCall();
        //         _iconColor = Colors.black12;
        //         _icon = Icons.favorite_border;
        //       });
        //     },
        //     child: const Text('New photo'))
      ],
    );
  }

  ClipRRect _imageWidget(BuildContext context, int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.network(_photosLinks[index],
          fit: BoxFit.cover, loadingBuilder: _loadingImage),
    );
  }

  Widget _loadingImage(
      BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
    if (loadingProgress == null) {
      return child;
    }
    return Container(
      decoration: const BoxDecoration(color: Color(0xFFF4F4F4)),
    );
  }
}
