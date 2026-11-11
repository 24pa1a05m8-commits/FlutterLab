import 'package:flutter/material.dart';
import '../models/entrepreneur.dart';
import '../data/entrepreneur_data.dart';
import '../theme/app_theme.dart';
import '../widgets/entrepreneur_profile_card.dart';
import '../widgets/category_chip.dart';
import '../widgets/sdg_banner.dart';
import 'profile_screen.dart';
import 'explore_screen.dart';

/// HomeScreen is the central interactive hub for SheRise.
/// Houses the featured entrepreneur, search, category chips,
/// and interactive buttons: Follow, Like, Share, Contact, Partners, Know About Business, and View Profile.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Entrepreneur> _entrepreneurs;
  String _selectedCategory = 'All';
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();
  int _currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _entrepreneurs = EntrepreneurData.getEntrepreneurs();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // 1. FOLLOW TOGGLE
  void _toggleFollow(String entrepreneurId) {
    setState(() {
      final index = _entrepreneurs.indexWhere((e) => e.id == entrepreneurId);
      if (index != -1) {
        final current = _entrepreneurs[index];
        current.isFollowing = !current.isFollowing;
        if (current.isFollowing) {
          current.followersCount++;
        } else {
          current.followersCount--;
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              current.isFollowing
                  ? 'You are now following ${current.name}!'
                  : 'You unfollowed ${current.name}.',
            ),
            behavior: SnackBarBehavior.floating,
            backgroundColor: AppTheme.primary,
            duration: const Duration(seconds: 2),
          ),
        );
      }
    });
  }

  // 2. LIKE / FAVORITE TOGGLE
  void _toggleLike(String entrepreneurId) {
    setState(() {
      final index = _entrepreneurs.indexWhere((e) => e.id == entrepreneurId);
      if (index != -1) {
        final current = _entrepreneurs[index];
        current.isFavorite = !current.isFavorite;
        if (current.isFavorite) {
          current.likesCount++;
        } else {
          current.likesCount--;
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              current.isFavorite
                  ? 'Added ${current.name} to your liked leaders!'
                  : 'Removed ${current.name} from likes.',
            ),
            behavior: SnackBarBehavior.floating,
            backgroundColor: AppTheme.accent,
            duration: const Duration(seconds: 2),
          ),
        );
      }
    });
  }

  // 3. SHARE PROFILE SUMMARY
  void _shareProfile(Entrepreneur entrepreneur) {
    final summary = '🌟 Empowering Woman Entrepreneur: ${entrepreneur.name}\n'
        '💼 ${entrepreneur.designation} at ${entrepreneur.businessName}\n'
        '🏷️ Industry: ${entrepreneur.industry} | 📍 ${entrepreneur.location}\n'
        '🌱 Mission: ${entrepreneur.missionStatement}\n'
        '🔗 Discover more on SheRise (SDG 5: Gender Equality)';

    showDialog<void>(
      context: context,
      builder: (dialogCtx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Row(
          children: [
            Icon(Icons.share, color: AppTheme.primary),
            SizedBox(width: 8),
            Text('Share Profile Summary', style: TextStyle(fontSize: 17)),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Copy or share this entrepreneur\'s profile summary with your network:',
              style: TextStyle(fontSize: 12.5, color: AppTheme.textSecondary),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppTheme.background,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppTheme.secondary.withOpacity(0.4)),
              ),
              child: SelectableText(
                summary,
                style: const TextStyle(fontSize: 12, height: 1.4),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogCtx),
            child: const Text('Close'),
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pop(dialogCtx);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Profile summary copied to clipboard!'),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: AppTheme.primary,
                ),
              );
            },
            icon: const Icon(Icons.copy, size: 16),
            label: const Text('Copy Summary'),
          ),
        ],
      ),
    );
  }

  // 4. CONTACT ENTREPRENEUR
  void _showContactDialog(Entrepreneur entrepreneur) {
    final nameCtrl = TextEditingController();
    final messageCtrl = TextEditingController();

    showDialog<void>(
      context: context,
      builder: (dialogCtx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            const Icon(Icons.mail_outline, color: AppTheme.primary),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                'Contact ${entrepreneur.name}',
                style: const TextStyle(fontSize: 17),
              ),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Send an inquiry directly to ${entrepreneur.businessName} (${entrepreneur.email}).',
              style: const TextStyle(fontSize: 12.5, color: AppTheme.textSecondary),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: nameCtrl,
              decoration: const InputDecoration(
                labelText: 'Your Name',
                prefixIcon: Icon(Icons.person_outline),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: messageCtrl,
              maxLines: 2,
              decoration: const InputDecoration(
                labelText: 'Your Message',
                prefixIcon: Icon(Icons.chat_bubble_outline),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogCtx),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(dialogCtx);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Your message was delivered to ${entrepreneur.name} (${entrepreneur.businessName})!',
                  ),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: AppTheme.primary,
                ),
              );
            },
            child: const Text('Send Message'),
          ),
        ],
      ),
    );
  }

  // 5. PARTNER WITH US
  void _showPartnersSheet(Entrepreneur entrepreneur) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (sheetCtx) => Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 36,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(Icons.handshake_outlined,
                    color: AppTheme.accent, size: 26),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Partner With ${entrepreneur.businessName}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Collaborate with ${entrepreneur.name} on supply chains, bulk distribution, corporate gifting, or SDG 5 gender diversity programs.',
              style: const TextStyle(fontSize: 13, color: AppTheme.textSecondary, height: 1.4),
            ),
            const SizedBox(height: 14),
            ListTile(
              dense: true,
              leading: const Icon(Icons.email_outlined, color: AppTheme.primary),
              title: const Text('Partnership Desk'),
              subtitle: Text(entrepreneur.email),
            ),
            ListTile(
              dense: true,
              leading: const Icon(Icons.phone_outlined, color: AppTheme.primary),
              title: const Text('Direct Phone'),
              subtitle: Text(entrepreneur.phone),
            ),
            const SizedBox(height: 14),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(sheetCtx);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Partnership inquiry dispatched to ${entrepreneur.businessName}!',
                      ),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: AppTheme.success,
                    ),
                  );
                },
                icon: const Icon(Icons.verified_outlined),
                label: const Text('Submit Partnership Proposal'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 6. KNOW ABOUT THE BUSINESS
  void _showKnowBusinessSheet(Entrepreneur entrepreneur) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (sheetCtx) => Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(sheetCtx).size.height * 0.75,
        ),
        padding: const EdgeInsets.all(22),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 36,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Icon(Icons.storefront_outlined,
                      color: AppTheme.primary, size: 26),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          entrepreneur.businessName,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Sector: ${entrepreneur.industry} • Est. ${entrepreneur.yearEstablished}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppTheme.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'The Business Story & Impact',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              Text(
                entrepreneur.story,
                style: const TextStyle(
                  fontSize: 13,
                  height: 1.45,
                  color: AppTheme.textSecondary,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Key Products & Solutions',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              ...entrepreneur.products.map(
                (p) => Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Row(
                    children: [
                      const Icon(Icons.check_circle_outline,
                          size: 16, color: AppTheme.success),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(p, style: const TextStyle(fontSize: 13)),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 18),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(sheetCtx),
                  child: const Text('Close Business Overview'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 7. VIEW FULL PROFILE
  void _navigateToDetail(Entrepreneur entrepreneur) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailedProfileScreen(
          entrepreneur: entrepreneur,
          onFavoriteToggle: () {
            _toggleLike(entrepreneur.id);
          },
        ),
      ),
    );
  }

  List<Entrepreneur> get _filteredEntrepreneurs {
    return _entrepreneurs.where((e) {
      final matchesCat = _selectedCategory == 'All' ||
          e.industry.toLowerCase() == _selectedCategory.toLowerCase();
      final matchesQ = _searchQuery.isEmpty ||
          e.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          e.businessName.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          e.location.toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesCat && matchesQ;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final featured = _entrepreneurs.firstWhere(
      (e) => e.isFeatured,
      orElse: () => _entrepreneurs.first,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'SheRise – Women Entrepreneurs',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppTheme.textDark,
              ),
            ),
            Text(
              'Empowering Women. Inspiring Innovation.',
              style: TextStyle(
                fontSize: 11.5,
                fontWeight: FontWeight.w500,
                color: AppTheme.textSecondary,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'Explore Directory',
            icon: const Icon(Icons.travel_explore_outlined,
                color: AppTheme.primary),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ExploreScreen(
                    entrepreneurs: _entrepreneurs,
                    onFavoriteToggle: _toggleLike,
                  ),
                ),
              );
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: _currentTabIndex == 1
            ? ExploreScreen(
                entrepreneurs: _entrepreneurs,
                onFavoriteToggle: _toggleLike,
              )
            : _currentTabIndex == 2
                ? _buildSdgDedicatedTab()
                : _buildHomeDashboard(featured),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentTabIndex,
        onDestinationSelected: (idx) {
          setState(() => _currentTabIndex = idx);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.explore_outlined),
            selectedIcon: Icon(Icons.explore),
            label: 'Explore',
          ),
          NavigationDestination(
            icon: Icon(Icons.diversity_1_outlined),
            selectedIcon: Icon(Icons.diversity_1),
            label: 'SDG 5 Impact',
          ),
        ],
      ),
    );
  }

  Widget _buildHomeDashboard(Entrepreneur featured) {
    final filtered = _filteredEntrepreneurs;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 880),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 1. Gradient Banner
              _buildGradientWelcomeBanner(),
              const SizedBox(height: 16),

              // 2. Search Field
              TextField(
                controller: _searchController,
                onChanged: (val) => setState(() => _searchQuery = val),
                decoration: InputDecoration(
                  hintText: 'Search by entrepreneur or business...',
                  prefixIcon: const Icon(Icons.search, color: AppTheme.primary),
                  suffixIcon: _searchQuery.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            _searchController.clear();
                            setState(() => _searchQuery = '');
                          },
                        )
                      : null,
                ),
              ),
              const SizedBox(height: 14),

              // 3. Category Filter Chips
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: EntrepreneurData.categories.map((category) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8, bottom: 4),
                      child: CategoryChip(
                        label: category,
                        isSelected: _selectedCategory == category,
                        onTap: () {
                          setState(() => _selectedCategory = category);
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 18),

              // 4. Featured Entrepreneur (Ananya Sharma) Custom Profile Card
              if (_searchQuery.isEmpty && _selectedCategory == 'All') ...[
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: AppTheme.primary.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.star_rounded,
                        color: AppTheme.primary,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Featured Entrepreneur of the Month',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.textDark,
                          ),
                        ),
                        Text(
                          'Experiment 6(a) Core Custom Profile Card Showcase',
                          style: TextStyle(
                            fontSize: 11.5,
                            color: AppTheme.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Core Custom Widget with ALL interactive buttons:
                // Follow, Like, Share, Contact, Partners, Know About Business, View Full Profile
                EntrepreneurProfileCard(
                  entrepreneur: featured,
                  onFollow: () => _toggleFollow(featured.id),
                  onLike: () => _toggleLike(featured.id),
                  onShare: () => _shareProfile(featured),
                  onContact: () => _showContactDialog(featured),
                  onPartners: () => _showPartnersSheet(featured),
                  onKnowBusiness: () => _showKnowBusinessSheet(featured),
                  onViewProfile: () => _navigateToDetail(featured),
                ),
                const SizedBox(height: 20),
              ],

              // 5. More Women Leaders / Filtered Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _searchQuery.isNotEmpty || _selectedCategory != 'All'
                        ? 'Filtered Profiles (${filtered.length})'
                        : 'More Inspiring Women Leaders',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textDark,
                    ),
                  ),
                  if (_searchQuery.isNotEmpty || _selectedCategory != 'All')
                    GestureDetector(
                      onTap: () {
                        _searchController.clear();
                        setState(() {
                          _searchQuery = '';
                          _selectedCategory = 'All';
                        });
                      },
                      child: const Text(
                        'Reset Filters',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppTheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 12),

              // Filtered list of cards
              if (filtered.isEmpty)
                _buildEmptySearchResult()
              else
                ...filtered
                    .where((e) =>
                        _searchQuery.isNotEmpty ||
                        _selectedCategory != 'All' ||
                        e.id != featured.id)
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: EntrepreneurProfileCard(
                          entrepreneur: e,
                          onFollow: () => _toggleFollow(e.id),
                          onLike: () => _toggleLike(e.id),
                          onShare: () => _shareProfile(e),
                          onContact: () => _showContactDialog(e),
                          onPartners: () => _showPartnersSheet(e),
                          onKnowBusiness: () => _showKnowBusinessSheet(e),
                          onViewProfile: () => _navigateToDetail(e),
                        ),
                      ),
                    ),

              const SizedBox(height: 14),

              // 6. Dedicated SDG 5 Banner
              const SdgBanner(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGradientWelcomeBanner() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: AppTheme.bannerGradient,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primary.withOpacity(0.25),
            blurRadius: 14,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'PLATFORM FOR WOMEN IN BUSINESS',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.8,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Empowering Women.\nInspiring Innovation.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    height: 1.25,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Discover, connect with, and champion pioneering female founders transforming industries across India.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                    height: 1.35,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 14),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.18),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.auto_awesome,
              color: Colors.white,
              size: 36,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptySearchResult() {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.secondary.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          const Icon(
            Icons.search_off_rounded,
            size: 46,
            color: AppTheme.primary,
          ),
          const SizedBox(height: 12),
          const Text(
            'No matching entrepreneurs found',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: AppTheme.textDark,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Try searching for another keyword or reset the category filter.',
            style: TextStyle(fontSize: 12.5, color: Colors.grey.shade600),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 14),
          ElevatedButton(
            onPressed: () {
              _searchController.clear();
              setState(() {
                _searchQuery = '';
                _selectedCategory = 'All';
              });
            },
            child: const Text('Reset Search & Filters'),
          ),
        ],
      ),
    );
  }

  Widget _buildSdgDedicatedTab() {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 800),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SdgBanner(),
              const SizedBox(height: 20),
              _buildImpactMetricCard(
                icon: Icons.business_center,
                title: 'Marketplace Diversity',
                description:
                    'Providing equal digital access to women founders across 6 key industry sectors.',
              ),
              const SizedBox(height: 12),
              _buildImpactMetricCard(
                icon: Icons.monetization_on_outlined,
                title: 'Economic Independence',
                description:
                    'Direct customer & B2B partnership pathways promoting financial self-sufficiency.',
              ),
              const SizedBox(height: 12),
              _buildImpactMetricCard(
                icon: Icons.supervised_user_circle_outlined,
                title: 'Grassroots Employment',
                description:
                    'Our showcased enterprises employ over 300+ rural and semi-urban female craftswomen.',
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImpactMetricCard({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.secondary.withOpacity(0.3)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppTheme.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: AppTheme.primary, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14.5,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textDark,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 12.5,
                    color: AppTheme.textSecondary,
                    height: 1.35,
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
