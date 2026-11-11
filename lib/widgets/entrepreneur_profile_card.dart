import 'package:flutter/material.dart';
import '../models/entrepreneur.dart';
import '../theme/app_theme.dart';
import 'gradient_header.dart';
import 'statistic_card.dart';
import 'custom_buttons.dart';

/// EntrepreneurProfileCard is the central custom widget for Experiment 6(a).
/// Includes:
/// - Gradient Header with Avatar & Badges
/// - Name, designation, company, location, experience
/// - About Me / Bio
/// - Business Information & Products
/// - Key Statistics (Experience, Team, Customers, Awards)
/// - Interactive Actions: Follow, Like, Share, Contact, Partners, Know About Business, View Profile
/// - Social Media channels
class EntrepreneurProfileCard extends StatelessWidget {
  final Entrepreneur entrepreneur;
  final VoidCallback onFollow;
  final VoidCallback onLike;
  final VoidCallback onShare;
  final VoidCallback onContact;
  final VoidCallback onPartners;
  final VoidCallback onKnowBusiness;
  final VoidCallback onViewProfile;
  final VoidCallback? onLinkedIn;
  final VoidCallback? onInstagram;
  final VoidCallback? onWebsite;

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
    this.onLinkedIn,
    this.onInstagram,
    this.onWebsite,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
        side: BorderSide(
          color: AppTheme.secondary.withOpacity(0.35),
          width: 1.2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 1. GRADIENT HEADER WITH OVERLAPPING AVATAR
          _buildHeader(context),

          // 2. ENTREPRENEUR INFO, METRICS, & ACTIONS
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 10, 18, 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTitleRow(context),
                const SizedBox(height: 12),

                // 3. ABOUT ME / BIO
                _buildBioSection(context),
                const SizedBox(height: 14),

                // 4. BUSINESS SUMMARY (Mission & Industry)
                _buildBusinessSnippet(context),
                const SizedBox(height: 14),

                // 5. FOUR STATISTICS CARDS
                _buildStatisticsGrid(context),
                const SizedBox(height: 16),

                // 6. INTERACTIVE ACTION BUTTONS
                // (Follow, Like, Share, Contact, Partners, Know About Business, View Profile)
                _buildActionButtons(context),
                const SizedBox(height: 14),

                // 7. SOCIAL MEDIA BAR
                _buildSocialBar(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 1. Gradient Header with Stacked Avatar & Heart Icon
  Widget _buildHeader(BuildContext context) {
    return SizedBox(
      height: 165,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          GradientHeader(
            height: 115,
            badgeText: entrepreneur.tags.isNotEmpty
                ? entrepreneur.tags.first
                : 'SDG 5 Leader',
            badgeIcon: Icons.verified_outlined,
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Share Icon in Header
                IconButton(
                  tooltip: 'Share Profile',
                  icon: const Icon(Icons.share_outlined, color: Colors.white, size: 20),
                  onPressed: onShare,
                ),
                // Like / Favorite Heart
                IconButton(
                  tooltip: entrepreneur.isFavorite ? 'Unlike' : 'Like Profile',
                  icon: Icon(
                    entrepreneur.isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: entrepreneur.isFavorite
                        ? AppTheme.accent
                        : Colors.white,
                    size: 24,
                  ),
                  onPressed: onLike,
                ),
              ],
            ),
          ),

          // Overlapping Avatar
          Positioned(
            left: 18,
            bottom: 4,
            child: _buildAvatar(context),
          ),

          // Industry Pill
          Positioned(
            right: 18,
            bottom: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: AppTheme.primary.withOpacity(0.2),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.storefront_outlined,
                    size: 15,
                    color: AppTheme.primary,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    entrepreneur.industry,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Circular Profile Avatar with fallback
  Widget _buildAvatar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 3.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(44),
        child: Image.network(
          entrepreneur.imageUrl,
          width: 82,
          height: 82,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: 82,
              height: 82,
              color: AppTheme.secondary,
              alignment: Alignment.center,
              child: Text(
                entrepreneur.name.isNotEmpty ? entrepreneur.name[0] : 'W',
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  /// 2. Entrepreneur Name, Role, Location, Follower counts
  Widget _buildTitleRow(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                entrepreneur.name,
                style: const TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textDark,
                ),
              ),
            ),
            const Icon(Icons.verified, color: AppTheme.primary, size: 20),
          ],
        ),
        const SizedBox(height: 3),
        Text(
          '${entrepreneur.designation} • ${entrepreneur.businessName}',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppTheme.primary,
          ),
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            const Icon(Icons.location_on_outlined,
                size: 14, color: AppTheme.textSecondary),
            const SizedBox(width: 4),
            Text(
              entrepreneur.location,
              style: const TextStyle(fontSize: 12, color: AppTheme.textSecondary),
            ),
            const SizedBox(width: 12),
            const Icon(Icons.calendar_today_outlined,
                size: 13, color: AppTheme.textSecondary),
            const SizedBox(width: 4),
            Text(
              'Est. ${entrepreneur.yearEstablished}',
              style: const TextStyle(fontSize: 12, color: AppTheme.textSecondary),
            ),
            const Spacer(),
            // Live Likes & Followers Counter
            Text(
              '${entrepreneur.followersCount} followers • ${entrepreneur.likesCount} likes',
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: AppTheme.textSecondary,
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// 3. About Me Section
  Widget _buildBioSection(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: AppTheme.background,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.person_outline, size: 16, color: AppTheme.primary),
              SizedBox(width: 6),
              Text(
                'About Me & Entrepreneurial Journey',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textDark,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            entrepreneur.aboutMe,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12.5,
              height: 1.45,
              color: AppTheme.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  /// 4. Business Snippet (Mission & Top Achievement)
  Widget _buildBusinessSnippet(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppTheme.secondary.withOpacity(0.35),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.lightbulb_outline, size: 16, color: AppTheme.accent),
              const SizedBox(width: 6),
              Text(
                'Mission: ${entrepreneur.businessName}',
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textDark,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            entrepreneur.missionStatement,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12,
              height: 1.35,
              color: AppTheme.textSecondary,
            ),
          ),
          if (entrepreneur.keyAchievements.isNotEmpty) ...[
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.emoji_events, size: 15, color: Color(0xFFFFB300)),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    entrepreneur.keyAchievements.first,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 11.5,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.textDark,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  /// 5. Four Statistics Cards
  Widget _buildStatisticsGrid(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final cardWidth = (constraints.maxWidth - 10) / 2;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Business Performance Metrics',
              style: TextStyle(
                fontSize: 13.5,
                fontWeight: FontWeight.bold,
                color: AppTheme.textDark,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                SizedBox(
                  width: cardWidth,
                  child: StatisticCard(
                    icon: Icons.work_history_outlined,
                    value: '${entrepreneur.yearsOfExperience}+ Yrs',
                    label: 'Experience',
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: cardWidth,
                  child: StatisticCard(
                    icon: Icons.groups_outlined,
                    value: '${entrepreneur.employeesCount}',
                    label: 'Employees',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                SizedBox(
                  width: cardWidth,
                  child: StatisticCard(
                    icon: Icons.people_outline,
                    value: '${(entrepreneur.customersServed / 1000).toStringAsFixed(0)}K+',
                    label: 'Customers',
                    iconColor: AppTheme.success,
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: cardWidth,
                  child: StatisticCard(
                    icon: Icons.shopping_bag_outlined,
                    value: '${(entrepreneur.productsSold / 1000).toStringAsFixed(0)}K+',
                    label: 'Products Sold',
                    iconColor: const Color(0xFFFFB300),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  /// 6. Action Buttons requested by student:
  /// Follow, Like, Share, Contact, Partners, Know About Business, View Full Profile
  Widget _buildActionButtons(BuildContext context) {
    return Column(
      children: [
        // Row 1: Follow & Contact
        Row(
          children: [
            // FOLLOW BUTTON
            Expanded(
              child: ElevatedButton.icon(
                onPressed: onFollow,
                icon: Icon(
                  entrepreneur.isFollowing
                      ? Icons.check_circle
                      : Icons.person_add_alt_1,
                  size: 17,
                ),
                label: Text(entrepreneur.isFollowing ? 'Following' : 'Follow'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: entrepreneur.isFollowing
                      ? AppTheme.secondary
                      : AppTheme.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            // CONTACT BUTTON
            Expanded(
              child: OutlinedButton.icon(
                onPressed: onContact,
                icon: const Icon(Icons.mail_outline, size: 17),
                label: const Text('Contact'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppTheme.primary,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  side: const BorderSide(color: AppTheme.primary, width: 1.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),

        // Row 2: Partners & Know About Business
        Row(
          children: [
            // PARTNERS BUTTON
            Expanded(
              child: ElevatedButton.icon(
                onPressed: onPartners,
                icon: const Icon(Icons.handshake_outlined, size: 17),
                label: const Text('Partners'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.accent,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 11),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            // KNOW ABOUT BUSINESS BUTTON
            Expanded(
              child: OutlinedButton.icon(
                onPressed: onKnowBusiness,
                icon: const Icon(Icons.storefront_outlined, size: 17),
                label: const Text('Know Business'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppTheme.textDark,
                  padding: const EdgeInsets.symmetric(vertical: 11),
                  side: BorderSide(color: Colors.grey.shade400, width: 1.2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),

        // Row 3: View Full Profile (CTA)
        SizedBox(
          width: double.infinity,
          child: TextButton.icon(
            onPressed: onViewProfile,
            icon: const Icon(Icons.arrow_forward_rounded, size: 17),
            label: const Text('View Full Profile & Journey'),
            style: TextButton.styleFrom(
              foregroundColor: AppTheme.primary,
              textStyle: const TextStyle(
                fontSize: 13.5,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// 7. Social Media Bar with Like and Share shortcuts
  Widget _buildSocialBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppTheme.background,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Connect & Share:',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppTheme.textSecondary,
            ),
          ),
          Row(
            children: [
              IconButton(
                tooltip: entrepreneur.isFavorite ? 'Unlike' : 'Like',
                icon: Icon(
                  entrepreneur.isFavorite ? Icons.favorite : Icons.favorite_border,
                  size: 19,
                  color: entrepreneur.isFavorite ? AppTheme.accent : AppTheme.primary,
                ),
                onPressed: onLike,
              ),
              IconButton(
                tooltip: 'Share Profile Summary',
                icon: const Icon(Icons.share, size: 18, color: AppTheme.primary),
                onPressed: onShare,
              ),
              SocialLinksRow(
                onLinkedInTap: onLinkedIn ??
                    () => _showSnack(context, 'LinkedIn: ${entrepreneur.linkedInUrl}'),
                onInstagramTap: onInstagram ??
                    () => _showSnack(context, 'Instagram: ${entrepreneur.instagramHandle}'),
                onWebsiteTap: onWebsite ??
                    () => _showSnack(context, 'Website: ${entrepreneur.websiteUrl}'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showSnack(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
