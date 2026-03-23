import 'package:flutter/material.dart';

class BriTheme {
  static const primaryBlue = Color(0xFF005CB9);
  static const navyBlue = Color(0xFF014A94);
  static const lightNavy = Color(0xFF1A5FA3);
  static const softBlueBg = Color(0xFFF0F7FF); 
}

void main() {
  runApp(const BrimoApp());
}

class BrimoApp extends StatelessWidget {
  const BrimoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UTS Fitri Wulandari',
      theme: ThemeData(
        fontFamily: 'sans-serif',
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _hideBalance = true;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeaderSection(),
            _buildFeaturesGrid(),
            const SizedBox(height: 100), 
          ],
        ),
      ),
      
      floatingActionButton: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8, offset: const Offset(0, -2))
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: BriTheme.navyBlue,
            elevation: 0,
            shape: const CircleBorder(),
            child: const Icon(Icons.qr_code_scanner, color: Colors.white, size: 28),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.0,
        elevation: 15,
        child: SizedBox(
          height: 55,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(child: _navItem(Icons.home_rounded, 'Home', 0)),
              Expanded(child: _navItem(Icons.history_rounded, 'Mutasi', 1)),
              const SizedBox(width: 60), 
              Expanded(child: _navItem(Icons.assignment_rounded, 'Aktivitas', 2)),
              Expanded(child: _navItem(Icons.person_rounded, 'Akun', 3)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navItem(IconData icon, String label, int index) {
    bool isActive = _currentIndex == index;
    return InkWell(
      onTap: () => setState(() => _currentIndex = index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: isActive ? BriTheme.primaryBlue : Colors.grey, size: 22),
          Text(label, style: TextStyle(
            color: isActive ? BriTheme.primaryBlue : Colors.grey,
            fontSize: 10,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          )),
        ],
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Stack(
      children: [
        Container(
          height: 160, 
          width: double.infinity,
          decoration: const BoxDecoration(
            color: BriTheme.primaryBlue,
          ),
        ),
        SafeArea(
          child: Column(
            children: [
              _buildTopBar(),
              const SizedBox(height: 10),
              _buildMainWalletCard(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        children: [
          Text.rich(TextSpan(children: [
            const TextSpan(text: 'BRI', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 18)),
            const TextSpan(text: '\nmo', style: TextStyle(color: Colors.white, fontSize: 13, height: 0.7)),
          ])),
          const SizedBox(width: 15),
          const Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Selamat Pagi,', style: TextStyle(color: Colors.white70, fontSize: 12)),
              Text('Fitri', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
            ],
          )),
          IconButton(
            icon: const Icon(Icons.notifications_none_rounded, color: Colors.white, size: 24), 
            onPressed: () {}
          ),
          _helpBtn(),
        ],
      ),
    );
  }

  Widget _helpBtn() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(color: Colors.white.withOpacity(0.15), borderRadius: BorderRadius.circular(20)),
      child: const Row(children: [
        Icon(Icons.headset_mic_outlined, size: 14, color: Colors.white),
        SizedBox(width: 5),
        Text('Bantuan', style: TextStyle(color: Colors.white, fontSize: 10)),
      ]),
    );
  }

  Widget _buildMainWalletCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: BriTheme.navyBlue, 
              borderRadius: BorderRadius.vertical(top: Radius.circular(15))
            ),
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text('Saldo Rekening Utama', style: TextStyle(color: Colors.white70, fontSize: 13)),
                GestureDetector(onTap: () => setState(() => _hideBalance = !_hideBalance), child: Icon(_hideBalance ? Icons.visibility_off : Icons.visibility, color: Colors.white, size: 18)),
              ]),
              const SizedBox(height: 5),
              Align(alignment: Alignment.centerLeft, child: Text(_hideBalance ? '••••••••' : 'Rp 100.000.000', style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold))),
              const Divider(color: Colors.white24, height: 30),
              const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text('Semua Rekeningmu', style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500)),
                Icon(Icons.chevron_right, color: Colors.white, size: 18),
              ]),
            ]),
          ),

          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              color: Colors.white, 
              borderRadius: const BorderRadius.vertical(bottom: Radius.circular(15)), 
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 4))]
            ),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              _quickActionItem('assets/transfer.jpeg', 'Transfer'),
              _quickActionItem('assets/brivaa.jpeg', 'BRIVA'),
              _quickActionItem('assets/pdam.jpeg', 'PDAM'),
              _quickActionItem('assets/pulsaa.jpeg', 'Pulsa'),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _quickActionItem(String imagePath, String label) {
    return Column(children: [
      Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: BriTheme.softBlueBg, borderRadius: BorderRadius.circular(15)),
        child: Image.asset(imagePath, width: 26, height: 26, fit: BoxFit.contain, errorBuilder: (c, e, s) => const Icon(Icons.broken_image, size: 24)),
      ),
      const SizedBox(height: 8),
      Text(label, style: const TextStyle(color: Colors.black87, fontSize: 11, fontWeight: FontWeight.w500)),
    ]);
  }

  Widget _buildFeaturesGrid() {
    return Transform.translate(
      offset: const Offset(0, -15), 
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Cari Fitur',
              hintStyle: const TextStyle(fontSize: 15),
              prefixIcon: const Icon(Icons.search, color: Colors.blue, size: 18),
              filled: true,
              fillColor: const Color(0xFFF5F5F5),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
            ),
          ),
          const SizedBox(height: 20),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 4,
            mainAxisSpacing: 20,
            crossAxisSpacing: 10,
            childAspectRatio: 0.8,
            children: const [
              FeatureTile(imageUrl: 'assets/Topup.png', label: 'Top Up'),
              FeatureTile(imageUrl: 'assets/Tagihan.png', label: 'Tagihan', hasNotif: true),
              FeatureTile(imageUrl: 'assets/Setor.png', label: 'Tarik Tunai'),
              FeatureTile(imageUrl: 'assets/Lifestyle.png', label: 'Lifestyle'),
              FeatureTile(imageUrl: 'assets/Virtual.png', label: 'Virtual'),
              FeatureTile(imageUrl: 'assets/Catatan.png', label: 'Catatan'),
              FeatureTile(imageUrl: 'assets/Investasi.png', label: 'Investasi'),
              FeatureTile(imageUrl: 'assets/Donasi.png', label: 'Donasi'),
            ],
          ),
        ]),
      ),
    );
  }
}

class FeatureTile extends StatelessWidget {
  final String imageUrl;
  final String label;
  final bool hasNotif;
  
  const FeatureTile({
    super.key, 
    required this.imageUrl, 
    required this.label, 
    this.hasNotif = false
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Stack(clipBehavior: Clip.none, children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: BriTheme.softBlueBg, 
            borderRadius: BorderRadius.circular(16),
          ),
          child: Image.asset(
            imageUrl, 
            width: 28, 
            height: 28, 
            errorBuilder: (c, e, s) => const Icon(Icons.circle, color: BriTheme.primaryBlue, size: 24)
          ),
        ),
        if (hasNotif) 
          Positioned(
            top: -2, 
            right: -2, 
            child: Container(
              width: 10, 
              height: 10, 
              decoration: BoxDecoration(
                color: Colors.red, 
                shape: BoxShape.circle, 
                border: Border.all(color: Colors.white, width: 2)
              ),
            ),
          ),
      ]),
      const SizedBox(height: 6),
      Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500)),
    ]);
  }
}