import 'package:flutter/material.dart';
import '../../../../core/models/resume_model.dart';

class ExperienceSection extends StatelessWidget {
  final List<ExperienceItem> experiences;

  const ExperienceSection({super.key, required this.experiences});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Experience', style: textTheme.headlineSmall),
          const SizedBox(height: 24),
          ...List.generate(experiences.length, (i) {
            final e = experiences[i];
            final isLast = i == experiences.length - 1;
            return _ExperienceCard(
              item: e,
              isLast: isLast,
              index: i,
            );
          }),
        ],
      ),
    );
  }
}

class _ExperienceCard extends StatefulWidget {
  final ExperienceItem item;
  final bool isLast;
  final int index;

  const _ExperienceCard({
    required this.item,
    required this.isLast,
    required this.index,
  });

  @override
  State<_ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<_ExperienceCard>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  bool _isExpanded = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _glowAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.02).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );

    _glowAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.01, 0),
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onHover(bool isHovered) {
    setState(() => _isHovered = isHovered);
    if (isHovered) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: MouseRegion(
        onEnter: (_) => _onHover(true),
        onExit: (_) => _onHover(false),
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return SlideTransition(
              position: _slideAnimation,
              child: Transform.scale(
                scale: _scaleAnimation.value,
                child: Stack(
                  children: [
                    // Animated glow effect
                    if (_isHovered)
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: cs.primary.withOpacity(0.3 * _glowAnimation.value),
                                blurRadius: 20 * _glowAnimation.value,
                                spreadRadius: 2 * _glowAnimation.value,
                              ),
                            ],
                          ),
                        ),
                      ),

                    // Main card
                    Card(
                      elevation: _isHovered ? 8 : 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide(
                          color: _isHovered
                              ? cs.primary.withOpacity(0.5)
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          gradient: _isHovered
                              ? LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    cs.surface,
                                    cs.primaryContainer.withOpacity(0.15),
                                  ],
                                )
                              : null,
                        ),
                        child: Column(
                          children: [
                            // Header section
                            InkWell(
                              onTap: () => setState(() => _isExpanded = !_isExpanded),
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(16),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Row(
                                  children: [
                                    // Company logo with animated container
                                    AnimatedContainer(
                                      duration: const Duration(milliseconds: 300),
                                      width: _isHovered ? 70 : 60,
                                      height: _isHovered ? 70 : 60,
                                      decoration: BoxDecoration(
                                        color: isDark
                                            ? cs.surfaceContainerHighest
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color: _isHovered
                                              ? cs.primary
                                              : cs.outline.withOpacity(0.2),
                                          width: _isHovered ? 2 : 1,
                                        ),
                                        boxShadow: [
                                          if (_isHovered)
                                            BoxShadow(
                                              color: cs.primary.withOpacity(0.2),
                                              blurRadius: 12,
                                              spreadRadius: 2,
                                            ),
                                        ],
                                      ),
                                      padding: const EdgeInsets.all(10),
                                      child: widget.item.logoAsset.isNotEmpty
                                          ? Image.asset(
                                              widget.item.logoAsset,
                                              fit: BoxFit.contain,
                                            )
                                          : Icon(
                                              Icons.business,
                                              color: cs.primary,
                                              size: 30,
                                            ),
                                    ),

                                    const SizedBox(width: 16),

                                    // Company info
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          // Role
                                          AnimatedDefaultTextStyle(
                                            duration: const Duration(milliseconds: 200),
                                            style: textTheme.titleLarge!.copyWith(
                                              fontWeight: FontWeight.w700,
                                              color: _isHovered
                                                  ? cs.primary
                                                  : textTheme.titleLarge!.color,
                                            ),
                                            child: Text(widget.item.role),
                                          ),
                                          const SizedBox(height: 6),

                                          // Company name with icon
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.business_outlined,
                                                size: 16,
                                                color: cs.onSurfaceVariant,
                                              ),
                                              const SizedBox(width: 6),
                                              Expanded(
                                                child: Text(
                                                  widget.item.company,
                                                  style: textTheme.bodyLarge?.copyWith(
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 4),

                                          // Location and duration
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.location_on_outlined,
                                                size: 14,
                                                color: cs.onSurfaceVariant,
                                              ),
                                              const SizedBox(width: 4),
                                              Text(
                                                widget.item.location,
                                                style: textTheme.bodySmall?.copyWith(
                                                  color: cs.onSurfaceVariant,
                                                ),
                                              ),
                                              const SizedBox(width: 12),
                                              Icon(
                                                Icons.calendar_today_outlined,
                                                size: 14,
                                                color: cs.onSurfaceVariant,
                                              ),
                                              const SizedBox(width: 4),
                                              Text(
                                                widget.item.duration,
                                                style: textTheme.bodySmall?.copyWith(
                                                  color: cs.onSurfaceVariant,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),

                                    // Expand/collapse icon
                                    AnimatedRotation(
                                      duration: const Duration(milliseconds: 300),
                                      turns: _isExpanded ? 0.5 : 0,
                                      child: Icon(
                                        Icons.keyboard_arrow_down,
                                        color: cs.primary,
                                        size: 28,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // Expandable content
                            AnimatedSize(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                              child: _isExpanded
                                  ? Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Divider(color: cs.outlineVariant),
                                          const SizedBox(height: 12),
                                          
                                          // Achievements label
                                          Row(
                                            children: [
                                              Container(
                                                padding: const EdgeInsets.symmetric(
                                                  horizontal: 8,
                                                  vertical: 4,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: cs.primaryContainer,
                                                  borderRadius: BorderRadius.circular(6),
                                                ),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Icon(
                                                      Icons.star,
                                                      size: 14,
                                                      color: cs.primary,
                                                    ),
                                                    const SizedBox(width: 4),
                                                    Text(
                                                      'Key Achievements',
                                                      style: textTheme.labelSmall?.copyWith(
                                                        color: cs.onPrimaryContainer,
                                                        fontWeight: FontWeight.w600,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 12),

                                          // Bullets with staggered animation
                                          ...widget.item.bullets.asMap().entries.map(
                                                (entry) {
                                              final index = entry.key;
                                              final bullet = entry.value;
                                              return TweenAnimationBuilder<double>(
                                                duration: Duration(
                                                  milliseconds: 300 + (index * 100),
                                                ),
                                                tween: Tween(
                                                  begin: 0.0,
                                                  end: _isExpanded ? 1.0 : 0.0,
                                                ),
                                                curve: Curves.easeOutCubic,
                                                builder: (context, value, child) {
                                                  return Opacity(
                                                    opacity: value,
                                                    child: Transform.translate(
                                                      offset: Offset(20 * (1 - value), 0),
                                                      child: child,
                                                    ),
                                                  );
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets.only(bottom: 12),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        margin: const EdgeInsets.only(top: 6),
                                                        width: 8,
                                                        height: 8,
                                                        decoration: BoxDecoration(
                                                          gradient: LinearGradient(
                                                            colors: [
                                                              cs.primary,
                                                              cs.secondary,
                                                            ],
                                                          ),
                                                          shape: BoxShape.circle,
                                                        ),
                                                      ),
                                                      const SizedBox(width: 12),
                                                      Expanded(
                                                        child: Text(
                                                          bullet,
                                                          style: textTheme.bodyMedium,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // "Current" badge for first item
                    if (widget.index == 0 && widget.item.duration.contains('Present'))
                      Positioned(
                        top: 12,
                        right: 12,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [cs.primary, cs.secondary],
                            ),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: cs.primary.withOpacity(0.4),
                                blurRadius: 8,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 6,
                                height: 6,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                'CURRENT',
                                style: textTheme.labelSmall?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
