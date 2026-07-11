import 'package:flutter/material.dart';

void main() {
  runApp(const NagaaApp());
}

class NagaaApp extends StatelessWidget {
  const NagaaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nagaa fi Tokkummaa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2C3E50),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontFamily: 'Serif', fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(fontSize: 18, height: 1.6),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text('Nagaa fi Tokkummaa', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isMobile = constraints.maxWidth < 600;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 20),
                      _buildMainQuoteCard(isMobile),
                      const SizedBox(height: 40),
                      Text(
                        'Yaada Dabalataa (Reflections)',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF2C3E50),
                            ),
                      ),
                      const SizedBox(height: 20),
                      _buildReflectionGrid(isMobile),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildMainQuoteCard(bool isMobile) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 32.0 : 48.0),
      decoration: BoxDecoration(
        color: const Color(0xFF2C3E50),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          const Icon(Icons.format_quote_rounded, color: Colors.white54, size: 48),
          const SizedBox(height: 20),
          Text(
            "“Dhaloonni kun mal taʼet wal ciraa osoo taʼee yoona in tokkoomu moo Dhagaa owwalcha walitti guuru”",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isMobile ? 24 : 32,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              height: 1.5,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 30),
          Container(
            width: 60,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReflectionGrid(bool isMobile) {
    final reflections = [
      {
        'title': 'Jaalala',
        'content': 'Dhaloonni keenya jibba dhiisee jaalalaan yoo wal qabate, rakkoo kamiyyuu injifachuu ni danda\'a.',
        'icon': Icons.favorite_border,
      },
      {
        'title': 'Tokkummaa',
        'content': 'Harkaa fi harka wal qabachuun, garaagarummaa keenya akka humnaatti fayyadamuun tokkummaa ijaarra.',
        'icon': Icons.group_outlined,
      },
      {
        'title': 'Nagaa',
        'content': 'Nagaan bu\'uura guddinaati. Wal danda\'uu fi waliigaluun aadaa keenya haa ta\'u.',
        'icon': Icons.eco_outlined,
      },
      {
        'title': 'Abdii',
        'content': 'Boriin keenya ifaa dha. Yoo har\'a waliin hojjenne, dhaloota dhufuuf biyya gaarii dhiifna.',
        'icon': Icons.lightbulb_outline,
      },
    ];

    if (isMobile) {
      return Column(
        children: reflections.map((r) => _buildReflectionCard(r)).toList(),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 1.5,
      ),
      itemCount: reflections.length,
      itemBuilder: (context, index) {
        return _buildReflectionCard(reflections[index]);
      },
    );
  }

  Widget _buildReflectionCard(Map<String, dynamic> data) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.grey.withOpacity(0.2)),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2C3E50).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    data['icon'] as IconData,
                    color: const Color(0xFF2C3E50),
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  data['title'] as String,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2C3E50),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              data['content'] as String,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
