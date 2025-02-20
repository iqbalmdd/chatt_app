import 'package:chatt_app/components/contribution_section.dart';
import 'package:chatt_app/components/floating_card.dart';
import 'package:chatt_app/components/image_banner.dart';
import 'package:chatt_app/components/my_drawer.dart';
import 'package:chatt_app/components/text_list.dart';
import 'package:chatt_app/models/about_footer_model.dart';
import 'package:chatt_app/models/about_model.dart';
import 'package:chatt_app/models/contribution_model.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  AboutPage({super.key});

  final AboutUs aboutUs = AboutUs(
      title: "Paguyuban Sosial Marga Tionghoa Indonesia (PSMTI)",
      member: "5 jt Orang",
      location: "Seluruh Indonesia",
      intro:
          "PAGUYUBAN SOSIAL MARGA TIONGHOA INDONESIA; dalam bahasa Mandarin “印华百家姓协会” (Yin Hua Bai Jia Xing Xie Hui); dalam bahasa Inggris “Indonesian Chinese Clan Social Association”. Keberadaan PSMTI hari ini tentunya merupakan kelanjutan sejarah dari apa yang telah di wariskan para pendiri Paguyuban Sosial Marga Tionghoa Indonesia (PSMTI). Para pendiri PSMTI pada saat itu menyadari ada akar masalah yang perlu didialogkan dan diselesaikan serta diusahakan bisa diselesaikan satu kali untuk selamanya. Untuk keperluan itu perlu wadah yang kompeten untuk menampung dan menyalurkan aspirasi serta didialogkan dengan Pemerintah, Dewan Perwakilan dan golongan masyarakat untuk menemukan akar masalah dan untuk diselesaikan dengan sebaik – baiknya.",
      visi:
          "Visi PSMTI ialah Suku Tionghoa Warga Negara Kesatuan Republik Indonesia bersama komponen Bangsa Indonesia seluruhnya mempunyai hak dan kewajiban membangun Negara Kesatuan Republik Indonesia menuju masyarakat adil dan makmur.",
      misi: [
        "Meningkatkan kesadaran ber-Masyarakat, ber-Bangsa dan ber-negara secara berkelanjutan dan berkesinambungan",
        "Memantapkan jati diri sebagai salah satu suku dalam Keluarga Besar Bangsa Indonesia",
        "Masuk dalam Arus Besar Bangsa Indonesia dengan turut serta secara aktif dalam pembangunan Negara Kesatuan Republik Indonesia dalam segala aspek kehidupan berbangsa dan bernegara",
        "Memberikan manfaat bagi Bangsa dan Negara terutama dalam bidang sosial, budaya, pendidikan dan kemasyarakatan."
      ]);

  final ContributionModel contributionModel = ContributionModel(
      title: "Kontribusi & Prestasi PSMTI",
      intro:
          "Sesuai konstitusi kita, negara Indonesia adalah negara hukum, oleh karena itu sejak awal PSMTI didirikan telah banyak kontribusinya yang dirasakan oleh suku Tionghoa Warga Negara Kesatuan Republik Indonesia termasuk di bidang hukum antara lain:",
      contribution: [
        "tentang Menghentikan Penggunaan Istilah Pribumi dan Non-Pribumi Dalam Semua Perumusan dan Penyelenggaraan Kebijakan, Perencanaan Program, Ataupun Pelaksanaan Kegiatan Penyelenggaraan Pemerintahan",
        "Terbitnya Instruksi Presiden (Inpres) No 26 Tahun 1998 tanggal 16 September 1998 tentang Menghentikan Penggunaan Istilah Pribumi dan Non-Pribumi Dalam Semua Perumusan dan Penyelenggaraan Kebijakan, Perencanaan Program, Ataupun Pelaksanaan Kegiatan Penyelenggaraan Pemerintahan",
      ]);

  final AboutFooterModel aboutFooterModel = AboutFooterModel(
      title: "Logo PSMTI & Artinya",
      titleDesc:
          "Meningkatkan kesadaran ber-Masyarakat, ber-Bangsa dan ber-Negara secara berkelanjutan dan berkesinambungan",
      subTitle: "Maksud Lambang PSMTI",
      subTitleDesc: [
        "Sekuntum bunga bermakna kesetiaan dalam suka dan duka",
        "Warna biru pada bunga melambangkan ketulusan, keikhlasan dan kedamaian",
        "Jumlah kelopak bunga 5 helai melambangkan Pancasila",
        "Padi dan Kapas bermakna budi yang luhur dan kejayaan",
        "Warna Kuning melambangkan budi yang luhur dan kejayaan",
        "Bendera Merah Putih melambangkan Negara dan Bangsa Indonesia",
        "Jumlah butir padi 17 dan bunga kapas 8, melambangkan tanggal dan bulan Proklamasi 17 Agustus 1945"
      ]
    );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        surfaceTintColor: Theme.of(context).colorScheme.tertiary,
        title: Text("About PSMTI"),
      ),
      drawer: MyDrawer(username: "Temporary Name"),
      body: Center(
        child: ListView(
          children: [
            Container(
              height: 320,
              child: Stack(
                children: [
                  // Background Image ,
                  ImageBanner(
                      linkImage:
                          'https://psmti.or.id/uploads/2025/02/WhatsApp-Image-2025-02-10-at-11.14.37-scaled.jpeg'),

                  // Card Putih
                  FloatingCard(
                    title: aboutUs.title,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.add,
                              size: 15,
                              color: Colors.blue,
                              weight: 25,
                            ),
                            Text(aboutUs.member),
                          ],
                        ),
                        Text(aboutUs.location),
                      ],
                    ),
                  )
                ],
              ),
            ),

            // Teks deskripsi
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              child: Text(
                aboutUs.intro,
                style: TextStyle(fontSize: 12),
                textAlign: TextAlign.justify,
              ),
            ),

            // Visi
            FloatingCard(
                title: "Visi",
                child: Text(
                  aboutUs.visi,
                  style: TextStyle(fontSize: 12),
                  textAlign: TextAlign.justify)
            ),

            SizedBox(
              height: 30,
            ),

            // Misi
            FloatingCard(title: "Misi", child: TextList(text: aboutUs.misi, orangeSpace: 10,)),

            SizedBox(
              height: 30,
            ),

            // BLUE SECTION
            Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.topLeft, // Titik awal gradien (0% 0%)
                  radius: 1.5, // Sesuai dengan 150.47% dari CSS
                  colors: [
                    Color.fromRGBO(13, 92, 171, 0.9),  // rgba(13, 92, 171, 0.90) pada 0%
                    Color.fromRGBO(0, 148, 214, 0.8),  // rgba(0, 148, 214, 0.80) pada 100%
                  ],
                  stops: [0.0, 1.0], // 0% -> 100%
              )),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                child: Column(
                  children: [
                    // Title bg-blue
                    Text(contributionModel.title,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.tertiary,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),

                    SizedBox(
                      height: 10,
                    ),

                    // subText bg-blue
                    Text(
                      contributionModel.intro,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.justify,
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    // floating card bg-blue
                    ContributionSection(
                        contributions: contributionModel.contribution),
                  ],
                ),
              ),
            ),

            // Logo PSMTI & Artinya
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 15, bottom: 0, left: 25, right: 25),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.logo_dev, size: 45),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          aboutFooterModel.title,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 4),
                        Text(
                          aboutFooterModel.titleDesc,
                          style: TextStyle(fontSize: 12),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Arti Lambang PSMTI
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: TextList(text: aboutFooterModel.subTitleDesc, orangeSpace: 0,),
            )
          ],
        ),
      ),
    );
  }
}
