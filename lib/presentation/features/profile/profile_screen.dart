import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tplatfom/presentation/common/resources/colors/app_colors.dart';
import 'package:tplatfom/presentation/features/profile/services/profile_services.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final AppLocalizations? locale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkThemeBackground,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Profile'),
            IconButton(
              onPressed: () => ProfileServices().logOut(context),
              icon: Icon(Icons.logout),
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Profile Screen'),
      ),
    );
  }
}
