import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tft_widgets/sidemenu/dto/menu_item/menu_item_dto.dart';

class SideMenuItemWidget2 extends StatelessWidget {
  final bool isOpen;
  final MenuItemModel item;
  final AnimationController? animationController;

  const SideMenuItemWidget2({
    Key? key,
    required this.isOpen,
    required this.item,
    this.animationController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    animationController != null ? log('== animation on') : log('message');
    return TextButton(
      style: TextButton.styleFrom(
        surfaceTintColor: Colors.white,
        shadowColor: Colors.white,
        foregroundColor: Colors.white,
      ),
      onPressed: item.onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 10,
        ),
        child: Row(
          children: [
            //  item.isIcon ? Icon(item.icon, size: 24) : item.child,
            animationController != null
                ? AnimatedIcon(
                    icon: AnimatedIcons.play_pause,
                    progress: animationController!,
                  )
                : item.isIcon
                    ? Icon(item.icon, size: 24)
                    : item.child,

            isOpen == true
                ? const SizedBox(
                    width: 20,
                  )
                : Container(),
            isOpen == true
                ? Text(
                    item.title,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Colors.white),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
