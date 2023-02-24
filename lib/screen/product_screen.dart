import 'package:api/api/api_read.dart';
import 'package:api/model/category.dart';
import 'package:api/model/product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductScreen extends StatefulWidget {
  final Categorys? categorys;
  const ProductScreen({super.key, this.categorys});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(widget.categorys!.title!),
      ),
      body: FutureBuilder<List<Product>>(
          future: ApiReadData().readProducts(widget.categorys!.id!),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return LinearProgressIndicator();
            } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                          snapshot.data![index].image!,
                        ),
                      ),
                      title: Text(
                        snapshot.data![index].name!,
                        style: GoogleFonts.cairo(fontSize: 17),
                      ),
                      subtitle: Text(
                        "productsCount : ${snapshot.data![index].description!}",
                        style: GoogleFonts.cairo(
                            fontSize: 17,
                            textStyle:
                                TextStyle(overflow: TextOverflow.ellipsis)),
                      ),
                    );
                  });
            }
            return Center(
              child: Text("no data"),
            );
          }),
    );
  }
}
