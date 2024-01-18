import 'package:flutter/material.dart';

class AlamatFavoriteScreen extends StatefulWidget {
  const AlamatFavoriteScreen({super.key});

  @override
  State<AlamatFavoriteScreen> createState() => _AlamatFavoriteScreenState();
}

class _AlamatFavoriteScreenState extends State<AlamatFavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alamat Favorite'),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.bookmark),
                  SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Asrama Putra TelU Gd 3',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: 264,
                        child: Text(
                          '2JHH+R9F, SukaPura, Kec. Dayeuhkolot, Kabupaten Bandung, Jawa Barat 40267, Indonesia',
                          style: TextStyle(
                            color: Color(0xFF5B5F57),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 37,
            ),
            SizedBox(
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.bookmark),
                  SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Asrama Putri TelU Gd A',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: 264,
                        child: Text(
                          '2JHH+R9F, SukaPura, Kec. Dayeuhkolot, Kabupaten Bandung, Jawa Barat 40267, Indonesia',
                          style: TextStyle(
                            color: Color(0xFF5B5F57),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
