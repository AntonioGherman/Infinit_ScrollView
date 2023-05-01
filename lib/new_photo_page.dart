import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'photo/photo.dart';

class NewPhotoPage extends StatefulWidget {
  const NewPhotoPage({super.key});

  @override
  State<NewPhotoPage> createState() => _NewPhotoPageState();
}

class _NewPhotoPageState extends State<NewPhotoPage> {
  final String _apiKey = '2CMxxZJ5e6lez4zIPjhIpHRgezq49MNJfSLgGnMXlf0';
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final String _categorie = 'star wars';
  final List<Photo> _photosLinks = <Photo>[];
  int _page = 1;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    apiCall(_categorie, _page);
    _scrollController.addListener(_onScroll);
  }

  Future<void> apiCall(String? search, int page) async {
    setState(() {
      if (_page == 1) {
        _photosLinks.clear();
      }
      _isLoading = true;
    });
    final String query = search ?? _categorie;
    final http.Client client = http.Client();
    final Uri uri = Uri.parse('https://api.unsplash.com/search/photos?query=$query&per_page=30&page=$page');
    final http.Response response;
    response = await client.get(uri, headers: <String, String>{'Authorization': 'Client-ID $_apiKey'});
    if (response.statusCode == 200) {
      final Map<String, dynamic> mapResponse = json.decode(response.body) as Map<String, dynamic>;
      final List<dynamic> result = mapResponse['results'] as List<dynamic>;

      setState(() {
        _photosLinks
            .addAll(result.cast<Map<dynamic, dynamic>>().map((Map<dynamic, dynamic> json) => Photo.fromJson(json)));
        _isLoading = false;
      });
    }
  }

  void _onScroll() {
    final double height = MediaQuery.of(context).size.height;
    final double offset = _scrollController.position.pixels;
    final double maxScroll = _scrollController.position.maxScrollExtent;
    if (!_isLoading && maxScroll - offset < 2 * height) {
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
        appBar: AppBar(
          title: const Text('Random Photo'),
          centerTitle: true,
        ),
        body: Column(children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  child: TextField(
                      decoration: InputDecoration(
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0), borderSide: BorderSide.none),
                          contentPadding: const EdgeInsets.symmetric(vertical: 10),
                          hintText: 'Search',
                          prefixIcon: const Icon(Icons.search)),
                      controller: _controller)),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _page = 1;
                      apiCall(_controller.text, _page);
                    });
                  },
                  child: const Text('Search'))
            ],
          ),
          Expanded(
            child: GridView.builder(
                controller: _scrollController,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemCount: _photosLinks.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                      onLongPress: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Padding(
                                padding: const EdgeInsets.fromLTRB(30, 30, 30, 155),
                                child: Card(
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: SizedBox(
                                    height: MediaQuery.of(context).size.height - MediaQuery.of(context).size.height / 2,
                                    child: Column(
                                      children: <Widget>[
                                        _imageWidget(context, index),
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
                        child: _imageWidget(context, index),
                      ));
                }),
          )
        ]));
  }

  ClipRRect _imageWidget(BuildContext context, int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.network(_photosLinks[index].urls.small, fit: BoxFit.cover, loadingBuilder: _loadingImage),
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
