/// Data model representing a woman entrepreneur, her business details,
/// statistics, achievements, social channels, and interactive engagement states.
class Entrepreneur {
  final String id;
  final String name;
  final String designation;
  final String businessName;
  final String industry; // Technology, Fashion, Education, Healthcare, Agriculture, Sustainability
  final String location;
  final String imageUrl;
  final String aboutMe;
  final String bio;
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
    required this.bio,
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
