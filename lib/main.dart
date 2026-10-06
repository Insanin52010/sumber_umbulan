
import 'package:flutter/material.dart';

void main() {
  runApp(Coba());
}

// ==================== WARNA ====================

const Color sageBackground = Color(0xFFE8F3E8);
const Color sageAppBar = Color(0xFFD4E8D4);
const Color sageDark = Color(0xFF355E3B);
const Color sageBorder = Color(0xFFB7CDB7);

// ==================== APLIKASI ====================

class Coba extends StatelessWidget {
  const Coba({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sumber Umbulan Langlang',
      theme: ThemeData(
        scaffoldBackgroundColor: sageBackground,
        colorScheme: ColorScheme.fromSeed(seedColor: sageDark),
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}

// ==================== HALAMAN LOGIN ====================

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController =
      TextEditingController();

  final TextEditingController passwordController =
      TextEditingController();

  bool obscurePassword = true;
  String errorMessage = '';

  void login() {
    String username = usernameController.text.trim();
    String password = passwordController.text;

    if (username.isNotEmpty && password.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HalamanWisata(
            namaPengguna: username,
          ),
        ),
      );
    } else {
      setState(() {
        errorMessage = 'Username dan password wajib diisi!';
      });
    }
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.water_drop,
                  size: 85,
                  color: sageDark,
                ),
                const SizedBox(height: 12),
                const Text(
                  'Sumber Umbulan',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: sageDark,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Langlang, Singosari, Malang',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 32),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: sageBorder),
                    boxShadow: [
                      BoxShadow(
                        color: sageDark.withOpacity(0.08),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: sageDark,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Center(
                        child: Text(
                          'Masuk untuk melihat informasi wisata',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                      const SizedBox(height: 28),

                      const Text(
                        'Username',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          hintText: 'Masukkan username',
                          prefixIcon: const Icon(
                            Icons.person_outline,
                            color: sageDark,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: sageDark,
                              width: 2,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 18),
                      const Text(
                        'Password',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: passwordController,
                        obscureText: obscurePassword,
                        onSubmitted: (_) => login(),
                        decoration: InputDecoration(
                          hintText: 'Masukkan password',
                          prefixIcon: const Icon(
                            Icons.lock_outline,
                            color: sageDark,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                obscurePassword = !obscurePassword;
                              });
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: sageDark,
                              width: 2,
                            ),
                          ),
                        ),
                      ),

                      if (errorMessage.isNotEmpty) ...[
                        const SizedBox(height: 14),
                        Text(
                          errorMessage,
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 13,
                          ),
                        ),
                      ],

                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: login,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: sageDark,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'Masuk',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),
                const Text(
                  'Jelajahi keindahan alam Sumber Umbulan',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: sageDark,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ==================== HALAMAN WISATA ====================

class HalamanWisata extends StatefulWidget {
  final String namaPengguna;

  const HalamanWisata({
    super.key,
    required this.namaPengguna,
  });

  @override
  State<HalamanWisata> createState() => _HalamanWisataState();
}

class _HalamanWisataState extends State<HalamanWisata> {
  final ScrollController _scrollController = ScrollController();

  bool showTitle = false;
  bool showHistory = false;
  bool showContact = false;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      final offset = _scrollController.offset;

      final title = offset > 10;
      final history = offset > 40;
      final contact = offset > 80;

      if (title != showTitle ||
          history != showHistory ||
          contact != showContact) {
        setState(() {
          showTitle = title;
          showHistory = history;
          showContact = contact;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // Teks tetap terlihat.
  // Animasi hanya mengubah posisi sedikit dan tingkat opacity.
  Widget animasi({
    required bool tampil,
    required Widget child,
  }) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 350),
      opacity: tampil ? 1.0 : 0.85,
      child: AnimatedSlide(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOut,
        offset: tampil ? Offset.zero : const Offset(0, 0.025),
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: sageBackground,
      appBar: AppBar(
        title: const Text('Sumber Umbulan Langlang'),
        backgroundColor: sageAppBar,
        foregroundColor: sageDark,
        actions: [
          IconButton(
            tooltip: 'Keluar',
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // FOTO WISATA

            Image.asset(
              'assets/sumber umbulan.webp',
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 250,
                  color: sageAppBar,
                  alignment: Alignment.center,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.image_not_supported,
                        size: 45,
                        color: sageDark,
                      ),
                      SizedBox(height: 8),
                      Text('Foto wisata tidak ditemukan'),
                    ],
                  ),
                );
              },
            ),

            // SAPAAN PENGGUNA

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              child: Text(
                'Selamat datang, ${widget.namaPengguna}!',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: sageDark,
                ),
              ),
            ),

            // JUDUL SEJARAH

            animasi(
              tampil: showTitle,
              child: Container(
                padding: const EdgeInsets.all(16),
                child: const Text(
                  'Sejarah Singkat Sumber Umbulan Langlang',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: sageDark,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            // ISI SEJARAH

            animasi(
              tampil: showHistory,
              child: Container(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
                child: const Text(
                  'Sumber Umbulan merupakan mata air alami yang berada di '
                  'kawasan Langlang, Kecamatan Singosari, Kabupaten Malang, '
                  'Jawa Timur. Tempat ini dikenal karena airnya yang jernih, '
                  'sejuk, dan lingkungan alamnya yang masih asri.\n\n'
                  'Sejak dahulu, sumber air ini dimanfaatkan oleh masyarakat '
                  'sekitar sebagai bagian dari kehidupan sehari-hari. Selain '
                  'sebagai sumber air, Umbulan juga memiliki nilai budaya '
                  'dan spiritual bagi masyarakat setempat.\n\n'
                  'Sumber Umbulan kemudian dikembangkan sebagai tempat wisata '
                  'oleh masyarakat sekitar. Fasilitas di area sumber dibangun '
                  'secara bertahap sehingga masyarakat maupun wisatawan dapat '
                  'menikmati keindahan alamnya.\n\n'
                  'Kini, Sumber Umbulan menjadi salah satu tempat wisata alam '
                  'di kawasan Singosari. Kejernihan air, pepohonan yang '
                  'rindang, serta suasana yang sejuk menjadikannya tempat '
                  'yang menarik untuk dikunjungi.',
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    color: Color(0xFF333333),
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),

            // KARTU LOKASI DAN KONTAK

            animasi(
              tampil: showContact,
              child: Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: sageBorder,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    // Menyesuaikan tampilan untuk layar HP yang sempit.
                    if (constraints.maxWidth < 350) {
                      return const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LokasiWisata(),
                          SizedBox(height: 20),
                          Divider(color: sageBorder),
                          SizedBox(height: 12),
                          KontakWisata(),
                        ],
                      );
                    }

                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(
                          child: LokasiWisata(),
                        ),
                        Container(
                          height: 145,
                          width: 1,
                          color: sageBorder,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 12,
                          ),
                        ),
                        const Expanded(
                          child: KontakWisata(),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// ==================== BAGIAN LOKASI ====================

class LokasiWisata extends StatelessWidget {
  const LokasiWisata({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Lokasi',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: sageDark,
          ),
        ),
        const SizedBox(height: 8),
        const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.location_on,
              size: 22,
              color: sageDark,
            ),
            SizedBox(width: 6),
            Expanded(
              child: Text(
                'Sumber Umbulan\n'
                'Langlang, Kecamatan Singosari,\n'
                'Kabupaten Malang,\n'
                'Jawa Timur',
                style: TextStyle(
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// ==================== BAGIAN KONTAK ====================

class KontakWisata extends StatelessWidget {
  const KontakWisata({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Contact Saya',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: sageDark,
          ),
        ),
        const SizedBox(height: 12),
        const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.phone,
              size: 20,
              color: sageDark,
            ),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                '085856212688',
                style: TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          height: 1,
          color: sageBorder,
        ),
        const SizedBox(height: 12),
        const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.email,
              size: 20,
              color: sageDark,
            ),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                'insaninkamiliaannisaa@gmail.com',
                style: TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
