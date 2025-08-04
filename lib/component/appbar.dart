import 'package:flutter/material.dart';

import '../theme/app_color.dart';

class VotixAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool centerTitle;
  final bool showBackButton;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Gradient? gradient;
  final TextStyle? titleStyle;

  const VotixAppBar({
    super.key,
    required this.title,
    this.centerTitle = true,
    this.showBackButton = true,
    this.actions,
    this.backgroundColor,
    this.gradient,
    this.titleStyle,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final effectiveBackgroundColor =
        backgroundColor ??
        (isDark ? AppColors.darkBackground : AppColors.surface);

    final effectiveTitleStyle =
        titleStyle ??
        Theme.of(context).textTheme.titleLarge?.copyWith(
          color: isDark ? AppColors.textLight : AppColors.textDark,
          fontWeight: FontWeight.w600,
        );

    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
        color: gradient == null ? effectiveBackgroundColor : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: SafeArea(
        bottom: false,
        child: SizedBox(
          height: preferredSize.height,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (showBackButton)
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: isDark ? AppColors.textLight : AppColors.textDark,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                )
              else
                const SizedBox(width: 12),
              Expanded(
                child: Align(
                  alignment:
                      centerTitle ? Alignment.center : Alignment.centerLeft,
                  child: Text(
                    title,
                    style: effectiveTitleStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              if (actions != null)
                Row(mainAxisSize: MainAxisSize.min, children: actions!)
              else
                const SizedBox(width: 12),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
