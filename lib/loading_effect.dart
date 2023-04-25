import 'package:flutter/material.dart';

class LoadingEffect extends StatelessWidget {
  const LoadingEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
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
                _blankBox(context),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                  child: _blankOption(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _blankOption() {
    return Row(
      children: <Widget>[
        const Icon(
          Icons.circle,
          size: 39,
          color: Color(0xFFF4F4F4),
        ),
        Container(
          decoration: const BoxDecoration(color: Color(0xFFF4F4F4)),
          child: const Text(' Add to favorite', style: TextStyle(fontSize: 17, color: Color(0xFFF4F4F4))),
        ),
        const Spacer(),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFF4F4F4)),
          child: const Text('New photo', style: TextStyle(color: Color(0xFFF4F4F4))),
        )
      ],
    );
  }

  SizedBox _blankBox(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Container(
              decoration: const BoxDecoration(color: Color(0xFFF4F4F4)),
            )),
      ),
    );
  }
}
