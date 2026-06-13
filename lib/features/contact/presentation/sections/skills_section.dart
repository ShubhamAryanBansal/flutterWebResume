import 'package:flutter/material.dart';

class SkillsSection extends StatelessWidget {
  final List<String> skillsPrimary;
  final List<String> skillsTools;
  final List<String> skillsTech;

  const SkillsSection({
    super.key,
    required this.skillsPrimary,
    required this.skillsTools,
    required this.skillsTech,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Skills', style: textTheme.headlineSmall),
          const SizedBox(height: 16),
          
          // Primary Skills
          _SkillCategory(
            title: 'Languages & Core',
            skills: skillsPrimary,
            color: colorScheme.primary,
          ),
          const SizedBox(height: 16),
          
          // Technologies
          _SkillCategory(
            title: 'Technologies & Frameworks',
            skills: skillsTech,
            color: colorScheme.secondary,
          ),
          const SizedBox(height: 16),
          
          // Tools
          _SkillCategory(
            title: 'Tools & Platforms',
            skills: skillsTools,
            color: colorScheme.tertiary,
          ),
        ],
      ),
    );
  }
}

class _SkillCategory extends StatelessWidget {
  final String title;
  final List<String> skills;
  final Color color;

  const _SkillCategory({
    required this.title,
    required this.skills,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: color,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: skills.map((skill) => _SkillChip(
            label: skill,
            color: color,
          )).toList(),
        ),
      ],
    );
  }
}

class _SkillChip extends StatefulWidget {
  final String label;
  final Color color;

  const _SkillChip({
    required this.label,
    required this.color,
  });

  @override
  State<_SkillChip> createState() => _SkillChipState();
}

class _SkillChipState extends State<_SkillChip> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: _hover 
              ? widget.color.withOpacity(0.15)
              : colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: _hover ? widget.color : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Text(
          widget.label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: _hover ? FontWeight.w600 : FontWeight.w500,
            color: _hover ? widget.color : null,
          ),
        ),
      ),
    );
  }
}
