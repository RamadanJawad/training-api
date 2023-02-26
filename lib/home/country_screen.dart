import 'package:api/api/api_read.dart';
import 'package:api/model/country.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({super.key});

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Country>>(
        future: ApiReadData().readCountries(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LinearProgressIndicator();
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return ListView.builder(
                padding: EdgeInsets.all(5),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Text(
                    "${snapshot.data![index].id} - ${snapshot.data![index].name}",
                    style: GoogleFonts.cairo(fontSize: 18),
                  );
                });
          } else {
            return Text("no data");
          }
        },
      ),
    );
  }
}
