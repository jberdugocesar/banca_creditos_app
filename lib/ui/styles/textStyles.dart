import 'package:flutter/material.dart';

class DefaultTextWidget extends StatelessWidget {
  final String text;
  final String hintText;
  const DefaultTextWidget(this.text, this.hintText, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 327,
      height: 71,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Text(
              text,
              style: const TextStyle(
                color: Color(0xFF808A93),
                fontSize: 14,
                fontFamily: 'Product Sans',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 31,
            child: Container(
              width: 327,
              height: 40,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFFC8D0D9)),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
          ),
          Positioned(
            left: 44,
            top: 43,
            child: Text(
              hintText,
              style: const TextStyle(
                color: Color(0xFFB1B5BB),
                fontSize: 14,
                fontFamily: 'Product Sans',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          ),
          Positioned(
            left: 16,
            top: 43,
            child: Container(
              width: 16,
              height: 16,
              padding:
                  const EdgeInsets.symmetric(horizontal: 2.67, vertical: 2),
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(),
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 2.67),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
