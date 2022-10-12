import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:karmalab_assignment/constants/size_constants.dart';
import 'package:karmalab_assignment/controllers/login_controller.dart';
import 'package:karmalab_assignment/services/shared_pref_service.dart';
import 'package:karmalab_assignment/widgets/custom_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  static const routeName = "/home";

  // !! home controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultPadding),
          child: FutureBuilder<Map<String, dynamic>>(
              future: SharedPrefService().getUser(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CupertinoActivityIndicator(),
                  );
                }
                if (snapshot.hasData) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),
                      Text("user id: ${snapshot.data!["user"]}"),
                      const SizedBox(height: 15),
                      Text("email: ${snapshot.data!["email"]}"),
                      const Spacer(),
                      CustomButton(
                        label: "Logout",
                        onTap: () => LoginController().logout(),
                      ),
                      // SizedBox(height: 50),
                    ],
                  );
                } else {
                  return const SizedBox();
                }
              }),
        ),
      ),
    );
  }
}
