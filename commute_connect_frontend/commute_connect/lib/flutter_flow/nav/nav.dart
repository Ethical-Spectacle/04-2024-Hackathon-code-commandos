import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/index.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  bool showSplashImage = true;

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => const SearchPageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => const SearchPageWidget(),
        ),
        FFRoute(
          name: 'HomePage',
          path: '/homePage',
          builder: (context, params) => const HomePageWidget(),
        ),
        FFRoute(
          name: 'App-Onboarding',
          path: '/appOnboarding',
          builder: (context, params) => const AppOnboardingWidget(),
        ),
        FFRoute(
          name: 'App-Onboarding-2',
          path: '/appOnboarding2',
          builder: (context, params) => const AppOnboarding2Widget(),
        ),
        FFRoute(
          name: 'OTP',
          path: '/otp',
          builder: (context, params) => OtpWidget(
            providedPhoneNumber: params.getParam(
              'providedPhoneNumber',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'UserDetails',
          path: '/userDetails',
          builder: (context, params) => const UserDetailsWidget(),
        ),
        FFRoute(
          name: 'PaymentDetails-0',
          path: '/paymentDetails0',
          builder: (context, params) => const PaymentDetails0Widget(),
        ),
        FFRoute(
          name: 'PaymentDetails-1',
          path: '/paymentDetails1',
          builder: (context, params) => const PaymentDetails1Widget(),
        ),
        FFRoute(
          name: 'TravelPreferences-LandingUI',
          path: '/travelPreferencesLandingUI',
          builder: (context, params) => const TravelPreferencesLandingUIWidget(),
        ),
        FFRoute(
          name: 'UserPreferences',
          path: '/userPreferences',
          builder: (context, params) => const UserPreferencesWidget(),
        ),
        FFRoute(
          name: 'SearchPage',
          path: '/searchPage',
          builder: (context, params) => const SearchPageWidget(),
        ),
        FFRoute(
          name: 'NavigationPage',
          path: '/navigationPage',
          builder: (context, params) => const NavigationPageWidget(),
        ),
        FFRoute(
          name: 'Route',
          path: '/route',
          builder: (context, params) => const RouteWidget(),
        ),
        FFRoute(
          name: 'MapsTest1R',
          path: '/mapsTest1R',
          builder: (context, params) => const MapsTest1RWidget(),
        ),
        FFRoute(
          name: 'transit_1',
          path: '/transit1',
          builder: (context, params) => const Transit1Widget(),
        ),
        FFRoute(
          name: 'transit_2',
          path: '/transit2',
          builder: (context, params) => const Transit2Widget(),
        ),
        FFRoute(
          name: 'transit_3',
          path: '/transit3',
          builder: (context, params) => const Transit3Widget(),
        ),
        FFRoute(
          name: 'transit_4',
          path: '/transit4',
          builder: (context, params) => const Transit4Widget(),
        ),
        FFRoute(
          name: 'MapsTest2Y',
          path: '/mapsTest2Y',
          builder: (context, params) => const MapsTest2YWidget(),
        ),
        FFRoute(
          name: 'MapsTest2G',
          path: '/mapsTest2G',
          builder: (context, params) => const MapsTest2GWidget(),
        ),
        FFRoute(
          name: 'MapsTest2R',
          path: '/mapsTest2R',
          builder: (context, params) => const MapsTest2RWidget(),
        ),
        FFRoute(
          name: 'MapsTest3G',
          path: '/mapsTest3G',
          builder: (context, params) => const MapsTest3GWidget(),
        ),
        FFRoute(
          name: 'MapsTest3R',
          path: '/mapsTest3R',
          builder: (context, params) => const MapsTest3RWidget(),
        ),
        FFRoute(
          name: 'MapsTest3Y',
          path: '/mapsTest3Y',
          builder: (context, params) => const MapsTest3YWidget(),
        ),
        FFRoute(
          name: 'MapsTest4G',
          path: '/mapsTest4G',
          builder: (context, params) => const MapsTest4GWidget(),
        ),
        FFRoute(
          name: 'MapsTest4R',
          path: '/mapsTest4R',
          builder: (context, params) => const MapsTest4RWidget(),
        ),
        FFRoute(
          name: 'MapsTest4Y',
          path: '/mapsTest4Y',
          builder: (context, params) => const MapsTest4YWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
