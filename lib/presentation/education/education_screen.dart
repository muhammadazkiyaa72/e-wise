import 'package:ewise/core/styles.dart';
import 'package:ewise/core/values/colors.dart';
import 'package:ewise/core/values/font_weight.dart';
import 'package:ewise/presentation/widgets/berita_widget.dart';
import 'package:ewise/presentation/widgets/galeri_widget.dart';
import 'package:ewise/presentation/widgets/video_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class EducationScreen extends StatefulWidget {
  const EducationScreen({super.key});

  @override
  State<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  @override
  Widget build(BuildContext context) {
    final Uri url = Uri.parse("https://www.youtube.com/watch?v=8AkC49d_HIE");
    final Uri url2 = Uri.parse("https://www.youtube.com/watch?v=8AkC49d_HIE");
    final Uri url3 = Uri.parse("https://www.youtube.com/watch?v=Tj4fnRS3WgE");

    //berita
    final Uri url4 = Uri.parse(
        "https://www.kompas.id/baca/metro/2023/07/13/75-tonsampah-elektronik-dibuang-di-jakarta-setiap-hari");
    final Uri url5 = Uri.parse(
        "https://yoursay.suara.com/kolom/2023/04/18/104520/dampak-buruk-yang-tersembunyi-dari-e-waste-kasus-kabut-elektronik-di-cina");
    final Uri url6 = Uri.parse(
        "https://bandungbergerak.id/article/detail/159172/menilik-peran-komunitas-e-waste-bandung-dalam-mengelola-limbah-elektronik");
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 95,
        backgroundColor: AppColors.p40,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(19),
          bottomRight: Radius.circular(19),
        )),
        centerTitle: true,
        title: Text(
          'Education e-Wise',
          style: Styles.whiteTextStyle.copyWith(
            fontSize: 20,
            fontWeight: AppFontWeight.semiBold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white, // Set your desired color here
          ),
          onPressed: () {
            // Add your custom back button functionality here
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Video terkait',
                style: Styles.blackTextStyle.copyWith(
                  fontWeight: AppFontWeight.medium,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 256,
                width: double.infinity,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    VideoWidgets(
                      url: url,
                      judul:
                          'Sampah Elektronik, Peluang, Tantangan dan Nilai Ekonomi',
                      sumber: 'DITJEN PSLB3 KLHK',
                      tanggal: '13 Juni 2023',
                      assetImage: 'assets/img/video.png',
                      durasi: '04:00',
                    ),
                    VideoWidgets(
                      url: url2,
                      judul: 'Bahaya Limbah Elektronik',
                      sumber: 'CNN Indonesia',
                      tanggal: '12 November 2023',
                      assetImage: 'assets/img/video2.png',
                      durasi: '03:15',
                    ),
                    VideoWidgets(
                      url: url3,
                      judul:
                          'Kreatif! Lukisan Keren Ini Terbuat Dari Limbah Elektronik',
                      sumber: 'TRANS7',
                      tanggal: '7 Desember 2023',
                      assetImage: 'assets/img/video3.png',
                      durasi: '02:37',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Artikel dan Blog',
                style: Styles.blackTextStyle.copyWith(
                  fontWeight: AppFontWeight.medium,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 256,
                width: double.infinity,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    BeritaWidgets(
                      url2: url4,
                      judul:
                          'Setiap Hari, 75 Ton Sampah Elektronik Dibuang di Jakarta',
                      tanggal: '13 July 2023',
                      sumber: 'kompas.id',
                      assetImage: 'assets/img/berita.png',
                    ),
                    BeritaWidgets(
                      url2: url5,
                      judul:
                          'Dampak Buruk yang Tersembunyi dari E-Waste: Kasus Kabut Elektronik di Cina',
                      tanggal: '18 April 2023',
                      sumber: 'yoursay.id',
                      assetImage: 'assets/img/berita2.png',
                    ),
                    BeritaWidgets(
                      url2: url6,
                      judul:
                          'Menilik Peran Komunitas E-waste Bandung dalam Mengelola Limbah Elektronik',
                      tanggal: '7 Desember 2023',
                      sumber: 'Bandung Bergerak',
                      assetImage: 'assets/img/berita3.png',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Galeri',
                style: Styles.blackTextStyle.copyWith(
                  fontWeight: AppFontWeight.medium,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 256,
                width: double.infinity,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: const [
                    GaleriWidgets(
                      judul: 'Serangga hasil transformasi limbah elektronik',
                      tanggal: '13 July 2023',
                      assetImage: 'assets/img/galeri.png',
                      sumber: 'Greeners.co',
                    ),
                    GaleriWidgets(
                      judul:
                          'Replika Bonsai dari Limbah Barang Elektronik yang Tak Terpakai',
                      tanggal: '18 April 2023',
                      assetImage: 'assets/img/galeri2.png',
                      sumber: 'Pilar.ID',
                    ),
                    GaleriWidgets(
                      judul: 'Miniatur Gajah dari Limbah TV Rusak',
                      tanggal: '7 Desember 2023',
                      assetImage: 'assets/img/galeri3.png',
                      sumber: 'Tripadvisor',
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
