import 'package:flutter/material.dart';
import 'package:kuis_048_ariq/data_buku.dart';
import 'package:kuis_048_ariq/halamandetail.dart';


class halamanutama extends StatelessWidget {
  const halamanutama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
          child:Text('Data Buku'),),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: listBuku.length,
        itemBuilder: (context, index)
        {
          final DataBuku buku = listBuku[index];
          return InkWell(
            onDoubleTap: () {

              Navigator.push(context, MaterialPageRoute(builder: (context) => halamandetail(buku : buku,),
              )
              );
            },
            child: Card(
              child: SizedBox(
                height: 200,
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width /4 ,
                        child: Image.network(
                            buku.imageLink,
                            fit: BoxFit.fill,
                        ),
                    ),

                    SizedBox(height: 30,),
                    Text(buku.title),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
