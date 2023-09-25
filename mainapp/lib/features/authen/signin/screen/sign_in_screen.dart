import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../constants/app_dimens.dart';
import '../../../../constants/app_images.dart';
import '../widget/card_sign_in.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage(AppImages.backgroundSignIn),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.4),
              BlendMode.srcOver,
            ),
          ),
        ),
      ),
      const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CardSignIn(),
          SizedBox(height: AppDimens.spaceXSmall),
          PrivacyPolicyLinkAndTermsOfService()
        ],
      )
    ]);
  }
}

class PrivacyPolicyLinkAndTermsOfService extends StatelessWidget {
  const PrivacyPolicyLinkAndTermsOfService({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(
          left: AppDimens.spaceXLarge, right: AppDimens.spaceXLarge),
      child: Center(
          child: Text.rich(
        TextSpan(
            text: appLocalizations.agree_statement,
            style: const TextStyle(
                fontSize: AppDimens.fontSize12, color: Colors.white),
            children: <TextSpan>[
              TextSpan(
                  text: appLocalizations.terms_of_service,
                  style: const TextStyle(
                    fontSize: AppDimens.fontSize14,
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = () {}),
              TextSpan(
                  text: ' ${appLocalizations.and} ',
                  style: const TextStyle(
                      fontSize: AppDimens.fontSize12, color: Colors.white),
                  children: <TextSpan>[
                    TextSpan(
                        text: appLocalizations.privacy_policy,
                        style: const TextStyle(
                            fontSize: AppDimens.fontSize14,
                            color: Colors.white,
                            decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()..onTap = () {})
                  ])
            ]),
        textAlign: TextAlign.center,
      )),
    );
  }
}
