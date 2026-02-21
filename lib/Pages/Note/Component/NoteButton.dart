import 'package:flutter/material.dart';

class NoteBTN extends StatelessWidget {
  const NoteBTN({
    Key? key,
    this.text,
    this.icon,
    this.onpress,
    this.color,
    this.isedit = false,
  }) : super(key: key);

  final bool isedit;
  final String? text;
  final IconData? icon;
  final VoidCallback? onpress;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width / 2,
        child: ElevatedButton(
          onPressed: isedit ? onpress : null,
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.disabled)) {
                  return Colors.grey[300];
                }
                return color;
              },
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white,
              ),
              Text(
                text ?? '',
                style: const TextStyle(color: Colors.white),
              )
            ],
          ),
        ));
  }
}
