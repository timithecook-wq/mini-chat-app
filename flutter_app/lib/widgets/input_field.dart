import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final IconData icon;
  final String text;
  final bool obscure;
  final bool showsuffix;
  final ValueChanged<String>? onChanged;
  final bool secondicon;
  final bool seconpicon;

  const InputField({
    super.key,
    required this.icon,
    required this.text,
    this.obscure = false,
    this.showsuffix = false,
    this.onChanged,
    this.secondicon = false,
    this.seconpicon = false,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  late bool _obscure;
  late bool _showicontwo;
  final bool _usernamepicked = true;
  late bool _seconpicon;
  final Passwordmatch = true;

  @override
  void initState() {
    super.initState();
    _showicontwo = widget.secondicon;
    _obscure = widget.obscure;
    _seconpicon = widget.seconpicon;
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      height: 50,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: colors.tertiary,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            children: [
              Icon(widget.icon, color: colors.secondary, size: 28),
              const VerticalDivider(
                width: 10,
                color: Colors.black54,
                thickness: 1,
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        obscureText: _obscure,
                        onChanged: widget.onChanged,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: widget.text,
                          hintStyle: const TextStyle(
                            color: Colors.white54,
                            fontSize: 16,
                          ),
                          suffixIcon: widget.showsuffix
                              ? IconButton(
                                  icon: Icon(
                                    _obscure
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                  onPressed: () =>
                                      setState(() => _obscure = !_obscure),
                                )
                              : null,
                        ),
                      ),
                    ),
                    if (_showicontwo)
                      Align(
                        alignment: Alignment.centerRight,
                        child: Row(
                          children: [
                            VerticalDivider(
                              width: 10,
                              color: Colors.black54,
                              thickness: 1,
                            ),
                            Icon(
                              _usernamepicked ? Icons.close : Icons.check,
                              color: _usernamepicked
                                  ? Colors.red
                                  : Colors.green,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    if (_seconpicon)
                      Align(
                        alignment: Alignment.centerRight,
                        child: Row(
                          children: [
                            VerticalDivider(
                              width: 10,
                              color: Colors.black54,
                              thickness: 1,
                            ),
                            Icon(
                              !Passwordmatch ? Icons.close : Icons.check,
                              color: !Passwordmatch ? Colors.red : Colors.green,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
