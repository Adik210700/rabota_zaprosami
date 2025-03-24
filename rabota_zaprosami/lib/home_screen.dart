import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rabota_zaprosami/picture_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PictureModel? _picture;
  Future<void> fetchPicture() async {
    final dio = Dio();
    final result = await dio.get('https://dog.ceo/api/breeds/image/random');
    _picture = PictureModel.fromMap(result.data);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _picture == null
                ? Container(
                    height: 300,
                    width: 300,
                    color: Colors.red,
                  )
                : SizedBox(
                    width: 300,
                    height: 300,
                    child: Image.network(_picture?.message ?? ''),
                  ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  fetchPicture();
                },
                child: Text('push'))
          ],
        ),
      ),
    );
  }
}
