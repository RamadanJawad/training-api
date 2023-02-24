import 'package:api/api/api_read.dart';
import 'package:api/model/category.dart';
import 'package:api/screen/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<Categorys>>(
        future: ApiReadData().readCategory(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LinearProgressIndicator();
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => ProductScreen(
                                    categorys: snapshot.data![index],
                                  )));
                    },
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                        snapshot.data![index].image!,
                      ),
                    ),
                    title: Text(
                      snapshot.data![index].title!,
                      style: GoogleFonts.cairo(fontSize: 17),
                    ),
                    subtitle: Text(
                      "productsCount : ${snapshot.data![index].productsCount!}",
                      style: GoogleFonts.cairo(fontSize: 17),
                    ),
                  );
                });
          }
          return const Center(
            child: Text("no data"),
          );
        },
      ),
    );
  }
}
