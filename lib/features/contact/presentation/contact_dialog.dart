// lib/features/contact/presentation/contact_dialog.dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/models/resume_model.dart';

Future<void> showContactDialog(BuildContext context, ResumeData resume) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Contact'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SelectableText('Email: ${resume.email}'),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () async {
              final url = Uri.parse('mailto:${resume.email}');
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              }
            },
            icon: const Icon(Icons.email),
            label: const Text('Send Email'),
          ),
          const SizedBox(height: 8),
          OutlinedButton.icon(
            onPressed: () async {
              final url = Uri.parse(resume.githubUrl);
              if (await canLaunchUrl(url)) {
                await launchUrl(url, mode: LaunchMode.externalApplication);
              }
            },
            icon: const Icon(Icons.code),
            label: const Text('View GitHub'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Close'),
        ),
      ],
    ),
  );
}
