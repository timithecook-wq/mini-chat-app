import 'package:flutter/material.dart';
import 'dart:ui';

class Topbar extends StatefulWidget {
  const Topbar({super.key});

  @override
  State<Topbar> createState() => _TopbarState();
}

class _TopbarState extends State<Topbar> {
  bool isSearchEnabled = false;
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 50,
      width: double.infinity,
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(isSearchEnabled ? 20 : 0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: isSearchEnabled ? 12 : 0,
            sigmaY: isSearchEnabled ? 12 : 0,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: isSearchEnabled
                  ? Colors.grey.withValues(alpha: 0.25)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              border: isSearchEnabled
                  ? Border.all(color: Colors.white.withValues(alpha: 0.3))
                  : null,
              boxShadow: isSearchEnabled
                  ? [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ]
                  : [],
            ),
            child: Row(
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    if (isSearchEnabled) {
                      setState(() {
                        isSearchEnabled = false;
                      });
                    } else {
                      setState(() => isSearchEnabled = true);
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isSearchEnabled
                          ? Colors.white.withValues(alpha: 0.25)
                          : colors.surface,
                    ),
                    padding: const EdgeInsets.all(7),
                    child: Icon(
                      isSearchEnabled
                          ? Icons.keyboard_arrow_left
                          : Icons.search,
                      color: isSearchEnabled
                          ? colors.surface
                          : colors.secondary,
                      size: isSearchEnabled ? 26 : 23,
                    ),
                  ),
                ),
                if (isSearchEnabled)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: TextField(
                        autofocus: true,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: "Search chats...",
                          hintStyle: TextStyle(
                            color: Colors.black.withValues(alpha: 0.7),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  )
                else
                  const Spacer(),

                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSearchEnabled
                        ? Colors.white.withValues(alpha: 0.25)
                        : colors.surface,
                  ),
                  padding: const EdgeInsets.all(7),
                  child: Icon(
                    Icons.person_add_alt,
                    size: 21,
                    color: isSearchEnabled ? colors.surface : colors.secondary,
                  ),
                ),
                const SizedBox(width: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
