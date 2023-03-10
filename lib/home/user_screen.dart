import 'package:api/api/api_read.dart';
import 'package:api/model/student.dart';
import 'package:api/screen/images_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder<List<Student>>(
            future: ApiReadData().readUsers(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const LinearProgressIndicator();
              } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return ImagesScreen(
                              student: snapshot.data![index],
                            );
                          }));
                        },
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                            snapshot.data![index].image!,
                          ),
                        ),
                        trailing: Text(
                          "${snapshot.data![index].imagesCount} images",
                          style: GoogleFonts.cairo(
                            fontSize: 15,
                          ),
                        ),
                        title: Text(
                          snapshot.data![index].firstName!,
                          style: GoogleFonts.cairo(fontSize: 16),
                        ),
                        subtitle: Text(
                          snapshot.data![index].email!,
                          style: GoogleFonts.cairo(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                      );
                    });
              }
              return Center(
                child: Text(
                  "no data",
                  style: GoogleFonts.cairo(fontSize: 20),
                ),
              );
            }));
  }
}
