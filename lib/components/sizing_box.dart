import 'package:flutter/material.dart';

class Sbh extends StatelessWidget {
  final double h;
  const Sbh({required this.h, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: h);
  }
}

class Swp extends StatelessWidget {
  final Widget child;
  const Swp({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

class Sbe extends StatelessWidget {
  const Sbe({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}

class Sbw extends StatelessWidget {
  final double w;
  const Sbw({required this.w, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: w);
  }
}
