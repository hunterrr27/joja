import 'package:flutter/material.dart';

void main() {
  runApp(const JojaApp());
}

class JojaApp extends StatelessWidget {
  const JojaApp({super.key});

  @override
  Widget build(BuildContext context) {
    const accentColor = Color(0xFFB388FF);
    const backgroundColor = Color(0xFF0F0B14);
    const surfaceColor = Color(0xFF1A1324);

    return MaterialApp(
      title: 'Joja',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: backgroundColor,
        colorScheme: const ColorScheme.dark(
          primary: accentColor,
          secondary: Color(0xFFE9C2FF),
          surface: surfaceColor,
        ),
        textTheme: const TextTheme(
          displaySmall: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.5,
          ),
          titleLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          bodyLarge: TextStyle(fontSize: 16, height: 1.4),
          bodyMedium: TextStyle(fontSize: 14, height: 1.4),
        ),
      ),
      home: const JojaHomePage(),
    );
  }
}

class JojaHomePage extends StatefulWidget {
  const JojaHomePage({super.key});

  @override
  State<JojaHomePage> createState() => _JojaHomePageState();
}

class _JojaHomePageState extends State<JojaHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    DiscoverPage(),
    PortfolioPage(),
    InsightsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.white54,
        backgroundColor: const Color(0xFF120D19),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.waves),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.equalizer),
            label: 'Portfolio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_rounded),
            label: 'Insights',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _Header(title: 'The Artist-Listener Bridge', subtitle: 'High-intent discovery for rare finds.'),
          const SizedBox(height: 24),
          const _BlindDiscoveryCard(),
          const SizedBox(height: 24),
          Text(
            'Your Vibe Map',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: const [
              _VibeChip(label: 'Late-night synth & rain'),
              _VibeChip(label: 'Broken beat poetry'),
              _VibeChip(label: 'If you like: Toro y Moi'),
              _VibeChip(label: 'Lo-fi brass & slow drums'),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            'Blind Discovery Feed',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 12),
          const _DiscoveryFeedCard(
            title: '30-sec preview · Artist hidden',
            subtitle: 'Waveform only. Focus on the feeling.',
          ),
          const SizedBox(height: 16),
          const _DiscoveryFeedCard(
            title: 'New drop · Genreless',
            subtitle: 'Tap to reveal the letter seal.',
          ),
        ],
      ),
    );
  }
}

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _Header(
            title: 'Artist Portfolio',
            subtitle: 'Zero-cost promotion with engagement-first analytics.',
          ),
          const SizedBox(height: 24),
          const _FeatureCard(
            title: 'Submit to Discovery',
            description: 'Upload tracks specifically for the matching engine. No follower counts, no hype.' ,
            icon: Icons.cloud_upload_outlined,
          ),
          const SizedBox(height: 16),
          const _FeatureCard(
            title: 'Anti-Influencer Dashboard',
            description: 'Track listen time, replays, and emotional resonance instead of likes.',
            icon: Icons.favorite_border,
          ),
          const SizedBox(height: 16),
          const _FeatureCard(
            title: 'Industry Direct-Link',
            description: 'Opt-in to show your momentum to A&Rs and sync teams.',
            icon: Icons.lock_open_rounded,
          ),
          const SizedBox(height: 24),
          _CallToAction(
            title: 'Upload a new letter drop',
            subtitle: 'Add a 30-second preview for the blind feed.',
            buttonLabel: 'Submit preview',
          ),
        ],
      ),
    );
  }
}

class InsightsPage extends StatelessWidget {
  const InsightsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _Header(
            title: 'Heat Map Insights',
            subtitle: 'Signals for industry professionals and the Joja team.',
          ),
          const SizedBox(height: 24),
          const _HeatMapCard(),
          const SizedBox(height: 24),
          Text(
            'Engagement Over Exposure',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 12),
          const _MetricTile(
            label: 'Average listen-through',
            value: '78%',
            trend: '+12%',
          ),
          const SizedBox(height: 12),
          const _MetricTile(
            label: 'Repeat listens per track',
            value: '3.2x',
            trend: '+0.7x',
          ),
          const SizedBox(height: 12),
          const _MetricTile(
            label: 'Curator follow-through',
            value: '41%',
            trend: '+9%',
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _Header(
            title: 'Release Cycle',
            subtitle: 'A phased rollout to build trust and test the algorithm.',
          ),
          const SizedBox(height: 20),
          const _PhaseTile(
            phase: 'Phase 1 · Interest',
            detail: 'Landing page, email sign-ups, and basic profiles.',
          ),
          const SizedBox(height: 12),
          const _PhaseTile(
            phase: 'Phase 2 · Trial',
            detail: 'Preview system with recurring snippet drops (TikTok vibe).',
          ),
          const SizedBox(height: 12),
          const _PhaseTile(
            phase: 'Phase 3 · Partial Release',
            detail: 'Artists upload full songs, selected listeners test matching.',
          ),
          const SizedBox(height: 12),
          const _PhaseTile(
            phase: 'Phase 4 · Full Release',
            detail: 'Public launch plus industry dashboards.',
          ),
          const SizedBox(height: 24),
          _CallToAction(
            title: 'Join the Inner Circle',
            subtitle: 'Become an early curator for unreleased sounds.',
            buttonLabel: 'Request access',
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SealMark(),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Theme.of(context).textTheme.displaySmall),
              const SizedBox(height: 6),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white70,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SealMark extends StatelessWidget {
  const _SealMark();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 52,
      height: 52,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const RadialGradient(
          colors: [Color(0xFFD9A7FF), Color(0xFF7E57C2)],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: const Center(
        child: Text(
          'J',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.2,
          ),
        ),
      ),
    );
  }
}

class _BlindDiscoveryCard extends StatelessWidget {
  const _BlindDiscoveryCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1D1428),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF332140)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Blind Mode: 30-second reveals',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 12),
          Text(
            'Listen without names, follower counts, or hype. Reveal the wax seal when you are ready.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white70,
                ),
          ),
          const SizedBox(height: 20),
          Container(
            height: 80,
            decoration: BoxDecoration(
              color: const Color(0xFF241A33),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                12,
                (index) => Container(
                  width: 6,
                  height: 16.0 + (index % 5) * 12,
                  decoration: BoxDecoration(
                    color: const Color(0xFFB388FF),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              TextButton(
                onPressed: () {},
                child: const Text('Skip'),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                child: const Text('Reveal Artist'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _VibeChip extends StatelessWidget {
  const _VibeChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF1D1524),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF2C1E37)),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.white70,
            ),
      ),
    );
  }
}

class _DiscoveryFeedCard extends StatelessWidget {
  const _DiscoveryFeedCard({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1324),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFF2C1E37)),
      ),
      child: Row(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: const Color(0xFF2A1F35),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(Icons.play_arrow_rounded, size: 34),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white70,
                      ),
                ),
              ],
            ),
          ),
          Icon(Icons.keyboard_arrow_right, color: Colors.white54),
        ],
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  const _FeatureCard({
    required this.title,
    required this.description,
    required this.icon,
  });

  final String title;
  final String description;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1324),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFF2C1E37)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: const Color(0xFF2A1F35),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, size: 22, color: Theme.of(context).colorScheme.primary),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white70,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CallToAction extends StatelessWidget {
  const _CallToAction({
    required this.title,
    required this.subtitle,
    required this.buttonLabel,
  });

  final String title;
  final String subtitle;
  final String buttonLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF21172E),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 6),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white70,
                ),
          ),
          const SizedBox(height: 14),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
            ),
            child: Text(buttonLabel),
          ),
        ],
      ),
    );
  }
}

class _HeatMapCard extends StatelessWidget {
  const _HeatMapCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1324),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFF2C1E37)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Underground Heat Map', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          Text(
            'Niche clusters surfacing this week: desert soul, basement jazz-hop, and midnight house.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white70),
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              Expanded(
                child: _HeatBar(label: 'Desert Soul', percent: 0.78),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _HeatBar(label: 'Jazz-Hop', percent: 0.62),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _HeatBar(label: 'Midnight House', percent: 0.49),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _HeatBar(label: 'Dream Pop', percent: 0.35),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _HeatBar extends StatelessWidget {
  const _HeatBar({required this.label, required this.percent});

  final String label;
  final double percent;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 6),
        Stack(
          children: [
            Container(
              height: 8,
              decoration: BoxDecoration(
                color: const Color(0xFF2A1F35),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            FractionallySizedBox(
              widthFactor: percent,
              child: Container(
                height: 8,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFB388FF), Color(0xFF6A5AE0)],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _MetricTile extends StatelessWidget {
  const _MetricTile({required this.label, required this.value, required this.trend});

  final String label;
  final String value;
  final String trend;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1324),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF2C1E37)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: 6),
                Text(value, style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF241A33),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              trend,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PhaseTile extends StatelessWidget {
  const _PhaseTile({required this.phase, required this.detail});

  final String phase;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1324),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF2C1E37)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(phase, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 6),
          Text(
            detail,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white70,
                ),
          ),
        ],
      ),
    );
  }
}
