import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travellia/constants.dart';
import 'package:travellia/core/utils/app_router.dart';
import 'package:travellia/core/utils/service_locator.dart';
import 'package:travellia/features/home/data/repos/home_repo_impl.dart';
import 'package:travellia/features/home/presentation/manager/featured_destination_cubit/featured_destination_cubit.dart';
import 'package:travellia/features/home/presentation/manager/featured_hotel_details_cubit/featured_hotel_details_cubit.dart';

import 'features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'features/auth/presentation/manager/register_cubit/register_cubit.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupServiceLocator();
  runApp(const Travelli());
}

class Travelli extends StatelessWidget {
  const Travelli({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedDestinationCubit(
            getIt.get<HomeRepoImplement>(),
          )..fetchMainDestination(),
        ),
        BlocProvider(create:(context)=>LoginCubit()),
        BlocProvider(create:(context)=>RegisterCubit()),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        theme: ThemeData(
          fontFamily: kGilroyFontFamily,
          scaffoldBackgroundColor: kPrimaryColor,
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}