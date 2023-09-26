import 'package:erifaz_ds/components/status_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:http/http.dart';
import 'package:ui_ux_pet/common/widget/loading_view.dart';
import 'package:ui_ux_pet/features/authen/signin/repository/service/tetgaa_authen_service.dart';
import 'package:ui_ux_pet/features/main/bloc/booking_app_bloc.dart';
import 'package:ui_ux_pet/features/main/bloc/booking_app_event.dart';

import '../../config/app_config.dart';
import '../../constants/app_theme.dart';
import '../authen/signin/repository/authen_repository.dart';
import '../authen/signin/repository/authen_repository_impl.dart';
import '../authen/signin/screen/sign_in_screen.dart';
import '../home/screen/home_screen.dart';
import 'bloc/booking_app_state.dart';

class BookingLunchApp extends StatefulWidget {
  String baseUrl;

  BookingLunchApp({super.key, required this.baseUrl});

  @override
  State<BookingLunchApp> createState() => _BookingLunchAppState();
}

class _BookingLunchAppState extends State<BookingLunchApp> {
  late TetgaaAuthenService tetgaaAuthenService;
  late AuthenRepository authenRepository;
  late BookingAppBloc bookingBloc;

  @override
  void initState() {
    super.initState();
    tetgaaAuthenService =
        TetgaaAuthenService(baseUrl: widget.baseUrl, httpClient: Client());
    authenRepository =
        AuthenRepositoryImpl(tetgaaAuthenService: tetgaaAuthenService);
    bookingBloc = BookingAppBloc(authenRepository: authenRepository)
      ..add(const GetBookingAppState());
  }

  @override
  Widget build(BuildContext context) {
    String title = AppConfig.of(context)?.appName ?? "";
    ThemeData themeData =
        AppConfig.of(context)?.themeData ?? AppTheme.getAppTheme();

    return MaterialApp(
        title: title,
        theme: themeData,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'), // English
        ],
        home: Scaffold(
          body: RepositoryProvider(
            create: (context) => authenRepository,
            child: BlocProvider(
              create: (_) => bookingBloc,
              child: BlocBuilder<BookingAppBloc, BookingAppState>(
                  buildWhen: (previousState, state) {
                return previousState != state;
              }, builder: (context, state) {
                if (state.status == BookingAppStatus.guest) {
                  return const SignInScreen();
                }
                if (state.status == BookingAppStatus.signIn) {
                  return HomeScreen();
                }
                return const LoadingView();
              }),
            ),
          ),
        ));
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
