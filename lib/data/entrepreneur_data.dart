import '../models/entrepreneur.dart';

/// Sample entrepreneur data for the SheRise platform.
/// Contains diverse profiles across Technology, Fashion, Education, Healthcare,
/// Agriculture, and Sustainability, with special focus on Ananya Sharma.
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
      // Primary Featured Entrepreneur (Specified in exam requirements: Ananya Sharma)
      Entrepreneur(
        id: 'ananya-sharma',
        name: 'Ananya Sharma',
        designation: 'Founder & CEO',
        businessName: 'GreenGlow',
        industry: 'Sustainability',
        location: 'Hyderabad, India',
        imageUrl:
            'https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?auto=format&fit=crop&w=600&q=80',
        bio:
            'Eco-innovator & social entrepreneur passionate about zero-waste living and rural women empowerment.',
        aboutMe:
            'Ananya Sharma is an eco-innovator passionate about zero-waste living. '
            'After working in clean-tech research, she founded GreenGlow to craft 100% '
            'biodegradable personal care and home essentials. GreenGlow directly empowers '
            'over 85 rural women artisans through dignified employment, fair wages, '
            'and leadership workshops, spearheading UN SDG 5 (Gender Equality) in grassroots India.',
        story:
            'GreenGlow began in a small Hyderabad workshop with three women artisans crafting '
            'natural soap alternatives. Today, GreenGlow operates a zero-waste manufacturing unit '
            'providing living wages, health insurance, and vocational training to over 85 women, '
            'diverting metric tons of single-use plastic while creating financial freedom.',
        missionStatement:
            'To eliminate single-use plastics from daily lifestyles by offering ethically handcrafted, '
            'affordable, and regenerative lifestyle alternatives while financially uplifting women artisans.',
        visionStatement:
            'To build South Asia\'s premier circular economy brand and empower 1,000+ women artisans with '
            'sustainable livelihoods by 2030.',
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
          'Diverted over 120 metric tons of single-use plastic waste from landfills',
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

      // Technology
      Entrepreneur(
        id: 'priya-nair',
        name: 'Priya Nair',
        designation: 'Founder & Chief Architect',
        businessName: 'TechShe AI Solutions',
        industry: 'Technology',
        location: 'Bengaluru, India',
        imageUrl:
            'https://images.unsplash.com/photo-1580489944761-15a19d654956?auto=format&fit=crop&w=600&q=80',
        bio:
            'AI Architect democratizing predictive automation tools for female micro-entrepreneurs.',
        aboutMe:
            'Priya Nair is an artificial intelligence architect dedicated to democratizing AI tools for '
            'women-owned small businesses. TechShe AI provides predictive analytics, smart inventory, '
            'and vernacular chatbots, empowering female micro-entrepreneurs to scale globally.',
        story:
            'Seeing small female-owned businesses struggle with expensive cloud software, Priya built '
            'TechShe AI to deliver lightweight, intuitive mobile automation that understands regional Indian languages.',
        missionStatement:
            'To bridge the digital gender divide by providing accessible, intuitive AI automation '
            'tools tailored for female micro-enterprises.',
        visionStatement:
            'To empower 100,000 women entrepreneurs across emerging economies with next-generation AI literacy.',
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
          'Supported 2,400+ women-led D2C startups in India & SE Asia',
          'Mentored 500+ female engineering graduates through SheCodes AI',
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

      // Fashion
      Entrepreneur(
        id: 'kavita-patel',
        name: 'Kavita Patel',
        designation: 'Creative Director & Co-Founder',
        businessName: 'EcoWeave Atelier',
        industry: 'Fashion',
        location: 'Ahmedabad, India',
        imageUrl:
            'https://images.unsplash.com/photo-1567532939604-b6b5b0db2604?auto=format&fit=crop&w=600&q=80',
        bio:
            'Revitalizing ancestral handloom weaves into global ethical slow-fashion collections.',
        aboutMe:
            'Kavita Patel revitalizes traditional handloom weaving by blending ancestral Indian textile '
            'heritage with contemporary sustainable fashion. She leads a cooperative of master handloom weavers, '
            'of whom 90% are female sole breadwinners.',
        story:
            'EcoWeave unites over 110 rural weaver families. Kavita eliminated middlemen, providing direct runway '
            'and global export channels that multiplied weaver household incomes threefold.',
        missionStatement:
            'Preserving heritage handloom weaves through sustainable slow-fashion collections that provide dignity '
            'and generational prosperity to female craftswomen.',
        visionStatement:
            'Establishing ethical Indian textiles on international runways while preserving zero-carbon craft traditions.',
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
          'Certified Fair Trade Handloom Export Organization',
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

      // Education
      Entrepreneur(
        id: 'sunita-reddy',
        name: 'Sunita Reddy',
        designation: 'Founder & Managing Director',
        businessName: 'EduEmpower Labs',
        industry: 'Education',
        location: 'Chennai, India',
        bio:
            'Pioneering experiential STEM robotics and coding kits for young girls in rural schools.',
        imageUrl:
            'https://images.unsplash.com/photo-1573497019940-1c28c88b4f3e?auto=format&fit=crop&w=600&q=80',
        aboutMe:
            'Sunita Reddy pioneered interactive experiential STEM learning kits and digital vernacular '
            'curricula for girls in rural and semi-urban schools, ensuring equal access to 21st-century robotics, '
            'coding, and science education.',
        story:
            'Starting with 2 government schools in Tamil Nadu, EduEmpower now equips over 340 schools with '
            'hands-on science labs and teacher training modules designed specifically to inspire girls into STEM.',
        missionStatement:
            'Equipping every girl child with practical hands-on STEM skills, critical thinking tools, and '
            'confidence to pursue leadership careers in science and technology.',
        visionStatement:
            'Reaching 1 million young female scholars across governmental schools by 2028.',
        yearEstablished: 2019,
        yearsOfExperience: 11,
        employeesCount: 75,
        customersServed: 95000,
        awardsCount: 6,
        productsSold: 88000,
        products: [
          'GirlsInStem Robotics Starter Kit',
          'Vernacular Science Experiment Kits',
          'Solar Energy DIY Education Lab',
        ],
        keyAchievements: [
          'National Education Innovation Award 2022',
          'Partnered with 340+ schools across 5 southern Indian states',
          'Over 60% female scholars transitioned into collegiate engineering streams',
        ],
        tags: ['EdTech Leader', 'STEM For Girls', 'SDG 4 & 5'],
        email: 'sunita@eduempower.org',
        phone: '+91 94440 12389',
        websiteUrl: 'https://eduempower.org',
        linkedInUrl: 'https://linkedin.com/in/sunitareddy-edu',
        instagramHandle: '@eduempower.labs',
        isFeatured: false,
        isFavorite: false,
        isFollowing: false,
        followersCount: 4200,
        likesCount: 1890,
      ),

      // Healthcare
      Entrepreneur(
        id: 'dr-radhika-sen',
        name: 'Dr. Radhika Sen',
        designation: 'Chief Medical Officer & Co-Founder',
        businessName: 'AarogyaCare Diagnostics',
        industry: 'Healthcare',
        location: 'Pune, India',
        bio:
            'Developing portable point-of-care cervical cancer screening devices for community clinics.',
        imageUrl:
            'https://images.unsplash.com/photo-1594824813511-1936c3427fbf?auto=format&fit=crop&w=600&q=80',
        aboutMe:
            'Dr. Radhika Sen develops affordable, portable point-of-care diagnostic devices designed specifically '
            'for early detection of cervical and breast cancers in resource-constrained community clinics.',
        story:
            'Witnessing delayed diagnoses among rural women, Dr. Radhika designed an AI-augmented screening tool '
            'that community nurses can operate in village health centers, cutting report turnaround from weeks to minutes.',
        missionStatement:
            'Bringing accurate, affordable, and respectful preventive health diagnostics directly to women '
            'at the last mile.',
        visionStatement:
            'Eliminating late-stage diagnosis of treatable feminine health conditions across developing nations.',
        yearEstablished: 2018,
        yearsOfExperience: 14,
        employeesCount: 82,
        customersServed: 140000,
        awardsCount: 7,
        productsSold: 156000,
        products: [
          'Portable Digital Cervical Scanner',
          'Point-of-Care Anemia Strip Kit',
          'Maternal Health Remote Tele-Monitor',
        ],
        keyAchievements: [
          'WHO Public Health Technology Innovation Citation 2023',
          'Successfully screened over 140,000 women across rural Maharashtra & Gujarat',
          'Reduced diagnostic reporting turnaround from 14 days to 45 minutes',
        ],
        tags: ['MedTech', 'Preventive Care', 'Healthcare Access'],
        email: 'radhika@aarogyacare.org',
        phone: '+91 98200 44556',
        websiteUrl: 'https://aarogyacare.org',
        linkedInUrl: 'https://linkedin.com/in/dr-radhikasen',
        instagramHandle: '@aarogyacare.health',
        isFeatured: false,
        isFavorite: false,
        isFollowing: false,
        followersCount: 5100,
        likesCount: 2300,
      ),

      // Agriculture
      Entrepreneur(
        id: 'meera-joshi',
        name: 'Meera Joshi',
        designation: 'Founder & Agronomist',
        businessName: 'AgriGrow Organics',
        industry: 'Agriculture',
        location: 'Nagpur, India',
        bio:
            'Mobilizing female farmer cooperatives into profitable organic regenerative food supply chains.',
        imageUrl:
            'https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=600&q=80',
        aboutMe:
            'Meera Joshi mobilizes collective organic farming and regenerative agriculture practices among '
            'female smallholder farmers, establishing direct farm-to-table supply chains and eliminating predatory middlemen.',
        story:
            'AgriGrow started by organizing 20 female landless agricultural laborers. Today it is a 450-member '
            'cooperative managing certified organic farms and solar-powered cold storage in Vidarbha.',
        missionStatement:
            'Transforming female farm laborers into landholding agri-entrepreneurs through regenerative bio-farming, '
            'cold-chain storage, and direct market linkages.',
        visionStatement:
            'Scaling organic soil health restoration while ensuring 100% financial inclusion for female farmers.',
        yearEstablished: 2021,
        yearsOfExperience: 6,
        employeesCount: 42,
        customersServed: 27000,
        awardsCount: 3,
        productsSold: 94000,
        products: [
          'Cold-Pressed Organic Sesame Oil',
          'Heritage Millets & Multi-Grain Mix',
          'Solar-Dehydrated Organic Spices',
        ],
        keyAchievements: [
          'Krishi Mahila Ratna State Award 2024',
          'Increased average annual household income of 450+ female farmers by 135%',
          'Certified 1,200 acres of zero-chemical regenerative soil farming',
        ],
        tags: ['AgriTech', 'Rural Livelihood', 'Organic Farming'],
        email: 'meera@agrigrow.co.in',
        phone: '+91 94220 55667',
        websiteUrl: 'https://agrigrow.co.in',
        linkedInUrl: 'https://linkedin.com/in/meera-joshi-agri',
        instagramHandle: '@agrigrow.organics',
        isFeatured: false,
        isFavorite: false,
        isFollowing: false,
        followersCount: 2150,
        likesCount: 910,
      ),
    ];
  }
}
