import 'package:flutter/material.dart';
import 'package:movie_list/list_movies.dart';
import 'package:movie_list/login.dart';
import 'package:movie_list/widgets/left_drawer.dart';
import 'package:movie_list/movie_form.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  final List<MovieItem> items = [
    MovieItem("Lihat Daftar Film", Icons.movie_creation_outlined ),
    MovieItem("Tambah Film", Icons.add_to_queue_rounded ),
    MovieItem("Logout", Icons.logout),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Movie List',
        ),
      ),
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        // Widget wrapper yang dapat discroll
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding dari halaman
          child: Column(
            // Widget untuk menampilkan children secara vertikal
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                child: Text(
                  'Welcome to Movie List V2!', // Text yang menandakan toko
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Grid layout
              GridView.count(
                // Container pada card kita.
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((MovieItem item) {
                  // Iterasi untuk setiap item
                  return MovieCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class MovieItem {
  final String name;
  final IconData icon;

  MovieItem(this.name, this.icon);
}

class MovieCard extends StatelessWidget {
  final MovieItem item;

  const MovieCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Material(
      color: Color.fromARGB(255, 177, 132, 255),
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () async{
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
            if (item.name == "Tambah Film") {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShopFormPage(),
                  ));
            }else if(item.name == "Lihat Daftar Film"){
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MoviePage(),
                  ));
            }else if(item.name == "Logout"){
              final response = await request.logout(
            // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
            "http://127.0.0.1:8000/auth/logout/");
        String message = response["message"];
        if (response['status']) {
          String uname = response["username"];
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("$message Sampai jumpa, $uname."),
          ));
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("$message"),
          ));
        }

            }
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
