// lib/core/models/resume_data.dart
import 'resume_model.dart';

const resumeData = ResumeData(
  name: 'Shubham Bansal',
  tagline: 'Seasoned Mobile App Developer | Flutter • Android • iOS • BLE/IoT',
  email: 'Shubhamaryanbansal02@gmail.com',
  githubUrl: 'https://github.com/ShubhamAryanBansal?tab=repositories',
  profileImageAsset: 'assets/images/profile_image.png',
  educationHighlight: 'M.Tech, BITS Pilani',
  educationLogoAsset: 'assets/images/logos/education/bits_logo.png',
  skillsPrimary: [
    'Dart',
    'Kotlin',
    'Java',
    'Swift',
    'Data Structures & Algorithms',
    'OOP',
  ],
  skillsTools: [
    'Android Studio',
    'Xcode',
    'BitBucket',
    'GitHub',
    'Postman',
    'API Manager Azure',
    'JIRA',
    'Play Store',
    'App Store',
  ],
  skillsTech: [
    'Flutter',
    'Android',
    'iOS',
    'Bluetooth Low Energy (BLE)',
    'IoT',
    'SDK & Plugin Development',
    'REST APIs',
    'Firebase (Firestore, Auth, Remote Config, Crashlytics, Analytics)',
    'Riverpod',
    'Cubit & Bloc',
    'SQLite',
  ],
  experiences: [
    ExperienceItem(
      company: 'TVS Motor Company, Bengaluru',
      role: 'Software Development Engineer II',
      location: 'Bengaluru, India',
      duration: 'Jul 2023 – Present',
      logoAsset: 'assets/images/logos/companies/tvs_logo.png',
      bullets: [
        'Developed custom Bluetooth Low Energy libraries in Android and Swift and integrated them as a Flutter plugin.',
        'Architected, developed, and released TVS HLX Connect for 30+ African countries with secure IoT immobilization, OTA DFU, theft alerts, and localization (5+ languages).',
        'Integrated Flutter-based screens into the flagship TVS Connect native app with a global user base in the millions.',
        'Optimized TRUCHAMP using Feature-First architecture with Riverpod, reducing APK size, fixing memory leaks, modularizing code, and improving test coverage.',
        'Re-architected the APNAA TVS app UI with Material Design and improved BLE connectivity and error handling.',
      ],
    ),
    ExperienceItem(
      company: 'TagBox Solutions, Bengaluru',
      role: 'Software Development Engineer I',
      location: 'Bengaluru, India',
      duration: 'Jun 2021 – Jul 2023',
      logoAsset: 'assets/images/logos/companies/tagbox_logo.jpg',
      bullets: [
        'Worked with CTO, hardware, and business teams on apps for Supply Chain Logistics and Connected Vehicles.',
        'Product owner and lead developer for TagSync (Flutter, BLoC, Clean Architecture) used by 25+ enterprise customers.',
        'Built SmartBike BLE-based native iOS and Android apps used across 5 countries for an automotive OEM.',
        'Re-architected TagLink Android app with Clean Architecture, Material UI, and performant Retrofit + JWT auth.',
        'Implemented Firebase Firestore, Auth, Remote Config, Crashlytics, and Analytics across apps.',
        'Added advanced features: extended background runtime, AES-based encryption, pagination, temperature graphs, push notifications, in-app update, and robust permission handling.',
      ],
    ),
  ],
  projects: [
    ProjectItem(
      name: 'TVS HLX Connect',
      description: 'IoT-enabled fleet and security app for TVS HLX vehicles across Africa.',
      bullets: [
        'Secure BLE pairing, immobilization, theft alerts, and OTA firmware upgrades.',
        'Multi-language support and Flutter plugin powered BLE stack for Android and iOS.',
      ],
      playStoreUrl:
      'https://play.google.com/store/apps/details?id=com.tagbox.smartbike_flutter&hl=en&gl=US',
    ),
    ProjectItem(
      name: 'TVS Connect',
      description: 'Flagship TVS Motor companion app with integrated Flutter screens.',
      bullets: [
        'Hybrid architecture: Flutter modules inside existing native codebase.',
      ],
      playStoreUrl:
      'https://play.google.com/store/apps/details?id=com.tvsm.connect',
    ),
    ProjectItem(
      name: 'TRUCHAMP',
      description: 'Dealer/partner-facing app optimized with Riverpod and modularization.',
      bullets: [
        'Feature-first architecture, performance tuning, and stability improvements.',
      ],
      playStoreUrl:
      'https://play.google.com/store/apps/details?id=com.tvs.tvs_pgm_prod',
    ),
    ProjectItem(
      name: 'APNAA TVS',
      description: '3W-focused app with improved UX and BLE connectivity.',
      bullets: [
        'Material UI redesign and reduced BLE connection time.',
      ],
      playStoreUrl:
      'https://play.google.com/store/apps/details?id=com.tvsm.apnaatvs&hl=en',
    ),
    ProjectItem(
      name: 'Tekation (Flutter)',
      description:
      'Institute app for technical courses, workshops, and demo scheduling, built with DDD + Riverpod.',
      bullets: [
        'End-to-end Flutter app deployed to Play Store and App Store.',
      ],
      playStoreUrl: null,
    ),
  ],
  achievements: [
    'FDP Resource Person certificate at KIET Institute.',
    'Won Spot Award at TagBox for outstanding work and effort.',
    'Winner of Codeathon held by GitHub at Microsoft office.',
    '5-Star in Problem Solving and Java on HackerRank.',
  ],
);
