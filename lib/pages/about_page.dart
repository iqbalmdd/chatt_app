import 'package:chatt_app/components/my_drawer.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About PSMTI"),
      ),
      drawer: MyDrawer(username: "Temporary Name"),
      body: Center(
  child: ListView(
    children: [
      Container(
        height: 320, // Tinggi ditambah untuk memberi ruang pada card putih
        child: Stack(
          children: [
            // Background Image
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Image.network(
                'https://psmti.or.id/uploads/2025/02/WhatsApp-Image-2025-02-10-at-11.14.37-scaled.jpeg',
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
                alignment: Alignment.center,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: double.infinity,
                    height: 250,
                    color: Colors.grey[300],
                    child: const Icon(Icons.error),
                  );
                },
              ),
            ),
            
            // Card Putih
            Positioned(
              bottom: 0, // Posisi dari bawah container Stack
              left: 20,
              right: 20,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Paguyuban Sosial Marga Tionghoa Indonesia",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.people,
                          size: 20,
                          color: Colors.blue,
                        ),
                        const SizedBox(width: 8),
                        const Text("5jt Orang"),
                        const SizedBox(width: 16),
                        const Icon(
                          Icons.location_on,
                          size: 20,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 8),
                        const Text("Seluruh Indonesia"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      
      // Teks deskripsi
      Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          "PAGUYUBAN SOSIAL MARGA TIONGHOA INDONESIA adalah organisasi sosial " 
          "yang bertujuan untuk memperkuat persatuan dan kesatuan bangsa Indonesia " 
          "melalui pelestarian budaya dan nilai-nilai luhur masyarakat Tionghoa Indonesia.",
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.justify,
        ),
      ),
    ],
  ),
),);
  }
}
