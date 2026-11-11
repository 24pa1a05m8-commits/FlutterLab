import 'package:flutter/material.dart';

// ============================================================================
// EXPERIMENT 6(a): SheRise – Women Entrepreneur Profile Card (SDG 5)
// ZERO-SETUP SINGLE FILE FOR DARTPAD (https://dartpad.dev)
// Includes: Follow, Like, Share, Contact, Partners, Know Business, View Profile
// ============================================================================

void main() {
  runApp(const SheRiseApp());
}

class SheRiseApp extends StatelessWidget {
  const SheRiseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SheRise – Women Entrepreneurs',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}

// ============================================================================
// THEME & COLOR PALETTE
// ============================================================================
class AppTheme {
  static const Color primary = Color(0xFF673AB7); // Deep Purple
  static const Color secondary = Color(0xFFB39DDB); // Lavender
  static const Color accent = Color(0xFFFF8A80); // Coral
  static const Color background = Color(0xFFF8F5FF); // Soft Lavender
  static const Color surfaceCard = Color(0xFFFFFFFF);
  static const Color textDark = Color(0xFF292438);
  static const Color textSecondary = Color(0xFF6B657B);
  static const Color success = Color(0xFF4CAF50);
  static const Color surfaceSubtle = Color(0xFFEDE7F6);

  static const LinearGradient headerGradient = LinearGradient(
    colors: [Color(0xFF673AB7), Color(0xFF9575CD)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient bannerGradient = LinearGradient(
    colors: [Color(0xFF512DA8), Color(0xFF7E57C2), Color(0xFFFF8A80)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: background,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primary,
        primary: primary,
        secondary: secondary,
        tertiary: accent,
        surface: surfaceCard,
      ),
      cardTheme: CardThemeData(
        color: surfaceCard,
        elevation: 3,
        shadowColor: primary.withOpacity(0.12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}

// ============================================================================
// DATA MODEL
// ============================================================================
class Entrepreneur {
  final String id;
  final String name;
  final String designation;
  final String businessName;
  final String industry;
  final String location;
  final String imageUrl;
  final String aboutMe;
  final String story;
  final String missionStatement;
  final String visionStatement;
  final int yearEstablished;
  final int yearsOfExperience;
  final int employeesCount;
  final int customersServed;
  final int awardsCount;
  final int productsSold;
  final List<String> products;
  final List<String> keyAchievements;
  final List<String> tags;
  final String email;
  final String phone;
  final String websiteUrl;
  final String linkedInUrl;
  final String instagramHandle;
  final bool isFeatured;
  bool isFavorite;
  bool isFollowing;
  int followersCount;
  int likesCount;

  Entrepreneur({
    required this.id,
    required this.name,
    required this.designation,
    required this.businessName,
    required this.industry,
    required this.location,
    required this.imageUrl,
    required this.aboutMe,
    required this.story,
    required this.missionStatement,
    required this.visionStatement,
    required this.yearEstablished,
    required this.yearsOfExperience,
    required this.employeesCount,
    required this.customersServed,
    required this.awardsCount,
    required this.productsSold,
    required this.products,
    required this.keyAchievements,
    required this.tags,
    required this.email,
    required this.phone,
    required this.websiteUrl,
    required this.linkedInUrl,
    required this.instagramHandle,
    this.isFeatured = false,
    this.isFavorite = false,
    this.isFollowing = false,
    this.followersCount = 1240,
    this.likesCount = 385,
  });
}

// ============================================================================
// SAMPLE DATA
// ============================================================================
class EntrepreneurData {
  static final List<String> categories = [
    'All',
    'Sustainability',
    'Technology',
    'Fashion',
    'Education',
    'Healthcare',
    'Agriculture',
  ];

  static List<Entrepreneur> getEntrepreneurs() {
    return [
      Entrepreneur(
        id: 'ananya-sharma',
        name: 'Ananya Sharma',
        designation: 'Founder & CEO',
        businessName: 'GreenGlow',
        industry: 'Sustainability',
        location: 'Hyderabad, India',
        imageUrl:
            'https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?auto=format&fit=crop&w=600&q=80',
        aboutMe:
            'Ananya Sharma is an eco-innovator passionate about zero-waste living. '
            'After working in clean-tech research, she founded GreenGlow to craft 100% '
            'biodegradable personal care essentials. GreenGlow directly empowers '
            'over 85 rural women artisans through fair wages, dignified employment, and technical skill training.',
        story:
            'GreenGlow began in Hyderabad with 3 women artisans. Today it operates zero-waste '
            'production empowering 85+ rural craftswomen with financial independence and living wages.',
        missionStatement:
            'To eliminate single-use plastics from daily lifestyles through affordable, ethical, and regenerative home essentials.',
        visionStatement:
            'Empowering 1,000+ women artisans with sustainable livelihoods by 2030.',
        yearEstablished: 2021,
        yearsOfExperience: 7,
        employeesCount: 52,
        customersServed: 35000,
        awardsCount: 4,
        productsSold: 125000,
        products: [
          'Eco Biodegradable Gift Boxes',
          'Reusable Bamboo Personal Care Kits',
          'Organic Coconut Husk Home Scrubbers',
          'Handmade Herbal Wellness Soaps',
        ],
        keyAchievements: [
          'UN Global Compact Young Sustainable Leader Award 2024',
          'Diverted over 120 metric tons of single-use plastic waste',
          'Trained and employed 85+ rural craftswomen with fair living wages',
          'Featured in Forbes 30 Under 30 Social Impact Leaders',
        ],
        tags: ['SDG 5 Advocate', 'Zero Waste', 'Women-Led', 'Eco Certified'],
        email: 'ananya.sharma@greenglow.eco',
        phone: '+91 98765 43210',
        websiteUrl: 'https://greenglow.eco',
        linkedInUrl: 'https://linkedin.com/in/ananya-sharma-eco',
        instagramHandle: '@greenglow.eco',
        isFeatured: true,
        isFavorite: true,
        isFollowing: false,
        followersCount: 2840,
        likesCount: 1120,
      ),
      Entrepreneur(
        id: 'priya-nair',
        name: 'Priya Nair',
        designation: 'Founder & Chief Architect',
        businessName: 'TechShe AI Solutions',
        industry: 'Technology',
        location: 'Bengaluru, India',
        imageUrl:
            'https://images.unsplash.com/photo-1580489944761-15a19d654956?auto=format&fit=crop&w=600&q=80',
        aboutMe:
            'Priya Nair develops accessible AI tools for female micro-enterprises, '
            'bridging the digital gender divide through vernacular automation.',
        story:
            'Priya created TechShe AI to empower micro-businesses in tier-2 cities with predictive stock and customer analytics.',
        missionStatement:
            'Empowering 100,000 women entrepreneurs across emerging economies with next-generation AI literacy.',
        visionStatement: 'A world where technology eliminates entrepreneurial disparity.',
        yearEstablished: 2022,
        yearsOfExperience: 9,
        employeesCount: 38,
        customersServed: 18500,
        awardsCount: 3,
        productsSold: 42000,
        products: [
          'Vernacular Smart Inventory Bot',
          'AI Sales Forecasting for Artisans',
          'Automated WhatsApp Commerce Kit',
        ],
        keyAchievements: [
          'NASSCOM AI Game Changer Award 2023',
          'Supported 2,400+ women-led startups in India & SE Asia',
        ],
        tags: ['AI Innovator', 'Deep Tech', 'Women in STEM'],
        email: 'priya.nair@techshe.ai',
        phone: '+91 98111 22334',
        websiteUrl: 'https://techshe.ai',
        linkedInUrl: 'https://linkedin.com/in/priyanair-ai',
        instagramHandle: '@techshe.ai',
        isFeatured: false,
        isFavorite: false,
        isFollowing: false,
        followersCount: 1950,
        likesCount: 780,
      ),
      Entrepreneur(
        id: 'kavita-patel',
        name: 'Kavita Patel',
        designation: 'Creative Director',
        businessName: 'EcoWeave Atelier',
        industry: 'Fashion',
        location: 'Ahmedabad, India',
        imageUrl:
            'https://images.unsplash.com/photo-1567532939604-b6b5b0db2604?auto=format&fit=crop&w=600&q=80',
        aboutMe:
            'Kavita Patel revitalizes traditional handloom weaving by leading a cooperative '
            'where 90% of weavers are female sole breadwinners.',
        story:
            'EcoWeave unites over 110 rural weaver families with direct fair-trade fashion export channels.',
        missionStatement:
            'Preserving heritage handloom weaves through sustainable slow-fashion collections.',
        visionStatement: 'Establishing ethical Indian textiles on international runways.',
        yearEstablished: 2020,
        yearsOfExperience: 8,
        employeesCount: 65,
        customersServed: 22000,
        awardsCount: 5,
        productsSold: 31000,
        products: [
          'Organic Kala Cotton Sarees',
          'Upcycled Botanical-Dyed Scarves',
          'Zero-Waste Handwoven Tote Bags',
        ],
        keyAchievements: [
          'Vogue Sustainable Fashion Pioneer 2023',
          'Direct livelihood security for 110+ rural artisan households',
        ],
        tags: ['Slow Fashion', 'Fair Trade', 'Cultural Heritage'],
        email: 'kavita@ecoweave.in',
        phone: '+91 97222 33445',
        websiteUrl: 'https://ecoweave.in',
        linkedInUrl: 'https://linkedin.com/in/kavitapatel-fashion',
        instagramHandle: '@ecoweave.atelier',
        isFeatured: false,
        isFavorite: false,
        isFollowing: false,
        followersCount: 3400,
        likesCount: 1420,
      ),
    ];
  }
}

// ============================================================================
// CORE CUSTOM WIDGET: EntrepreneurProfileCard
// ============================================================================
class EntrepreneurProfileCard extends StatelessWidget {
  final Entrepreneur entrepreneur;
  final VoidCallback onFollow;
  final VoidCallback onLike;
  final VoidCallback onShare;
  final VoidCallback onContact;
  final VoidCallback onPartners;
  final VoidCallback onKnowBusiness;
  final VoidCallback onViewProfile;

  const EntrepreneurProfileCard({
    super.key,
    required this.entrepreneur,
    required this.onFollow,
    required this.onLike,
    required this.onShare,
    required this.onContact,
    required this.onPartners,
    required this.onKnowBusiness,
    required this.onViewProfile,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 1. Header with Stacked Avatar
          SizedBox(
            height: 160,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 110,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: AppTheme.headerGradient,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          entrepreneur.tags.first,
                          style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.share, color: Colors.white, size: 20),
                            onPressed: onShare,
                          ),
                          IconButton(
                            icon: Icon(
                              entrepreneur.isFavorite ? Icons.favorite : Icons.favorite_border,
                              color: entrepreneur.isFavorite ? AppTheme.accent : Colors.white,
                            ),
                            onPressed: onLike,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 18,
                  bottom: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 3.5),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(42),
                      child: Image.network(
                        entrepreneur.imageUrl,
                        width: 78,
                        height: 78,
                        fit: BoxFit.cover,
                        errorBuilder: (ctx, err, stack) => CircleAvatar(
                          radius: 39,
                          backgroundColor: AppTheme.secondary,
                          child: Text(entrepreneur.name[0], style: const TextStyle(fontSize: 30, color: Colors.white)),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 16,
                  bottom: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppTheme.surfaceSubtle,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      entrepreneur.industry,
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppTheme.primary),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // 2. Body Details
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 6, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entrepreneur.name,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${entrepreneur.designation} • ${entrepreneur.businessName}',
                  style: const TextStyle(fontSize: 13.5, fontWeight: FontWeight.w600, color: AppTheme.primary),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined, size: 14, color: AppTheme.textSecondary),
                    const SizedBox(width: 4),
                    Text(entrepreneur.location, style: const TextStyle(fontSize: 12, color: AppTheme.textSecondary)),
                    const SizedBox(width: 10),
                    const Icon(Icons.calendar_today_outlined, size: 13, color: AppTheme.textSecondary),
                    const SizedBox(width: 4),
                    Text('Est. ${entrepreneur.yearEstablished}', style: const TextStyle(fontSize: 12, color: AppTheme.textSecondary)),
                    const Spacer(),
                    Text('${entrepreneur.followersCount} followers', style: const TextStyle(fontSize: 11, color: AppTheme.textSecondary)),
                  ],
                ),
                const SizedBox(height: 12),

                // About Me
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(color: AppTheme.background, borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('About Me & Entrepreneurial Journey', style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text(entrepreneur.aboutMe, style: const TextStyle(fontSize: 12, height: 1.4, color: AppTheme.textSecondary)),
                    ],
                  ),
                ),
                const SizedBox(height: 12),

                // Statistics Section (4 Cards)
                Row(
                  children: [
                    Expanded(
                      child: _buildMetricCard(Icons.work_history_outlined, '${entrepreneur.yearsOfExperience}+ Yrs', 'Experience'),
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: _buildMetricCard(Icons.groups_outlined, '${entrepreneur.employeesCount}', 'Employees'),
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: _buildMetricCard(Icons.people_outline, '${(entrepreneur.customersServed / 1000).toStringAsFixed(0)}K+', 'Customers'),
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: _buildMetricCard(Icons.emoji_events_outlined, '${entrepreneur.awardsCount}', 'Awards'),
                    ),
                  ],
                ),
                const SizedBox(height: 14),

                // Action Buttons Row 1: Follow & Contact
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: onFollow,
                        icon: Icon(entrepreneur.isFollowing ? Icons.check : Icons.person_add_alt_1, size: 16),
                        label: Text(entrepreneur.isFollowing ? 'Following' : 'Follow'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: entrepreneur.isFollowing ? AppTheme.secondary : AppTheme.primary,
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: onContact,
                        icon: const Icon(Icons.mail_outline, size: 16),
                        label: const Text('Contact'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // Action Buttons Row 2: Partners & Know About Business
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: onPartners,
                        icon: const Icon(Icons.handshake_outlined, size: 16),
                        label: const Text('Partners'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.accent,
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: onKnowBusiness,
                        icon: const Icon(Icons.storefront_outlined, size: 16),
                        label: const Text('Know Business'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),

                // Action Buttons Row 3: View Full Profile
                Center(
                  child: TextButton.icon(
                    onPressed: onViewProfile,
                    icon: const Icon(Icons.arrow_forward_rounded, size: 16),
                    label: const Text('View Full Profile & Journey'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildMetricCard(IconData icon, String val, String lbl) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: AppTheme.background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.secondary.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Icon(icon, size: 18, color: AppTheme.primary),
          const SizedBox(height: 4),
          Text(val, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
          Text(lbl, style: const TextStyle(fontSize: 9.5, color: AppTheme.textSecondary)),
        ],
      ),
    );
  }
}

// ============================================================================
// SCREENS
// ============================================================================
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Entrepreneur> _entrepreneurs;
  String _selectedCategory = 'All';
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _entrepreneurs = EntrepreneurData.getEntrepreneurs();
  }

  void _toggleFollow(String id) {
    setState(() {
      final index = _entrepreneurs.indexWhere((e) => e.id == id);
      if (index != -1) {
        final cur = _entrepreneurs[index];
        cur.isFollowing = !cur.isFollowing;
        cur.followersCount += cur.isFollowing ? 1 : -1;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(cur.isFollowing ? 'Following ${cur.name}!' : 'Unfollowed ${cur.name}'),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    });
  }

  void _toggleLike(String id) {
    setState(() {
      final index = _entrepreneurs.indexWhere((e) => e.id == id);
      if (index != -1) {
        final cur = _entrepreneurs[index];
        cur.isFavorite = !cur.isFavorite;
        cur.likesCount += cur.isFavorite ? 1 : -1;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(cur.isFavorite ? 'Liked ${cur.name}\'s profile!' : 'Removed like'),
            behavior: SnackBarBehavior.floating,
            backgroundColor: AppTheme.accent,
          ),
        );
      }
    });
  }

  void _shareProfile(Entrepreneur e) {
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Share ${e.name}\'s Profile'),
        content: SelectableText(
          '🌟 Empowering Woman Entrepreneur: ${e.name}\n'
          '💼 ${e.designation} at ${e.businessName}\n'
          '🏷️ Industry: ${e.industry} | 📍 ${e.location}\n'
          '🌱 Mission: ${e.missionStatement}\n'
          '🔗 Discover on SheRise (SDG 5: Gender Equality)',
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Close')),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(ctx);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Profile summary copied to clipboard!')),
              );
            },
            child: const Text('Copy'),
          ),
        ],
      ),
    );
  }

  void _showContact(Entrepreneur e) {
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Contact ${e.name}'),
        content: Text('Send inquiries directly to ${e.businessName} (${e.email}).'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(ctx);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Message sent to ${e.name}!'),
                  backgroundColor: AppTheme.primary,
                ),
              );
            },
            child: const Text('Send'),
          ),
        ],
      ),
    );
  }

  void _showPartners(Entrepreneur e) {
    showModalBottomSheet<void>(
      context: context,
      builder: (ctx) => Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Partner with ${e.businessName}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Official Email: ${e.email}'),
            Text('Official Contact: ${e.phone}'),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(ctx);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Partnership proposal submitted to ${e.businessName}!'),
                      backgroundColor: AppTheme.success,
                    ),
                  );
                },
                child: const Text('Submit Partnership Interest'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showKnowBusiness(Entrepreneur e) {
    showModalBottomSheet<void>(
      context: context,
      builder: (ctx) => Padding(
        padding: const EdgeInsets.all(22),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('About ${e.businessName}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(e.story, style: const TextStyle(fontSize: 13, height: 1.4)),
              const SizedBox(height: 14),
              const Text('Key Products:', style: TextStyle(fontWeight: FontWeight.bold)),
              ...e.products.map((p) => Text('• $p', style: const TextStyle(fontSize: 12.5))),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _entrepreneurs.where((e) {
      final matchCat = _selectedCategory == 'All' || e.industry == _selectedCategory;
      final matchQ = _searchQuery.isEmpty || e.name.toLowerCase().contains(_searchQuery.toLowerCase());
      return matchCat && matchQ;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('SheRise – Women Entrepreneurs', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text('Empowering Women. Inspiring Innovation.', style: TextStyle(fontSize: 11, color: AppTheme.textSecondary)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Search
            TextField(
              onChanged: (val) => setState(() => _searchQuery = val),
              decoration: InputDecoration(
                hintText: 'Search by entrepreneur or business...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
              ),
            ),
            const SizedBox(height: 12),

            // Category Chips
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: EntrepreneurData.categories.map((cat) {
                  final isSel = _selectedCategory == cat;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: InkWell(
                      onTap: () => setState(() => _selectedCategory = cat),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                        decoration: BoxDecoration(
                          color: isSel ? AppTheme.primary : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: isSel ? AppTheme.primary : AppTheme.secondary.withOpacity(0.4)),
                        ),
                        child: Text(cat, style: TextStyle(fontSize: 12.5, color: isSel ? Colors.white : AppTheme.textDark)),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 16),

            // Profile Cards
            ...filtered.map((e) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: EntrepreneurProfileCard(
                    entrepreneur: e,
                    onFollow: () => _toggleFollow(e.id),
                    onLike: () => _toggleLike(e.id),
                    onShare: () => _shareProfile(e),
                    onContact: () => _showContact(e),
                    onPartners: () => _showPartners(e),
                    onKnowBusiness: () => _showKnowBusiness(e),
                    onViewProfile: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailedProfileView(entrepreneur: e),
                        ),
                      );
                    },
                  ),
                )),

            const SizedBox(height: 8),
            // SDG 5 Banner
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppTheme.accent),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.diversity_1_outlined, color: AppTheme.primary),
                      SizedBox(width: 8),
                      Text('UN SDG 5: Gender Equality', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                    ],
                  ),
                  SizedBox(height: 6),
                  Text(
                    '"SheRise supports SDG 5 – Gender Equality by providing a digital platform to showcase women entrepreneurs, promote women-led businesses, and create opportunities for collaboration and economic empowerment."',
                    style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailedProfileView extends StatelessWidget {
  final Entrepreneur entrepreneur;

  const DetailedProfileView({super.key, required this.entrepreneur});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(entrepreneur.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: Image.network(
                  entrepreneur.imageUrl,
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                  errorBuilder: (ctx, err, stack) => CircleAvatar(
                    radius: 60,
                    child: Text(entrepreneur.name[0], style: const TextStyle(fontSize: 40)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                '${entrepreneur.designation} • ${entrepreneur.businessName}',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppTheme.primary),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Entrepreneurial Journey', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Text(entrepreneur.aboutMe, style: const TextStyle(fontSize: 13, height: 1.4)),
            const SizedBox(height: 16),
            const Text('Mission Statement', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Text(entrepreneur.missionStatement, style: const TextStyle(fontSize: 13, height: 1.4)),
            const SizedBox(height: 20),
            const Text('Key Milestones', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ...entrepreneur.keyAchievements.map((ach) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      const Icon(Icons.check_circle, color: AppTheme.success, size: 16),
                      const SizedBox(width: 8),
                      Expanded(child: Text(ach, style: const TextStyle(fontSize: 13))),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
