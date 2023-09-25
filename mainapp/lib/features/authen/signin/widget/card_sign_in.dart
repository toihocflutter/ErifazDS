import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ui_ux_pet/constants/app_dimens.dart';

import '../../../../common/widget/common_view.dart';

class CardSignIn extends StatelessWidget {
  const CardSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.only(
          left: AppDimens.spaceLarge, right: AppDimens.spaceLarge),
      child: Card(
          color: Colors.white.withOpacity(0.8),
          child: Padding(
            padding: const EdgeInsets.only(
                left: AppDimens.spaceMedium,
                right: AppDimens.spaceMedium,
                top: AppDimens.spaceSmall,
                bottom: AppDimens.spaceSmall),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                    decoration: InputDecoration(
                  border: const UnderlineInputBorder(),
                  labelText: appLocalizations.input_name_label,
                )),
                const SizedBox(height: AppDimens.spaceXSmall),
                TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: const UnderlineInputBorder(),
                      labelText: appLocalizations.input_name_password,
                    )),
                const SizedBox(height: AppDimens.spaceXSmall),
                SizedBox(
                  width: double.infinity,
                  child: BookingButton(
                    label: appLocalizations.sign_in,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
