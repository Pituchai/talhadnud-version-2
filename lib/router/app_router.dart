import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:talhadnad/model/user_model.dart';
import 'package:talhadnad/src/screen/payment_page.dart';
import 'package:talhadnad/src/screen/pending_payment.dart';
import 'package:talhadnad/src/screen/profilePage_page.dart';
import 'package:talhadnad/src/screen/profile_page.dart';
import 'package:talhadnad/src/screen/reservation_page.dart';
import 'package:talhadnad/src/screen/marketLayout_page.dart';
import 'package:talhadnad/src/screen/error_page.dart';
import 'package:talhadnad/src/screen/landing_page.dart';
import 'package:talhadnad/src/screen/login_page.dart';
import 'package:talhadnad/src/screen/register_page.dart';
import 'package:talhadnad/src/screen/market_page.dart';
import 'package:talhadnad/src/screen/market_product.dart';
import 'package:talhadnad/model/slot.dart';

String? _guardRoute(
    BuildContext context, GoRouterState state, UserModel userModel) {
  if (!userModel.isInitialized) {
    return null;
  }

  final isAuthRoute = state.path == '/login' || state.path == '/register';

  if (!userModel.isLogged && !isAuthRoute) {
    return '/login';
  }

  if (userModel.isLogged && isAuthRoute) {
    return '/';
  }

  return null;
}

GoRouter getRouter(UserModel userModel) {
  return GoRouter(
    initialLocation: '/',
    refreshListenable: userModel,
    errorPageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: const ErrorPage(),
    ),
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        redirect: (context, state) => _guardRoute(context, state, userModel),
        builder: (context, state) => const LandingPage(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        path: '/profile',
        redirect: (context, state) => _guardRoute(context, state, userModel),
        builder: (context, state) {
          return const ProfilePage();
        },
      ),
      GoRoute(
        path: '/payment',
        redirect: (context, state) => _guardRoute(context, state, userModel),
        builder: (context, state) {
          final selectedSlot = state.uri.queryParameters['selectedSlot'] ?? '';
          final selectedDate = state.uri.queryParameters['selectedDate'] ?? '';
          return PaymentPage(selectedSlot: selectedSlot, selectedDate: selectedDate);
        },
      ),
      GoRoute(
        path: '/reservation',
        redirect: (context, state) => _guardRoute(context, state, userModel),
        builder: (context, state) => const ReservationPage(),
      ),
      GoRoute(
        path: '/pending-payment',
        redirect: (context, state) => _guardRoute(context, state, userModel),
        builder: (context, state) => const  PendingPaymentPage (),
      ),
      
      GoRoute(
        path: '/market',
        redirect: (context, state) => _guardRoute(context, state, userModel),
        builder: (context, state) => const LandingPage(),
        routes: [
          GoRoute(
            path: ':id',
            builder: (context, state) {
              final String id = state.pathParameters['id']!;
              return MarketDetailPage(id: id);
            },
            routes: [
              GoRoute(
                path: 'booking',
                builder: (context, state) {
                  final String marketId = state.pathParameters['id']!;
                  return const TheaterSeatBooking();
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}