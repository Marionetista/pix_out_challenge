import 'package:flutter/material.dart';

class BalanceWidget extends StatefulWidget {
  const BalanceWidget({
    required this.title,
    super.key,
  });

  final String title;

  @override
  State<BalanceWidget> createState() => _BalanceWidgetState();
}

class _BalanceWidgetState extends State<BalanceWidget> {
  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 7.0),
            child: Text(
              widget.title,
              style: const TextStyle(
                fontSize: 12,
                fontFamily: 'Poppins',
                color: Colors.white,
              ),
            ),
          ),
          const Text(
            'R\$ *********',
            style: TextStyle(
              fontSize: 12,
              fontFamily: 'Poppins',
              color: Colors.white,
            ),
          ),
        ],
      );
}
