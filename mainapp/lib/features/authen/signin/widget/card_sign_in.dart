import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ui_ux_pet/constants/app_dimens.dart';
import 'package:ui_ux_pet/features/authen/signin/bloc/signin_bloc.dart';
import 'package:ui_ux_pet/features/authen/signin/bloc/signin_event.dart';
import 'package:ui_ux_pet/features/authen/signin/bloc/signin_state.dart';
import 'package:ui_ux_pet/features/authen/signin/util.dart';

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
          child: const Padding(
            padding: EdgeInsets.only(
                left: AppDimens.spaceMedium,
                right: AppDimens.spaceMedium,
                top: AppDimens.spaceSmall,
                bottom: AppDimens.spaceSmall),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                UsernameInput(),
                SizedBox(height: AppDimens.spaceXSmall),
                PasswordInput(),
                SizedBox(height: AppDimens.spaceXSmall),
                SignInButton()
              ],
            ),
          )),
    );
  }
}

class UsernameInput extends StatelessWidget {
  const UsernameInput({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
      return TextFormField(
          onChanged: (text) =>
              {context.read<SignInBloc>().add(SignInUsernameChanged(text))},
          decoration: InputDecoration(
            border: const UnderlineInputBorder(),
            labelText: appLocalizations.input_name_label,
            errorText: SignInUtil.getErrorMessageUserName(
                state.username.displayError, appLocalizations),
          ));
    });
  }
}

class PasswordInput extends StatelessWidget {
  const PasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
      return TextFormField(
          obscureText: true,
          onChanged: (password) =>
              {context.read<SignInBloc>().add(SignInPasswordChanged(password))},
          decoration: InputDecoration(
            border: const UnderlineInputBorder(),
            labelText: appLocalizations.input_name_password,
            errorText: SignInUtil.getErrorMessagePassword(
                state.password.displayError, appLocalizations),
          ));
    });
  }
}

class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return SizedBox(
      width: double.infinity,
      child: BookingButton(
        label: appLocalizations.sign_in,
        onPressed: () {
          context.read<SignInBloc>().add(SignInSubmitted());
        },
      ),
    );
  }
}
