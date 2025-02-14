import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';


import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? HomePageWidget() : LoginPageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? HomePageWidget() : LoginPageWidget(),
        ),
        FFRoute(
          name: 'ControlPanelPage',
          path: '/controlPanelPage',
          requireAuth: true,
          builder: (context, params) => ControlPanelPageWidget(
            pagename: params.getParam(
              'pagename',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'PropertyOwnerEditProperty',
          path: '/propertyOwnerEditProperty',
          requireAuth: true,
          builder: (context, params) => PropertyOwnerEditPropertyWidget(
            propertyId: params.getParam(
              'propertyId',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['property'],
            ),
          ),
        ),
        FFRoute(
          name: 'ChatScreenPage',
          path: '/chatScreenPage',
          requireAuth: true,
          asyncParams: {
            'conversationDocument':
                getDoc(['conversations'], ConversationsRecord.fromSnapshot),
            'receiverDocument': getDoc(['users'], UsersRecord.fromSnapshot),
          },
          builder: (context, params) => ChatScreenPageWidget(
            conversationDocument: params.getParam(
              'conversationDocument',
              ParamType.Document,
            ),
            receiverDocument: params.getParam(
              'receiverDocument',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'HomePage',
          path: '/homePage',
          requireAuth: true,
          builder: (context, params) => HomePageWidget(),
        ),
        FFRoute(
          name: 'ProfilePage',
          path: '/profilePage',
          requireAuth: true,
          builder: (context, params) => ProfilePageWidget(),
        ),
        FFRoute(
          name: 'loginPage',
          path: '/loginPage',
          builder: (context, params) => LoginPageWidget(),
        ),
        FFRoute(
          name: 'RegistrationPage',
          path: '/registrationPage',
          builder: (context, params) => RegistrationPageWidget(),
        ),
        FFRoute(
          name: 'ForgotPassword',
          path: '/forgotPassword',
          builder: (context, params) => ForgotPasswordWidget(),
        ),
        FFRoute(
          name: 'EditProfilePage',
          path: '/editProfilePage',
          requireAuth: true,
          builder: (context, params) => EditProfilePageWidget(),
        ),
        FFRoute(
          name: 'ConversationPage',
          path: '/conversationPage',
          requireAuth: true,
          builder: (context, params) => ConversationPageWidget(),
        ),
        FFRoute(
          name: 'termsAndConditionsPage',
          path: '/termsAndConditionsPage',
          builder: (context, params) => TermsAndConditionsPageWidget(),
        ),
        FFRoute(
          name: 'supportPage',
          path: '/supportPage',
          builder: (context, params) => SupportPageWidget(),
        ),
        FFRoute(
          name: 'ViewPropertyPage',
          path: '/viewPropertyPage',
          requireAuth: true,
          builder: (context, params) => ViewPropertyPageWidget(
            propertyReference: params.getParam(
              'propertyReference',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['property'],
            ),
          ),
        ),
        FFRoute(
          name: 'PropertyOwnerAddProperty',
          path: '/propertyOwnerAddProperty',
          requireAuth: true,
          builder: (context, params) => PropertyOwnerAddPropertyWidget(),
        ),
        FFRoute(
          name: 'PropertyOwnerApprovedPropertiesList',
          path: '/propertyOwnerApprovedPropertiesList',
          requireAuth: true,
          builder: (context, params) =>
              PropertyOwnerApprovedPropertiesListWidget(),
        ),
        FFRoute(
          name: 'PropertyOwnerControlPanelProperties',
          path: '/propertyOwnerControlPanelProperties',
          requireAuth: true,
          builder: (context, params) =>
              PropertyOwnerControlPanelPropertiesWidget(),
        ),
        FFRoute(
          name: 'PropertyOwnerControlPanelExtraServices',
          path: '/propertyOwnerControlPanelExtraServices',
          requireAuth: true,
          builder: (context, params) =>
              PropertyOwnerControlPanelExtraServicesWidget(),
        ),
        FFRoute(
          name: 'PropertyOwnerAddExtraServicePage',
          path: '/propertyOwnerAddExtraServicePage',
          requireAuth: true,
          builder: (context, params) =>
              PropertyOwnerAddExtraServicePageWidget(),
        ),
        FFRoute(
          name: 'PropertyOwnerEditExtraServicePage',
          path: '/propertyOwnerEditExtraServicePage',
          requireAuth: true,
          builder: (context, params) => PropertyOwnerEditExtraServicePageWidget(
            extraServiceReference: params.getParam(
              'extraServiceReference',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['extraService'],
            ),
          ),
        ),
        FFRoute(
          name: 'PropertyOwnerExtraServicesListPage',
          path: '/propertyOwnerExtraServicesListPage',
          requireAuth: true,
          builder: (context, params) =>
              PropertyOwnerExtraServicesListPageWidget(),
        ),
        FFRoute(
          name: 'PropertyOwnerExtraServicesViewPage',
          path: '/propertyOwnerExtraServicesViewPage',
          requireAuth: true,
          builder: (context, params) =>
              PropertyOwnerExtraServicesViewPageWidget(
            extraServiceReference: params.getParam(
              'extraServiceReference',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['extraService'],
            ),
          ),
        ),
        FFRoute(
          name: 'BookingsControlPanelPage',
          path: '/bookingsControlPanelPage',
          requireAuth: true,
          builder: (context, params) => BookingsControlPanelPageWidget(),
        ),
        FFRoute(
          name: 'PropertyOwnerBookingRequestsPage',
          path: '/propertyOwnerBookingRequestsPage',
          requireAuth: true,
          builder: (context, params) =>
              PropertyOwnerBookingRequestsPageWidget(),
        ),
        FFRoute(
          name: 'PropertyOwnerActiveBookingsPage',
          path: '/propertyOwnerActiveBookingsPage',
          requireAuth: true,
          builder: (context, params) => PropertyOwnerActiveBookingsPageWidget(),
        ),
        FFRoute(
          name: 'PropertyOwnerBookingHistoryPage',
          path: '/propertyOwnerBookingHistoryPage',
          requireAuth: true,
          builder: (context, params) => PropertyOwnerBookingHistoryPageWidget(),
        ),
        FFRoute(
          name: 'PropertyOwnerBookingViewPage',
          path: '/propertyOwnerBookingViewPage',
          requireAuth: true,
          builder: (context, params) => PropertyOwnerBookingViewPageWidget(
            bookingReference: params.getParam(
              'bookingReference',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['booking'],
            ),
          ),
        ),
        FFRoute(
          name: 'CustomerActiveBookingsPage',
          path: '/customerActiveBookingsPage',
          requireAuth: true,
          builder: (context, params) => CustomerActiveBookingsPageWidget(),
        ),
        FFRoute(
          name: 'CustomerBookingHistoryPage',
          path: '/customerBookingHistoryPage',
          requireAuth: true,
          builder: (context, params) => CustomerBookingHistoryPageWidget(),
        ),
        FFRoute(
          name: 'CustomerBookingRequestsPage',
          path: '/customerBookingRequestsPage',
          requireAuth: true,
          builder: (context, params) => CustomerBookingRequestsPageWidget(),
        ),
        FFRoute(
          name: 'CustomerBookingViewPage',
          path: '/customerBookingViewPage',
          requireAuth: true,
          builder: (context, params) => CustomerBookingViewPageWidget(
            bookingReference: params.getParam(
              'bookingReference',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['booking'],
            ),
          ),
        ),
        FFRoute(
          name: 'AdminHome',
          path: '/adminHome',
          builder: (context, params) => AdminHomeWidget(),
        ),
        FFRoute(
          name: 'AdminLogin',
          path: '/adminLogin',
          builder: (context, params) => AdminLoginWidget(),
        ),
        FFRoute(
          name: 'PropertyOwnerPendingPropertiesList',
          path: '/propertyOwnerPendingPropertiesList',
          requireAuth: true,
          builder: (context, params) =>
              PropertyOwnerPendingPropertiesListWidget(),
        ),
        FFRoute(
          name: 'PropertyOwnerRejectedPropertiesList',
          path: '/propertyOwnerRejectedPropertiesList',
          requireAuth: true,
          builder: (context, params) =>
              PropertyOwnerRejectedPropertiesListWidget(),
        ),
        FFRoute(
          name: 'AdminPendingPropertiesPage',
          path: '/adminPendingPropertiesPage',
          builder: (context, params) => AdminPendingPropertiesPageWidget(),
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
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

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

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
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
      (state.allParams.length == 1 &&
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
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
  }) {
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
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/loginPage';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  child: Image.asset(
                    'assets/images/Launcher_Icon.png',
                    fit: BoxFit.contain,
                  ),
                )
              : page;

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

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
