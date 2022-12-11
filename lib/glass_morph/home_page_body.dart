import 'package:flutter/material.dart';
import 'package:tft_widgets/sidemenu/dto/menu_item/menu_item_dto.dart';
import 'package:tft_widgets/sidemenu/sidemenu_item_widget.dart';

import '../side_menu_item2.dart';

class HomePageBody extends StatelessWidget {
  final void Function()? onEnd, onPressed, onEnd2, onTap;
  final double width;
  final bool isExpanded, isOpen;
  final List<MenuItemModel> topItems, bottomItems;
  final AnimationController? animationController;
  const HomePageBody(
      {super.key,
      this.onEnd,
      required this.width,
      this.onPressed,
      required this.isExpanded,
      required this.isOpen,
      required this.topItems,
      required this.bottomItems,
      this.onEnd2,
      this.onTap,
      this.animationController});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// sidebar widget
        Material(
          elevation: 10,
          shadowColor: Colors.black,
          color: Colors.blueGrey,
          child: AnimatedContainer(
            onEnd: onEnd,
            duration: const Duration(milliseconds: 300),

            /// width of column if open or closed
            width: width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// open close menu button
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey.shade900,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          elevation: 0,
                        ),
                        onPressed: onPressed,
                        child: Row(
                          children: [
                            /// animates child icon widget
                            AnimatedSwitcher(
                              duration: const Duration(milliseconds: 500),
                              transitionBuilder: (child, anim) =>
                                  RotationTransition(
                                turns: child.key == const ValueKey('menu_open')
                                    ? Tween<double>(begin: 1, end: 0)
                                        .animate(anim)
                                    : Tween<double>(begin: 0.75, end: 1)
                                        .animate(anim),
                                child:
                                    ScaleTransition(scale: anim, child: child),
                              ),
                              child: isExpanded
                                  ? const Icon(
                                      Icons.menu_open,
                                      size: 24,
                                      key: ValueKey(
                                        'menu_open',
                                      ),
                                    )
                                  : const Icon(
                                      Icons.menu,
                                      size: 24,
                                      key: ValueKey(
                                        'menu',
                                      ),
                                    ),
                            ),
                            isOpen == true
                                ? const SizedBox(
                                    width: 20,
                                  )
                                : Container(),
                            isOpen == true
                                ? Text(
                                    'Menu Menu', //AppTranslation.of(context).menuMenu,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(color: Colors.white),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    /// top items column
                    Column(
                      children: topItems
                          .map(
                            (e) => SideMenuItemWidget(
                              isOpen: isOpen,
                              item: e,
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),

                /// bottom items column
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: bottomItems
                      .map(
                        (e) => SideMenuItemWidget2(
                          isOpen: isOpen,
                          item: e,
                          animationController: animationController,
                        ),
                      )
                      .toList(),
                )
              ],
            ),
          ),
        ),

        /// sidebar right space
        /// https://api.flutter.dev/flutter/widgets/BackdropFilter-class.html
        IgnorePointer(
          ignoring: !isExpanded,
          child: AnimatedContainer(
            onEnd: onEnd2,
            duration: const Duration(milliseconds: 300),
            width: isExpanded
                ? MediaQuery.of(context).size.width - 300
                : MediaQuery.of(context).size.width - 60,
            height: MediaQuery.of(context).size.height,
            color: isExpanded ? Colors.black38 : Colors.transparent,
            child: InkWell(
              onTap: onTap,
            ),
          ),
        ),
      ],
    );
  }
}
