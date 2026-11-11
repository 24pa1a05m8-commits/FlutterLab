import 'package:flutter/material.dart';
import '../models/entrepreneur.dart';
import '../theme/app_theme.dart';
import '../widgets/statistic_card.dart';
import '../widgets/custom_buttons.dart';

/// DetailedProfileScreen displays the complete biographical, entrepreneurial,
/// and milestone journey of a woman entrepreneur with interactive contact forms.
class DetailedProfileScreen extends StatefulWidget {
  final Entrepreneur entrepreneur;
  final VoidCallback onFavoriteToggle;

  const DetailedProfileScreen({
    super.key,
    required this.entrepreneur,
    required this.onFavoriteToggle,
  });

  @override
  State<DetailedProfileScreen> createState() => _DetailedProfileScreenState();
}

class _DetailedProfileScreenState extends State<DetailedProfileScreen> {
  late Entrepreneur _entrepreneur;

  @override
  void initState() {
    super.initState();
    _entrepreneur = widget.entrepreneur;
  }

  void _handleFavoriteToggle() {
    setState(() {
      _entrepreneur.isFavorite = !_entrepreneur.isFavorite;
    });
    widget.onFavoriteToggle();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _entrepreneur.isFavorite
              ? 'Added ${_entrepreneur.name} to bookmarked entrepreneurs.'
              : 'Removed ${_entrepreneur.name} from bookmarks.',
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _openContactDialog() {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final messageController = TextEditingController();

    showDialog<void>(
      context: context,
      builder: (dialogCtx) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Row(
            children: [
              const Icon(Icons.mail_outline, color: AppTheme.primary),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Contact ${_entrepreneur.name}',
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Send an inquiry directly to ${_entrepreneur.businessName}.',
                  style: const TextStyle(
                    fontSize: 12.5,
                    color: AppTheme.textSecondary,
                  ),
                ),
                const SizedBox(height: 14),
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Your Name',
                    prefixIcon: Icon(Icons.person_outline),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Your Email',
                    prefixIcon: Icon(Icons.alternate_email),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: messageController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: 'Your Message',
                    alignLabelWithHint: true,
                    prefixIcon: Icon(Icons.chat_bubble_outline),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogCtx),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                final senderName = nameController.text.trim();
                Navigator.pop(dialogCtx);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      senderName.isNotEmpty
                          ? 'Thank you, $senderName! Your message has been sent to ${_entrepreneur.name}.'
                          : 'Your message has been sent to ${_entrepreneur.name}.',
                    ),
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: AppTheme.primary,
                  ),
                );
              },
              child: const Text('Send Message'),
            ),
          ],
        );
      },
    );
  }

  void _openPartnerSheet() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (sheetCtx) {
        return Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom: MediaQuery.of(sheetCtx).viewInsets.bottom + 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
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
                      'Partner with ${_entrepreneur.businessName}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'Collaborate on SDG 5 initiatives, bulk procurement, or supply chain partnerships.',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey.shade700,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 16),
              ListTile(
                dense: true,
                leading: const Icon(Icons.email_outlined, color: AppTheme.primary),
                title: const Text('Email Address'),
                subtitle: Text(_entrepreneur.email),
              ),
              ListTile(
                dense: true,
                leading: const Icon(Icons.phone_outlined, color: AppTheme.primary),
                title: const Text('Official Contact'),
                subtitle: Text(_entrepreneur.phone),
              ),
              ListTile(
                dense: true,
                leading: const Icon(Icons.public, color: AppTheme.primary),
                title: const Text('Official Portal'),
                subtitle: Text(_entrepreneur.websiteUrl),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(sheetCtx);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Partnership inquiry dispatched to ${_entrepreneur.businessName}!',
                        ),
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: AppTheme.success,
                      ),
                    );
                  },
                  icon: const Icon(Icons.check_circle_outline),
                  label: const Text('Submit Partnership Interest'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Collapsible Sliver App Bar with Large Photograph Header
          SliverAppBar(
            expandedHeight: 280,
            pinned: true,
            backgroundColor: AppTheme.primary,
            foregroundColor: Colors.white,
            actions: [
              IconButton(
                tooltip: _entrepreneur.isFavorite
                    ? 'Remove Bookmark'
                    : 'Bookmark Profile',
                icon: Icon(
                  _entrepreneur.isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: _entrepreneur.isFavorite
                      ? AppTheme.accent
                      : Colors.white,
                ),
                onPressed: _handleFavoriteToggle,
              ),
              const SizedBox(width: 8),
            ],
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                _entrepreneur.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  shadows: [
                    Shadow(
                      color: Colors.black87,
                      blurRadius: 6,
                    ),
                  ],
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    _entrepreneur.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: AppTheme.primary,
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.person,
                          size: 96,
                          color: Colors.white70,
                        ),
                      );
                    },
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Color(0x99000000),
                          Color(0xEE292438),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Detailed Information Body
          SliverToBoxAdapter(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 850),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Role and Business Title Header
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${_entrepreneur.designation} • ${_entrepreneur.businessName}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: AppTheme.primary,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    const Icon(Icons.location_on_outlined,
                                        size: 15,
                                        color: AppTheme.textSecondary),
                                    const SizedBox(width: 4),
                                    Text(
                                      _entrepreneur.location,
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: AppTheme.textSecondary,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    const Icon(Icons.calendar_month_outlined,
                                        size: 15,
                                        color: AppTheme.textSecondary),
                                    const SizedBox(width: 4),
                                    Text(
                                      'Founded ${_entrepreneur.yearEstablished}',
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: AppTheme.textSecondary,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: AppTheme.surfaceSubtle,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: AppTheme.primary.withOpacity(0.3),
                              ),
                            ),
                            child: Text(
                              _entrepreneur.industry,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),

                      // Tags List
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: _entrepreneur.tags.map((tag) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppTheme.secondary.withOpacity(0.18),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              '#$tag',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppTheme.primary,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 24),

                      // Business Statistics Grid
                      const Text(
                        'Business Performance & Reach',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.textDark,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: StatisticCard(
                              icon: Icons.work_history_outlined,
                              value: '${_entrepreneur.yearsOfExperience}+ Years',
                              label: 'Industry Exp.',
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: StatisticCard(
                              icon: Icons.groups_outlined,
                              value: '${_entrepreneur.employeesCount}',
                              label: 'Team Size',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: StatisticCard(
                              icon: Icons.people_outline,
                              value:
                                  '${(_entrepreneur.customersServed / 1000).toStringAsFixed(0)}K+',
                              label: 'Customers Served',
                              iconColor: AppTheme.success,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: StatisticCard(
                              icon: Icons.emoji_events_outlined,
                              value: '${_entrepreneur.awardsCount} Honors',
                              label: 'National Awards',
                              iconColor: const Color(0xFFFFB300),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // Personal Introduction & Entrepreneurial Journey
                      _buildContentCard(
                        icon: Icons.history_edu_outlined,
                        title: 'Entrepreneurial Journey',
                        body: _entrepreneur.aboutMe,
                      ),
                      const SizedBox(height: 16),

                      // Business Mission & Vision
                      _buildContentCard(
                        icon: Icons.flag_outlined,
                        title: 'Mission Statement',
                        body: _entrepreneur.missionStatement,
                      ),
                      const SizedBox(height: 16),
                      _buildContentCard(
                        icon: Icons.visibility_outlined,
                        title: 'Long-term Vision',
                        body: _entrepreneur.visionStatement,
                      ),
                      const SizedBox(height: 20),

                      // Key Achievements & Milestones
                      const Text(
                        'Key Milestones & Honors',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.textDark,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ..._entrepreneur.keyAchievements.map(
                        (achievement) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.check_circle,
                                size: 18,
                                color: AppTheme.success,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  achievement,
                                  style: const TextStyle(
                                    fontSize: 13.5,
                                    color: AppTheme.textDark,
                                    height: 1.35,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 28),

                      // Bottom CTA Action Buttons
                      Row(
                        children: [
                          Expanded(
                            child: PrimaryActionButton(
                              label: 'Contact Founder',
                              icon: Icons.mail_outline,
                              onPressed: _openContactDialog,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: SecondaryActionButton(
                              label: 'Partner With Us',
                              icon: Icons.handshake_outlined,
                              onPressed: _openPartnerSheet,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContentCard({
    required IconData icon,
    required String title,
    required String body,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppTheme.secondary.withOpacity(0.3),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: AppTheme.primary, size: 20),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14.5,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textDark,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            body,
            style: const TextStyle(
              fontSize: 13.5,
              height: 1.5,
              color: AppTheme.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
