import 'package:flutter/material.dart';
import 'package:kuis_h/model/movie_model.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieDetailPage extends StatelessWidget {
  final MovieModel movie;
  const MovieDetailPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // gambar utama
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(movie.imgUrl),
            ),
            SizedBox(height: 12),

            Text(
              "${movie.title} (${movie.year})",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              "directed by : ${movie.director}",
              style: TextStyle(fontSize: 18, color: Colors.green),
            ),
            SizedBox(height: 8),
            // tentang game
            Text(
              "Synopsis",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(movie.synopsis),
            SizedBox(height: 16),
            Text(
              "rating: ${movie.rating}",
              style: TextStyle(color: Colors.grey[700]),
            ),
            SizedBox(height: 8),
            // tag
            Text(
              "genre: ${movie.genre}",
              style: TextStyle(color: Colors.grey[700]),
            ),
            SizedBox(height: 16),
            // tombol ke store
            ElevatedButton(
              onPressed: () async {
                final Uri url = Uri.parse(movie.movieUrl);
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Tidak bisa membuka link")),
                  );
                }
              },
              child: Text("Go to WIKIPEDIA"),
            ),
          ],
        ),
      ),
    );
  }
}
