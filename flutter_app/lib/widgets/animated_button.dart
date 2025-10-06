import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String label;
  final IconData icon;
  final bool enabled;

  const AnimatedButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
    this.enabled = false,
  });

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return GestureDetector(
      onTapDown: widget.enabled
          ? (_) => setState(() => _isPressed = true)
          : null,
      onTapUp: widget.enabled
          ? (_) {
              setState(() => _isPressed = false);
              widget.onPressed();
            }
          : null,
      onTapCancel: widget.enabled
          ? () => setState(() => _isPressed = false)
          : null,
      child: Align(
        alignment: Alignment.center,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeInOut,
          height: 50,
          width: _isPressed
              ? 0.80 * MediaQuery.of(context).size.width
              : MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: widget.enabled
                ? colors.secondary
                : colors.secondary.withValues(alpha: 0.4),
            borderRadius: BorderRadius.circular(_isPressed ? 5 : 10),
            boxShadow: widget.enabled
                ? [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: _isPressed ? 2 : 8,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : [],
          ),
          child: AnimatedOpacity(
            opacity: widget.enabled ? (_isPressed ? 0.7 : 1.0) : 0.5,
            duration: const Duration(milliseconds: 200),
            child: Center(
              child: Opacity(
                opacity: widget.enabled ? 1.0 : 0.6,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.label,
                      style: TextStyle(
                        color: colors.surface,
                        fontSize: 20,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Icon(widget.icon, color: colors.surface, size: 22),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
