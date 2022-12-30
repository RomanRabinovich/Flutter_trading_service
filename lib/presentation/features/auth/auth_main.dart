import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tplatfom/presentation/features/auth/sign_in_form.dart';
import 'package:tplatfom/presentation/features/auth/sign_up_form.dart';
import 'package:tplatfom/themes/dark/dark_color_scheme.dart';
import 'package:tplatfom/utils/extensions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AuthMainPage extends StatefulWidget {
  const AuthMainPage({
    Key? key,
    this.initialIndex,
    this.prefs,
  }) : super(key: key);
  final int? initialIndex;
  final SharedPreferences? prefs;

  @override
  _AuthMainPageState createState() => _AuthMainPageState();
}

class _AuthMainPageState extends State<AuthMainPage>
    with TickerProviderStateMixin {
  final List<Widget> _bodytabs = <Widget>[];

  late TabController tabController;

  @override
  void initState() {
    _bodytabs.addAll(<Widget>[
       const SignInForm(),
      const SignUpForm(),
    ]);
    tabController = TabController(
      length: _bodytabs.length,
      vsync: this,
      initialIndex: widget.initialIndex ?? 0,
    );
    tabController.addListener(() => setState(() {
          FocusScope.of(context).unfocus();
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    AppLocalizations? locale = AppLocalizations.of(context);
    return SafeArea(
      child: Stack(
        children: [
          Image.asset(
            "assets/images/login_background.png",
            height: size.height,
            width: size.width,
            fit: BoxFit.cover,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              child: Column(
                children: [
                  tabController.index == 0
                      ? SizedBox(
                          height: size.height * 0.24,
                          child: Container(
                            padding: EdgeInsets.zero,
                            decoration:
                                const BoxDecoration(shape: BoxShape.circle),
                            child: SvgPicture.asset(
                              "assets/images/logo/english_logo.svg",
                              semanticsLabel: '',
                              height: (context.isPortrait
                                      ? size.height
                                      : size.width) *
                                  0.066,
                              fit: BoxFit.contain,
                            ),
                          ),
                        )
                      : SizedBox(
                          height: size.height * 0.16,
                          child: Container(
                            padding: EdgeInsets.zero,
                            decoration:
                                const BoxDecoration(shape: BoxShape.circle),
                            child: SvgPicture.asset(
                              "assets/images/logo/english_logo.svg",
                              semanticsLabel: '',
                              height: (context.isPortrait
                                      ? size.height
                                      : size.width) *
                                  0.066,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                  Expanded(
                    child: DefaultTabController(
                      initialIndex: 0,
                      length: _bodytabs.length,
                      child: Scaffold(
                        backgroundColor: Colors.transparent,
                        body: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                      width: 1, color: darkTabButtonColor)),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              height: (context.isPortrait
                                      ? size.height
                                      : size.width) *
                                  0.05,
                              child: TabBar(
                                indicator: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    4.0,
                                  ),
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primaryVariant,
                                ),
                                padding: const EdgeInsets.all(2),
                                controller: tabController,
                                tabs: [
                                  Tab(
                                    child: Text(
                                      locale!.signIn,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline3!
                                          .copyWith(
                                              fontSize: context.respText(15),
                                              color: Colors.white),
                                    ),
                                  ),
                                  Tab(
                                    child: Text(
                                      locale.signUp,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline3!
                                          .copyWith(
                                              fontSize: context.respText(15),
                                              color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: TabBarView(
                                  controller: tabController,
                                  children: _bodytabs,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
