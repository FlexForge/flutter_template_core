import 'package:flutter/material.dart';
import 'package:flutter_template_core/core/extensions/ui_extensions.dart';

/// Main Bottom Navigation Bar
class MainNavigationBar extends StatelessWidget {
  const MainNavigationBar({
    required this.selectedIndex,
    required this.onItemTapped,
    super.key,
  });

  final int selectedIndex;
  final void Function(int) onItemTapped;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 99,
      child: BottomAppBar(
        color: context.colors.backgroundSecondary,
        padding: EdgeInsets.zero,
        elevation: 0,
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: context.colors.divider), // Top border
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _navigationBarItems(
                context,
                0,
                'Feed',
                Icons.chat,
              ),
              _navigationBarItems(
                context,
                1,
                'Showcase',
                Icons.style,
              ),
              _navigationBarItems(
                context,
                2,
                'Settings',
                Icons.settings,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navigationBarItems(
    BuildContext context,
    int index,
    String label,
    IconData icon,
  ) {
    bool isSelected(int index) {
      return selectedIndex == index;
    }

    return Expanded(
      child: TextButton(
        onPressed: () => onItemTapped(index),
        style: TextButton.styleFrom(
          tapTargetSize: MaterialTapTargetSize.padded,
          padding: const EdgeInsets.all(8),
          shape: const CircleBorder(),
        ).copyWith(
          // Define the splash color
          overlayColor: WidgetStateProperty.resolveWith<Color?>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return context.colors.backgroundTertiary;
              }
              return null;
            },
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              size: 29,
              icon,
              color: isSelected(index)
                  ? context.colors.foregroundPrimary
                  : context.colors.foregroundSecondary,
              fill: isSelected(index) ? 1 : 0,
              weight: 500,
            ),
            const SizedBox(height: 2),
            Text(
              label,
              maxLines: 1,
              style: context.typography.labelSmall.copyWith(
                color: isSelected(index)
                    ? context.colors.foregroundPrimary
                    : context.colors.foregroundSecondary,
              ),
            ), // Reduced text size
          ],
        ),
      ),
    );
  }
}
