
class ExperienceItem {
  final String company;
  final String role;
  final String location;
  final String duration;
  final List<String> bullets;
  final String logoAsset;

  const ExperienceItem({
    required this.company,
    required this.role,
    required this.location,
    required this.duration,
    required this.bullets,
    required this.logoAsset
  });
}

class ProjectItem {
  final String name;
  final String description;
  final List<String> bullets;
  final String? playStoreUrl;

  const ProjectItem({
    required this.name,
    required this.description,
    required this.bullets,
    this.playStoreUrl,
  });
}

class ResumeData {
  final String name;
  final String tagline;
  final String email;
  final String githubUrl;
  final String? profileImageAsset;
  final String? educationHighlight; // M.Tech info
  final String? educationLogoAsset;
  final List<String> skillsPrimary;
  final List<String> skillsTools;
  final List<String> skillsTech;
  final List<ExperienceItem> experiences;
  final List<ProjectItem> projects;
  final List<String> achievements;

  const ResumeData({
    required this.name,
    required this.tagline,
    required this.email,
    required this.githubUrl,
    this.profileImageAsset,
    this.educationHighlight,
    this.educationLogoAsset,
    required this.skillsPrimary,
    required this.skillsTools,
    required this.skillsTech,
    required this.experiences,
    required this.projects,
    required this.achievements,
  });
}
