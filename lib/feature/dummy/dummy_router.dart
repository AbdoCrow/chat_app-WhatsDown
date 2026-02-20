import 'package:go_router/go_router.dart';
import 'package:chat_app/feature/dummy/dummy_feature_page.dart';
import 'dummy_route_paths.dart';
import 'dummy_route_names.dart';

final GoRoute dummyRoute = GoRoute(
  path: DummyRoutePaths.dummy,
  name: DummyRouteNames.dummy,
  builder: (context, state) => const DummyFeaturePage(),
);
