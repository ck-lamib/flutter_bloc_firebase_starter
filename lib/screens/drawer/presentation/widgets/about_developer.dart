import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc_firebase_starter/utils/constants/urls.dart';
import 'package:flutter_bloc_firebase_starter/utils/helpers/snackbars.dart';
import 'package:flutter_bloc_firebase_starter/utils/helpers/url_helper.dart';
import 'package:flutter_bloc_firebase_starter/utils/routes/asset_routes.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutDeveloper extends StatelessWidget {
  AboutDeveloper({super.key});

  final String about =
      "Hi, my name is Bimal khatri. I'm a tech enthusiast and a passionate developer who likes to write code and experiment with new tech. Beside tech field i like to travel, do sketch, enjoy cycling, stargazing and photography.";

  final List<DeveloperSocialLinksModel> socialMedias = [
    DeveloperSocialLinksModel(
      isIcon: true,
      link: "mailto:${Urls.developerEmail}",
      title: "Developer E-mail",
      displayLink: Urls.developerEmail,
      image: "",
      iconData: Icons.email_outlined,
    ),
    DeveloperSocialLinksModel(
      isIcon: false,
      link: Urls.developerGithubLink,
      title: "Developer Github",
      displayLink: Urls.developerGithubLink,
      image: AssetRoutes.socialRouteGithubImage,
    ),
    DeveloperSocialLinksModel(
      isIcon: false,
      link: Urls.developerLinkedinLink,
      title: "Linkedin",
      displayLink: "Bimal kc",
      image: AssetRoutes.socialRoutelinkedinImage,
    ),
    DeveloperSocialLinksModel(
      isIcon: false,
      link: Urls.developerWebsiteLink,
      title: "Website",
      displayLink: Urls.developerWebsiteLink,
      image: AssetRoutes.socialRoutewebsiteImage,
    ),
    DeveloperSocialLinksModel(
      isIcon: false,
      link: Urls.developerFacebookLink,
      title: "Facebook",
      displayLink: "Bimal Kshetri",
      image: AssetRoutes.socialRoutefacebookImage,
    ),
    DeveloperSocialLinksModel(
        isIcon: false,
        link: Urls.developerInstagramLink,
        title: "Instagram",
        displayLink: "ck.lamib",
        image: AssetRoutes.socialRouteinstagramImage),
    DeveloperSocialLinksModel(
      isIcon: false,
      link: Urls.developerThreadLink,
      title: "Threads",
      displayLink: "Bimal Kshetri",
      image: AssetRoutes.socialRoutethreadImage,
    ),
    DeveloperSocialLinksModel(
      isIcon: false,
      link: Urls.developerTwitterLink,
      title: "𝕏 / Twitter",
      displayLink: "@Bimal",
      image: AssetRoutes.socialRoutetwitterImage,
    ),
    DeveloperSocialLinksModel(
      isIcon: false,
      link: Urls.developerYoutubeLink,
      title: "YouTube",
      displayLink: "@BimirCodes",
      image: AssetRoutes.socialRouteyoutubeImage,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Developer"),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SelectableText(
              about,
            ),
          ),
          for (var item in socialMedias)
            ListTile(
              title: Text(item.title),
              subtitle: Text(item.displayLink),
              trailing: item.isIcon
                  ? Icon(
                      item.iconData,
                    )
                  : item.image.split('.').last == "svg"
                      ? SvgPicture.asset(item.image)
                      : Image.asset(
                          item.image,
                          height: 30,
                          width: 30,
                        ),
              onTap: item.link == ""
                  ? null
                  : () async {
                      try {
                        UrlHelper().launch(
                          item.link,
                          mode: LaunchMode.externalApplication,
                        );
                      } catch (e) {
                        CustomSnackbar.showToastMessage(
                            message: "Sorry cannot open ${item.link}");
                      }
                    },
            ),
        ],
      ),
    );
  }
}

class DeveloperSocialLinksModel {
  String link;
  String title;
  String displayLink;
  String image;
  bool isIcon;
  IconData? iconData;

  DeveloperSocialLinksModel({
    required this.link,
    required this.title,
    required this.displayLink,
    required this.image,
    this.isIcon = false,
    this.iconData,
  });
}
