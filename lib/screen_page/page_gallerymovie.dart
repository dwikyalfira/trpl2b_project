import 'package:flutter/material.dart';

class PageGalleryMovie extends StatefulWidget {
  const PageGalleryMovie({super.key});

  @override
  State<PageGalleryMovie> createState() => _PageGalleryMovie();
}

class _PageGalleryMovie extends State<PageGalleryMovie>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title:  const Text('Gallery Movie'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('gambar/gambar1.jpg', height: 150, width: 100,),
            Image.asset('gambar/gambar2.jpg', height: 150, width: 100,),
            Image.asset('gambar/gambar3.jpg', height: 150, width: 100,),
            Image.asset('gambar/gambar4.jpg', height: 150, width: 100,),
          ],
        ),
      ),
    );
  }
}