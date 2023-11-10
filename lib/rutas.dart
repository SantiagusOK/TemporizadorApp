import 'package:contador/page1.dart';
import 'package:contador/page2.dart';
import 'package:contador/page3.dart';
import 'package:go_router/go_router.dart';

enum Pages { page1, page2, page3 }

GoRouter rutasPaginas =
    GoRouter(debugLogDiagnostics: true, initialLocation: '/', routes: [
  GoRoute(
      name: Pages.page1.name,
      path: '/',
      builder: (context, state) {
        return const PageOne();
      },
      routes: [
        GoRoute(
          name: Pages.page2.name,
          path: 'pagina2',
          builder: (context, state) {
            return const PageTwo();
          },
        ),
        GoRoute(
          name: Pages.page3.name,
          path: 'pagina3',
          builder: (context, state) {
            return const PageTri();
          },
        ),
      ])
]);
