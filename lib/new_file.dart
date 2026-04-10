import 'package:flutter/material.dart';

void main() {
  runApp(const BeelineApp());
}

class BeelineApp extends StatelessWidget {
  const BeelineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFFFD600),
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
      ),
      home: const BeelineScreen(),
    );
  }
}

class BeelineScreen extends StatelessWidget {
  const BeelineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFD600),
        elevation: 0,
        title: const Text(
          'Биline',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w400,
            fontSize: 24,
          ),
        ),
        actions: [
          _buildActionIcon(Icons.phone, () {}),
          _buildActionIcon(Icons.camera_alt_outlined, () {}),
          _buildActionIcon(Icons.send, () {}),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: const Color(0xFFFFD600),
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildTopCircle(Icons.wifi_tethering, Colors.blue, onTap: () {}),
                  _buildTopCircle(Icons.expand_more, Colors.red, isTriangle: true, onTap: () {}),
                  _buildTopCircle(Icons.public, Colors.purple, onTap: () {}),
                  _buildTopCircle(Icons.api, Colors.black, onTap: () {}),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.2,
                children: [
                  _buildMenuCard('Internet paketlar', Icons.language, () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const InternetPaketlarScreen()),
                    );
                  }),
                  _buildMenuCard('Tariflar', Icons.description_outlined, () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const TariflarScreen()),
                    );
                  }),
                  _buildMenuCard('Daqiqa paketlar', Icons.access_time, () {}),
                  _buildMenuCard('Aktsiya va\nYangiliklar', Icons.newspaper_outlined, () {}),
                  _buildMenuCard('SMS paketlar', Icons.mail_outline, () {}),
                  _buildMenuCard('USSD Kodlar va\nXizmatlar', Icons.dialpad, () {}),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFD600),
                    foregroundColor: Colors.black,
                    elevation: 2,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.refresh),
                      SizedBox(width: 8),
                      Text(
                        'RESTART XIZMATI',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomBar(),
      floatingActionButton: const CustomFAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildActionIcon(IconData icon, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: onTap,
        icon: Icon(icon, color: const Color(0xFFFFD600), size: 18),
        constraints: const BoxConstraints(),
        padding: const EdgeInsets.all(6),
      ),
    );
  }

  Widget _buildTopCircle(IconData icon, Color color, {bool isTriangle = false, required VoidCallback onTap}) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: Container(
          width: 75,
          height: 75,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(color: Colors.black12.withOpacity(0.05), blurRadius: 4, offset: const Offset(0, 2)),
            ],
            border: Border.all(color: Colors.black12, width: 0.5),
          ),
          child: Icon(
            isTriangle ? Icons.change_history : icon,
            color: color,
            size: 40,
          ),
        ),
      ),
    );
  }

  Widget _buildMenuCard(String title, IconData icon, VoidCallback onTap) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.yellow.shade600.withOpacity(0.5), width: 1.5),
            boxShadow: const [
              BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
            ],
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 45, color: Colors.grey.shade600),
              const SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InternetPaketlarScreen extends StatelessWidget {
  const InternetPaketlarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFFFD600),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black87),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(
            'Биline: Internet paketlar',
            style: TextStyle(color: Colors.black87),
          ),
          bottom: const TabBar(
            indicatorColor: Color(0xFFFFD600),
            labelColor: Colors.black87,
            unselectedLabelColor: Colors.grey,
            indicatorWeight: 3,
            tabs: [
              Tab(text: 'OY'),
              Tab(text: 'HAFTA'),
              Tab(text: 'KUN'),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: [
                  _buildInternetPaketList(),
                  const Center(child: Text('Haftalik paketlar')),
                  const Center(child: Text('Kunlik paketlar')),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.public, color: Colors.black),
                  label: const Text(
                    'QOLDIQNI TEKSHIRISH',
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFD600),
                    elevation: 0,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 80),
          ],
        ),
        bottomNavigationBar: const CustomBottomBar(),
        floatingActionButton: const CustomFAB(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  Widget _buildInternetPaketList() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildInternetPaketCard(
          '4G Oy',
          '60,000 so\'m.',
          '*110*59#',
          description: 'Faqatgina 4G tarmog\'i uchun oyiga 30000 MB internet.',
        ),
        _buildInternetPaketCard('1 GB', '10,000 so\'m.', '*1*01*8116#'),
        _buildInternetPaketCard('2 GB', '17,000 so\'m.', '*1*02*8116#'),
        _buildInternetPaketCard('5 GB', '30,000 so\'m.', '*1*05*8116#'),
        _buildInternetPaketCard('10 GB', '50,000 so\'m.', '*1*10*8116#'),
        _buildInternetPaketCard('20 GB', '65,000 so\'m.', '*1*20*8116#'),
      ],
    );
  }

  Widget _buildInternetPaketCard(String title, String price, String code, {String? description}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              width: 100,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFE6C300),
                ),
              ),
            ),
            const VerticalDivider(width: 1, thickness: 1, color: Color(0xFFEEEEEE)),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoRow('Narxi:', price),
                    const SizedBox(height: 4),
                    _buildInfoRow('Yoqish:', code),
                    if (description != null) ...[
                      const SizedBox(height: 8),
                      Text(
                        description,
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 14)),
        Text(value, style: const TextStyle(color: Colors.grey, fontSize: 14)),
      ],
    );
  }
}

class TariflarScreen extends StatelessWidget {
  const TariflarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFFFD600),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black87),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(
            'Биline: Tariflar',
            style: TextStyle(color: Colors.black87),
          ),
          bottom: const TabBar(
            indicatorColor: Color(0xFFFFD600),
            labelColor: Colors.black87,
            unselectedLabelColor: Colors.grey,
            indicatorWeight: 3,
            tabs: [
              Tab(text: 'OY'),
              Tab(text: 'KUN'),
              Tab(text: 'TO\'PLAMLAR'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildTarifList(),
            const Center(child: Text('Kunlik tariflar')),
            const Center(child: Text('To\'plamlar')),
          ],
        ),
        bottomNavigationBar: const CustomBottomBar(),
        floatingActionButton: const CustomFAB(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  Widget _buildTarifList() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildTarifCard('OSON 10', '14,000 so\'m.', '500 daq.'),
        _buildTarifCard('YANA BITTA', '20,000 so\'m.', 'VIP daq.'),
        _buildTarifCard('HAMMASI ZO\'R 1', '20,000 so\'m.', '1500 daq.'),
        _buildTarifCard('HAMMASI ZO\'R 2', '30,000 so\'m.', '2500 daq.'),
      ],
    );
  }

  Widget _buildTarifCard(String title, String price, String minutes) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 24),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFE6C300),
                  ),
                ),
                const Icon(Icons.chevron_right, color: Colors.grey, size: 30),
              ],
            ),
            const Divider(height: 32),
            _buildDetailRow('Abonent to\'lovi:', price),
            const SizedBox(height: 8),
            _buildDetailRow('Chiquvchi O\'zb. bo\'yicha:', minutes),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 16)),
        Text(value, style: const TextStyle(color: Colors.black87, fontSize: 16)),
      ],
    );
  }
}

class KabinetScreen extends StatelessWidget {
  const KabinetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFD600),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Биline',
          style: TextStyle(color: Colors.black87),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildInfoCard(
            'Abonentlar uchun',
            'Beeline abonent raqamidan 0611 qisqa raqamiga qo\'ng\'iroq qiling. Qo\'ng\'iroqlar bepul. Faqat jismoniy shaxslar uchun.',
            '0611',
          ),
          _buildInfoCard(
            'Hamma raqamlardan',
            '+998 90 1850055 raqamiga hamma telefon raqamlaridan qo\'ng\'iroq qilsa bo\'ladi.',
            '+998 90 185-00-55',
          ),
          _buildInfoCard(
            'E-Mail',
            '0611@beeline.uz elektron pochtasiga mijozlar savollarini yuborishlari mumkin.',
            '0611@beeline.uz',
          ),
          _buildSocialCard(),
        ],
      ),
      bottomNavigationBar: const CustomBottomBar(),
      floatingActionButton: const CustomFAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildInfoCard(String title, String desc, String contact) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 12),
          Text(desc, style: const TextStyle(color: Colors.black54, fontSize: 14)),
          const SizedBox(height: 16),
          Center(
            child: Text(
              contact,
              style: const TextStyle(
                color: Color(0xFF4285F4),
                fontSize: 28,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialCard() {
    return Container(
      margin: const EdgeInsets.only(bottom: 100),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Bizning sahifalar', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 12),
          _socialRow('Telegram Bot:', '@USSDHelpBot'),
          _socialRow('Telegram kanal:', '@ussdhelp'),
          _socialRow('Instagram:', '@ussd.help'),
          _socialRow('Facebook:', 'fb.me/ussdhelp'),
        ],
      ),
    );
  }

  Widget _socialRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.black, fontSize: 14),
          children: [
            TextSpan(text: '$label '),
            TextSpan(text: value, style: const TextStyle(color: Color(0xFF4285F4))),
          ],
        ),
      ),
    );
  }
}

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: const Color(0xFFFFD600),
      padding: EdgeInsets.zero,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildItem(context, Icons.headset_mic_outlined, 'Operator'),
          _buildItem(context, Icons.attach_money, 'Balans'),
          const SizedBox(width: 60),
          _buildItem(context, Icons.person_outline, 'Kabinet'),
          _buildItem(context, Icons.settings_outlined, 'Язык / Til'),
        ],
      ),
    );
  }

  Widget _buildItem(BuildContext context, IconData icon, String label) {
    return InkWell(
      onTap: () {
        if (label == 'Kabinet') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const KabinetScreen()),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.black87),
            Text(
              label,
              style: const TextStyle(fontSize: 11, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomFAB extends StatelessWidget {
  const CustomFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      padding: const EdgeInsets.all(6),
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).popUntil((route) => route.isFirst);
        },
        backgroundColor: const Color(0xFFFFD600),
        elevation: 0,
        shape: const CircleBorder(),
        child: const Icon(Icons.home, size: 40, color: Colors.black54),
      ),
    );
  }
}

