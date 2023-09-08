import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:travellia/core/utils/service_locator.dart';
import 'package:travellia/features/auth/presentation/views/login_view.dart';
import 'package:travellia/features/auth/presentation/views/register_view.dart';
import 'package:travellia/features/favorites/presentation/views/favorite_view.dart';
import 'package:travellia/features/home/data/models/hotel_model/Data.dart';
import 'package:travellia/features/home/data/repos/home_repo_impl.dart';
import 'package:travellia/features/home/presentation/manager/featured_destination_cubit/featured_destination_cubit.dart';
import 'package:travellia/features/home/presentation/views/details_view.dart';
import 'package:travellia/features/home/presentation/views/home_view.dart';
import 'package:travellia/features/home/presentation/views/popular_hotel_destination_view.dart';
import 'package:travellia/features/splash/presentation/views/splash_view.dart';


abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kDetailsViewPath = '/detailsView/:email';
  static const kDetailsViewName = 'detailsView';
  static const kPopularHotelsDestinationView = '/popularHotelsDestinationView';
  static const kFavoriteView= '/favoriteView';
  static const kLoginView ='/loginView';
  static const kRegisterView ='/registerView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) =>  HomeView(email: state.extra as String),
      ),
      GoRoute(
        path: kDetailsViewPath,
        name: kDetailsViewName,
        builder: (context, state) =>
            BlocProvider(
              create: (context) => FeaturedDestinationCubit(getIt.get<HomeRepoImplement>()),
              child: HotelDetailsView(
                hotel: state.extra as Data,
                email: state.pathParameters['email'] as String,
              ),
            ),
      ),
      GoRoute(
        path: kPopularHotelsDestinationView,
        builder: (context,state)=>  PopularHotelDestinationView(email: state.extra as String,),
      ),
      GoRoute(
        path: kFavoriteView,
        builder: (context,state)=>  FavoriteView(email: state.extra as String),
      ),
      GoRoute(
        path: kLoginView,
        builder: (context,state)=> const LoginView(),
      ),
      GoRoute(
        path: kRegisterView,
        builder: (context,state)=> const RegisterView(),
      )

    ],
  );
}