import 'package:alleventstask/general_providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BottomTabWrapper extends HookConsumerWidget {
  final Widget? child1, child2, child3;
  const BottomTabWrapper({
    this.child3,
    this.child1,
    this.child2,
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(bottomProvider).selectedBottomMenu.buttonName == 'Category'
        ? child1!
        : ref.watch(bottomProvider).selectedBottomMenu.buttonName ==
                'Date & Time'
            ? child2!
            : child3!;
    // Visibility(
    //   visible:
    //       ref.watch(bottomProvider).selectedBottomMenu.buttonName == 'Category',
    //   replacement: Visibility(
    //     visible: ref.watch(bottomProvider).selectedBottomMenu.buttonName ==
    //         'Date & Time',
    //     replacement: child3!,
    //     child: child2!,
    //   ),
    //   child: child1!,
    // );
  }
}
