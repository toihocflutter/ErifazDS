import 'package:erifaz_ds/components/status_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_ux_pet/common/widget/loading_view.dart';
import 'package:ui_ux_pet/features/authen/repository/authen_repository.dart';
import 'package:ui_ux_pet/features/authen/repository/authen_repository_impl.dart';
import 'package:ui_ux_pet/features/main/bloc/booking_app_bloc.dart';
import 'package:ui_ux_pet/features/main/bloc/booking_app_event.dart';

import '../../config/app_config.dart';
import '../authen/screen/sign_in_screen.dart';
import '../home/screen/home_screen.dart';
import 'bloc/booking_app_state.dart';

class BookingLunchApp extends StatefulWidget {
  BookingLunchApp({super.key});

  @override
  State<BookingLunchApp> createState() => _BookingLunchAppState();
}

class _BookingLunchAppState extends State<BookingLunchApp> {
  AuthenRepository authenRepository = AuthenRepositoryImpl();
  late BookingAppBloc bookingBloc;

  @override
  void initState() {
    super.initState();
    bookingBloc = BookingAppBloc(authenRepository: authenRepository)
      ..add(const GetBookingAppState());
  }

  @override
  Widget build(BuildContext context) {
    String title = AppConfig.of(context)?.appName ?? "";
    ThemeData themeData = AppConfig.of(context)?.themeData ??
        ThemeData(
          fontFamily: "NoiGrotesk",
        );

    return MaterialApp(
      title: title,
      theme: themeData,
      home: RepositoryProvider(
        create: (context) => authenRepository,
        child: BlocProvider(
          create: (_) => bookingBloc,
          child: BlocBuilder<BookingAppBloc, BookingAppState>(
              buildWhen: (previousState, state) {
            return previousState != state;
          }, builder: (context, state) {
            if (state.status == BookingAppStatus.guest) {
              return SignInScreen();
            }
            if (state.status == BookingAppStatus.signIn) {
              return HomeScreen();
            }
            return const LoadingView();
          }),
        ),
      ),
    );
  }
}

class DesignSystemShowCaseScreen extends StatelessWidget {
  const DesignSystemShowCaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
      children: [
        SizedBox(height: 50),
        StatusLabel(
          label: "Status Label",
        ),
        SizedBox(height: 10),
        StatusLabel(
          label: "Status Label",
          color: StatusLabelColor.blue,
        ),
        SizedBox(height: 10),
        StatusLabel(
          label: "Status Label",
          color: StatusLabelColor.green,
        ),
        SizedBox(height: 10),
        StatusLabel(
          label: "Status Label",
          color: StatusLabelColor.yellow,
        ),
      ],
    ));
  }
}
