import 'package:flutter/material.dart';
import 'package:tft_localizations/translations/app_translations.dart';
import 'package:tft_widgets/base/base_state.dart';
import 'package:tft_widgets/sidemenu/dto/menu_item/menu_item_dto.dart';

///import 'package:tft_widgets/sidemenu/sidemenu_item_widget.dart';

import '../side_menu_item2.dart';
import 'home_page_body.dart';

class SideMenu2 extends StatefulWidget {
  const SideMenu2({Key? key}) : super(key: key);

  @override
  State<SideMenu2> createState() => _SideMenu2State();
}

class _SideMenu2State extends BaseState<SideMenu2> {
  bool isExpanded = false;
  bool isOpen = false;
  bool isAniamtion = false;
  double overlayHeight = 0;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  Widget buildDesktop(BuildContext context) {
    final List<MenuItemModel> topItems = [
      MenuItemModel(
        icon: Icons.home_outlined,
        title: 'Menu Home', //AppTranslation.of(context).menuHome,
        onPressed: () {},
      ),
      MenuItemModel(
        icon: Icons.add_box_outlined,
        title:
            'Menu New Application', //AppTranslation.of(context).menuNewApplication,
        onPressed: () {},
      ),
      MenuItemModel(
        icon: Icons.view_column_outlined,
        title:
            'Menu View Transactions', //AppTranslation.of(context).menuViewTransactions,
        onPressed: () {},
      ),
    ];

    final List<MenuItemModel> bottomItems = [
      MenuItemModel(
        icon: Icons.notifications_none,
        title:
            'Menu Notifications', //AppTranslation.of(context).menuNotifications,
        onPressed: () {},
      ),
      MenuItemModel(
        icon: Icons.logout,
        title: 'Menu Logout', //AppTranslation.of(context).menuLogout,
        onPressed: () {
          Navigator.of(context).popAndPushNamed('/');
        },
      ),
      MenuItemModel(
        isIcon: false,
        icon: Icons.view_column_outlined,
        title: 'Menu Profile', //AppTranslation.of(context).menuProfile,
        onPressed: () {},
        child: const CircleAvatar(
          radius: 13,
          backgroundImage: AssetImage(
            'lib/images/dl.png',
            package: 'appliation_resources',
          ),
        ),
      ),
    ];

    return HomePageBody(
      onEnd: () {
        setState(() {
          isOpen = isExpanded;
        });
      },
      width: isExpanded == true ? 300 : 60,
      onPressed: () {
        setState(() {
          overlayHeight = MediaQuery.of(context).size.height;
        });
        setState(() {
          /// invert isexpanded
          isExpanded = !isExpanded;

          /// update isopen
          isOpen = isExpanded == true ? isOpen : isExpanded;
        });
        setState(() {
          isAniamtion = !isAniamtion;
          isOpen
              ? _animationController.forward()
              : _animationController.reverse();
        });
      },
      isExpanded: isExpanded,
      isOpen: isOpen,
      topItems: topItems,
      bottomItems: bottomItems,
      onEnd2: () {
        setState(() {
          isExpanded ? null : overlayHeight = 0;
        });
      },
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
    );

    /* Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// sidebar widget
        Material(
          elevation: 10,
          shadowColor: Colors.black,
          color: Colors.blueGrey,
          child: AnimatedContainer(
            onEnd: () {
              setState(() {
                isOpen = isExpanded;
              });
            },
            duration: const Duration(milliseconds: 300),

            /// width of column if open or closed
            width: isExpanded == true ? 300 : 60,
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
                        onPressed: () {
                          setState(() {
                            overlayHeight = MediaQuery.of(context).size.height;
                          });
                          setState(() {
                            /// invert isexpanded
                            isExpanded = !isExpanded;

                            /// update isopen
                            isOpen = isExpanded == true ? isOpen : isExpanded;
                          });
                        },
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
                        (e) => SideMenuItemWidget(
                          isOpen: isOpen,
                          item: e,
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
            onEnd: () {
              setState(() {
                isExpanded ? null : overlayHeight = 0;
              });
            },
            duration: const Duration(milliseconds: 300),
            width: isExpanded
                ? MediaQuery.of(context).size.width - 300
                : MediaQuery.of(context).size.width - 60,
            height: MediaQuery.of(context).size.height,
            color: isExpanded ? Colors.black38 : Colors.transparent,
            child: InkWell(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
            ),
          ),
        ),
      ],
    );
    */
  }

  @override
  Widget buildMobile(BuildContext context) {
    final List<MenuItemModel> topItems = [
      MenuItemModel(
        icon: Icons.home_outlined,
        title: 'Menu Home', //AppTranslation.of(context).menuHome,
        onPressed: () {},
      ),
      MenuItemModel(
        icon: Icons.add_box_outlined,
        title:
            'Menu New Application', //AppTranslation.of(context).menuNewApplication,
        onPressed: () {},
      ),
      MenuItemModel(
        icon: Icons.view_column_outlined,
        title:
            'Menu View Transactions', //AppTranslation.of(context).menuViewTransactions,
        onPressed: () {},
      ),
    ];

    final List<MenuItemModel> bottomItems = [
      MenuItemModel(
        icon: Icons.notifications_none,
        title:
            'Menu Notifications', //AppTranslation.of(context).menuNotifications,
        onPressed: () {},
      ),
      MenuItemModel(
        icon: Icons.logout,
        title: 'Menu Logout', //AppTranslation.of(context).menuLogout,
        onPressed: () {
          Navigator.of(context).popAndPushNamed('/');
        },
      ),
      MenuItemModel(
        isIcon: false,
        icon: Icons.view_column_outlined,
        title: 'Menu Profile', //AppTranslation.of(context).menuProfile,
        onPressed: () {},
        child: const CircleAvatar(
          radius: 13,
          backgroundImage: AssetImage(
            'lib/images/dl.png',
            package: 'appliation_resources',
          ),
        ),
      ),
    ];

    return HomePageBody(
      onEnd: () {
        setState(() {
          isOpen = isExpanded;
        });
      },
      width: isExpanded == true ? 300 : 60,
      onPressed: () {
        setState(() {
          overlayHeight = MediaQuery.of(context).size.height;
        });
        setState(() {
          /// invert isexpanded
          isExpanded = !isExpanded;

          /// update isopen
          isOpen = isExpanded == true ? isOpen : isExpanded;
        });
      },
      isExpanded: isExpanded,
      isOpen: isOpen,
      topItems: topItems,
      bottomItems: bottomItems,
      animationController: _animationController,
      onEnd2: () {
        setState(() {
          isExpanded ? null : overlayHeight = 0;
        });
      },
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
    );
    /*  return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Material(
          elevation: 10,
          shadowColor: Colors.black,
          color: Colors.blueGrey,
          child: AnimatedContainer(
            onEnd: () {
              setState(() {
                isOpen = isExpanded;
              });
            },
            duration: const Duration(milliseconds: 300),
            width: isExpanded == true ? 300 : 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey.shade900,
                          elevation: 0,
                        ),
                        onPressed: () {
                          setState(() {
                            overlayHeight = MediaQuery.of(context).size.height;
                          });
                          setState(() {
                            isExpanded = !isExpanded;
                            isOpen = isExpanded == true ? isOpen : isExpanded;
                          });
                        },
                        child: Row(
                          children: [
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
                                    AppTranslation.of(context).menuMenu,
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: bottomItems
                      .map(
                        (e) => SideMenuItemWidget(
                          isOpen: isOpen,
                          item: e,
                        ),
                      )
                      .toList(),
                )
              ],
            ),
          ),
        ),
        IgnorePointer(
          ignoring: !isExpanded,
          child: AnimatedContainer(
            onEnd: () {
              setState(() {
                isExpanded ? null : overlayHeight = 0;
              });
            },
            duration: const Duration(milliseconds: 300),
            width: isExpanded
                ? MediaQuery.of(context).size.width - 300
                : MediaQuery.of(context).size.width - 60,
            height: MediaQuery.of(context).size.height,
            color: isExpanded ? Colors.black38 : Colors.transparent,
            child: InkWell(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
            ),
          ),
        ),
      ],
    ); */
  }

  @override
  Widget buildTablet(BuildContext context) {
    final List<MenuItemModel> topItems = [
      MenuItemModel(
        icon: Icons.home_outlined,
        title: AppTranslation.of(context).menuHome,
        onPressed: () {},
      ),
      MenuItemModel(
        icon: Icons.add_box_outlined,
        title: AppTranslation.of(context).menuNewApplication,
        onPressed: () {},
      ),
      MenuItemModel(
        icon: Icons.view_column_outlined,
        title: AppTranslation.of(context).menuViewTransactions,
        onPressed: () {},
      ),
    ];

    final List<MenuItemModel> bottomItems = [
      MenuItemModel(
        icon: Icons.notifications_none,
        title: AppTranslation.of(context).menuNotifications,
        onPressed: () {},
      ),
      MenuItemModel(
        icon: Icons.logout,
        title: AppTranslation.of(context).menuLogout,
        onPressed: () {
          Navigator.of(context).popAndPushNamed('/');
        },
      ),
      MenuItemModel(
        isIcon: false,
        icon: Icons.view_column_outlined,
        title: AppTranslation.of(context).menuProfile,
        onPressed: () {},
        child: const CircleAvatar(
          radius: 13,
          backgroundImage: AssetImage(
            'lib/images/dl.png',
            package: 'appliation_resources',
          ),
        ),
      ),
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Material(
          elevation: 10,
          shadowColor: Colors.black,
          color: Colors.blueGrey,
          child: AnimatedContainer(
            onEnd: () {
              setState(() {
                isOpen = isExpanded;
              });
            },
            duration: const Duration(milliseconds: 300),
            width: isExpanded == true ? 300 : 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey.shade900,
                          elevation: 0,
                        ),
                        onPressed: () {
                          setState(() {
                            overlayHeight = MediaQuery.of(context).size.height;
                          });
                          setState(() {
                            isExpanded = !isExpanded;
                            isOpen = isExpanded == true ? isOpen : isExpanded;
                          });
                        },
                        child: Row(
                          children: [
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
                                    AppTranslation.of(context).menuMenu,
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
                    Column(
                      children: topItems
                          .map(
                            (e) => SideMenuItemWidget2(
                              isOpen: isOpen,
                              item: e,
                              //  animationController: _animationController
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: bottomItems
                      .map(
                        (e) => SideMenuItemWidget2(
                          isOpen: isOpen,
                          item: e,
                          animationController: _animationController,
                        ),
                      )
                      .toList(),
                )
              ],
            ),
          ),
        ),
        IgnorePointer(
          ignoring: !isExpanded,
          child: AnimatedContainer(
            onEnd: () {
              setState(() {
                isExpanded ? null : overlayHeight = 0;
              });
            },
            duration: const Duration(milliseconds: 300),
            width: isExpanded
                ? MediaQuery.of(context).size.width - 300
                : MediaQuery.of(context).size.width - 60,
            height: MediaQuery.of(context).size.height,
            color: isExpanded ? Colors.black38 : Colors.transparent,
            child: InkWell(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
