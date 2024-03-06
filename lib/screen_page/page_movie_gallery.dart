import 'package:flutter/material.dart';

class PageMovieGallery extends StatefulWidget {
  const PageMovieGallery({super.key});

  @override
  State<PageMovieGallery> createState() => _PageMovieGalleryState();
}

class _PageMovieGalleryState extends State<PageMovieGallery> {

  List<Map<String, dynamic>> listMovie =[
    {
      "judul": "Ancika",
      "gambar": "gambar1.jpg",
      "harga": "Rp 45.000",

    },
    {
      "judul": "Pulang Tak Harus Rumah",
      "gambar": "gambar2.jpg",
      "harga": "Rp 50.000",

    },
    {
      "judul": "Sehidup Semati",
      "gambar": "gambar3.jpg",
      "harga": "Rp 45.000",

    },
    {
      "judul": "The Beepkeeper",
      "gambar": "gambar4.jpg",
      "harga": "Rp 45.000",

    },
    {
      "judul": "Diwe",
      "gambar": "gambar5.jpg",
      "harga": "Rp 45.000",

    },

    {
      "judul": "13 Bom di Jakarta",
      "gambar": "gambar6.jpg",
      "harga": "Rp 45.000",

    },
    {
      "judul": "Jatuh cinta seperti di film-film",
      "gambar": "gambar7.jpg",
      "harga": "Rp 45.000",

    },
    {
      "judul": "Air Mata di Ujung Sajadah",
      "gambar": "gambar8.jpg",
      "harga": "Rp 45.000",

    },

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Movie App - Gallery'),
      ),

      body: GridView.builder(
        itemCount: listMovie.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index){
          return GestureDetector(
            onTap: (){
              //to detail page when click
              Navigator.push(context, MaterialPageRoute(builder: (context)
              => PageDetailMovie('${listMovie[index]['judul']}', '${listMovie[index]['harga']}', '${listMovie[index]['gambar']}')
              ));
            },
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: GridTile(
                footer: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: Colors.black54),
                  ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('${listMovie[index]['judul']}',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold
                    ),
                ),
                    Text('${listMovie[index]['harga']}',
                      style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        color: Colors.red
                      ),
                    ),
                  ],
                ),
              ),
                child: Image.asset('gambar/${listMovie[index]['gambar']}',
                  fit: BoxFit.contain,
                  height: 185,
                  width: 185,
                ),
              ),
            ),
          );
        },
      )
        
          

    );
  }
}

class PageDetailMovie extends StatelessWidget {
  //menampung data
  final String itemJudul, itemHarga, itemGambar;
  const PageDetailMovie(this.itemJudul, this.itemHarga, this.itemGambar, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(itemJudul),
        backgroundColor: Colors.green,
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Image.asset('gambar/$itemGambar',
                fit: BoxFit.contain,
                ),

                Text('Harga : $itemHarga',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
