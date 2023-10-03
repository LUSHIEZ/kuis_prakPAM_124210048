import 'dart:html';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:kuis_048_ariq/data_buku.dart';

class halamandetail extends StatefulWidget {
  const halamandetail({super.key, required this.buku});
  final DataBuku buku;

  @override
  State<halamandetail> createState() => _halamandetailState();
}

class _halamandetailState extends State<halamandetail> {
  bool isBookmark = false;

  void toggleBookmark() {
  setState(() {
  isBookmark = !isBookmark;
  });


  var snackBar = SnackBar(
  content: Text(
  isBookmark ? 'Ditambahkan ke Bookmark' : 'Dihapus dari Bookmark',
  ),

    backgroundColor: (isBookmark)? Colors.green: Colors.red,
    duration: Duration(seconds: 1),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
        child: Text(widget.buku.title),),
        backgroundColor: Colors.blue,
          actions: <Widget>[



            IconButton(

                icon:Icon(isBookmark?Icons.bookmark:Icons.bookmark_border),
                 onPressed: toggleBookmark,

            ),
        ],

      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              child: Image.network(widget.buku.imageLink),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Container(

                child: Column(
                children: [

                  Text("Judul Buku :" ,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(widget.buku.title,),
                  SizedBox(height: 20,),

                  Text("Pengarang :",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(widget.buku.author,),
                  SizedBox(height: 20,),

                  Text("Tahun Terbit :",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),

                  Text( widget.buku.year.toString()),

                  SizedBox(height: 20,),

                  Text("Negara :",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(widget.buku.country),
                  SizedBox(height: 20,),

                  Text("Bahasa :",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(widget.buku.language),
                  SizedBox(height: 10,),

                  Text("Jumlah Halaman :",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(widget.buku.pages.toString()),

                ],
              ),
              ),

            ),


            SizedBox(height: 40,),


          ],
        ),
      ),

      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(onPressed:(){
            _launcher(widget.buku.imageLink);
          }, child: Icon(Icons.open_in_browser),
          ),
          SizedBox(height: 10,),

          FloatingActionButton(onPressed: (){
            _launcher(widget.buku.link);

            }, child: Icon(Icons.link)
          ),
        ],
      ),
    );
  }

  Future<void> _launcher(String url) async{
    final Uri _url = Uri.parse(url);
    if(!await launchUrl(_url)){
      throw Exception("gagal membuka url : $_url");
    }
  }
}
