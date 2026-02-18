import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:immverse/repositories/chat_repository.dart';
import 'package:immverse/viewmodels/auth_viewmodel.dart';
import 'package:immverse/viewmodels/channel_viewmodel.dart';
import 'package:immverse/viewmodels/dm_viewmodel.dart';
import 'package:immverse/views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final chatRepository = ChatRepository();

    return MultiProvider(
      providers: [

        ChangeNotifierProvider(create: (_) => AuthViewModel()),


        ChangeNotifierProvider(
          create: (_) => ChannelViewModel(chatRepository),
        ),


        ChangeNotifierProvider(
          create: (_) => DmViewModel(chatRepository),
        ),
      ],
      child: MaterialApp(
        title: 'AppChat',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
