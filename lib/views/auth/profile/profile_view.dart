import 'package:flutter/material.dart';

import '../../../widgets/custom_appbar.dart';
// import '../../widgets/custom_container.dart';
import '../../../widgets/scaffold_wrapper.dart';
import '../../../widgets/cached_image.dart';
import '../settings/settings_view.dart';
import '../sign_in/sign_in_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      appBar: CustomAppBar(
        context: context,
        title: "Profile",
        widget: PopupMenuButton(
          onSelected: (result) {
            if (result == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignInView(),
                ),
              );
            } else if (result == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsView(),
                ),
              );
            }
          },
          itemBuilder: (cnx) => [
            const PopupMenuItem(
              value: 0,
              child: Text("Settings"),
            ),
            const PopupMenuItem(
              value: 1,
              child: Text("Sign Out"),
            ),
          ],
          icon: const Icon(Icons.more_vert),
        ),
      ),
      child: ListView(
        children: [
          const SizedBox(
            height: 16,
          ),
          Container(
            alignment: Alignment.center,
            child: CachedNetworkImageWidget(
              imageUrl:
                  "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
              imageBuilder: (context, imageProvider) => CircleAvatar(
                radius: 40,
                backgroundImage: imageProvider,
              ),
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const SizedBox(
                height: 90,
                child: Icon(Icons.error),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'UserName',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: Colors.grey[300],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'user@email.com',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: Colors.grey[300],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '+123456789',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
