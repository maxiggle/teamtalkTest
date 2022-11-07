import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teamtalk/features/messages/messages.dart';
import 'package:teamtalk/features/settings/bloc/settings_bloc.dart';
import 'package:teamtalk/features/settings/view/settings_page.dart';
import 'package:teamtalk/services/navigation_service.dart';
import '../router/router.dart' as router;

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MultiBlocProvider(
      providers: [BlocProvider(create: ((context) => SettingsBloc()))],
      child: const MaterialApp(
        title: 'Task App',
        home: Messages(),
      ),
    );
  }
}
