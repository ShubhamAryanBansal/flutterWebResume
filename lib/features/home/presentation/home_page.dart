// lib/features/home/presentation/home_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/models/resume_model.dart';
import '../../../core/providers/resume_provider.dart';
import '../../../core/providers/theme_provider.dart';
import '../../contact/presentation/contact_dialog.dart';
import '../../contact/presentation/sections/achievements_section.dart';
import '../../contact/presentation/sections/experience_section.dart';
import '../../contact/presentation/sections/projects_section.dart';
import '../../contact/presentation/sections/skills_section.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resume = ref.watch(resumeProvider);
    final colorScheme = Theme.of(context).colorScheme;
    final themeMode = ref.watch(themeModeProvider);
    final isDark = themeMode == ThemeMode.dark || 
                   (themeMode == ThemeMode.system && 
                    MediaQuery.of(context).platformBrightness == Brightness.dark);

    return Scaffold(
      appBar: AppBar(
        title: Text(resume.name),
        centerTitle: false,
        actions: [
          // Theme switcher
          IconButton(
            onPressed: () {
              ref.read(themeModeProvider.notifier).toggleTheme();
            },
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return RotationTransition(
                  turns: animation,
                  child: FadeTransition(opacity: animation, child: child),
                );
              },
              child: Icon(
                isDark ? Icons.light_mode : Icons.dark_mode,
                key: ValueKey(isDark),
              ),
            ),
            tooltip: isDark ? 'Switch to Light Mode' : 'Switch to Dark Mode',
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Hero / Intro
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final isNarrow = constraints.maxWidth < 600;
                      
                      if (isNarrow) {
                        return Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(24),
                              child: Image.asset(
                                resume.profileImageAsset!,
                                width: 160,
                                height: 160,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 24),
                            _HeroText(resume: resume),
                          ],
                        );
                      }
                      
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            child: Image.asset(
                              resume.profileImageAsset!,
                              width: 160,
                              height: 160,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 32),
                          Expanded(child: _HeroText(resume: resume)),
                        ],
                      );
                    },
                  ),
                ),

                // Skills Section
                SkillsSection(
                  skillsPrimary: resume.skillsPrimary,
                  skillsTools: resume.skillsTools,
                  skillsTech: resume.skillsTech,
                ),
                
                // Experience Section
                ExperienceSection(experiences: resume.experiences),
                
                // Projects Section
                ProjectsSection(projects: resume.projects),
                
                // Achievements Section
                AchievementsSection(achievements: resume.achievements),

                // Footer with Flutter logo
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Powered by',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(width: 8),
                      FlutterLogo(size: 20),
                      const SizedBox(width: 8),
                      Text(
                        'Flutter',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _HeroText extends StatelessWidget {
  final ResumeData resume;
  
  const _HeroText({required this.resume});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          resume.name,
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          resume.tagline,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 12),
        // Education badge
        if (resume.educationHighlight != null)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (resume.educationLogoAsset != null) ...[
                  Image.asset(
                    resume.educationLogoAsset!,
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(width: 8),
                ],
                Text(
                  resume.educationHighlight!,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
              ],
            ),
          ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 12,
          runSpacing: 8,
          children: [
            ElevatedButton.icon(
              onPressed: () => showContactDialog(context, resume),
              icon: const Icon(Icons.email_outlined, size: 18),
              label: const Text('Contact'),
            ),
            OutlinedButton.icon(
              onPressed: () async {
                final url = Uri.parse(resume.githubUrl);
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                }
              },
              icon: const Icon(Icons.code, size: 18),
              label: const Text('GitHub'),
            ),
          ],
        ),
      ],
    );
  }
}
