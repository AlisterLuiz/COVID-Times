import 'package:mobile_app/utilities/index.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    ChangeNotifierProvider<ThemeModel>(
      create: (BuildContext context) => ThemeModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    FirebaseDatabase database = new FirebaseDatabase();
    database.setPersistenceEnabled(true);
    database.setPersistenceCacheSizeBytes(10000000);

    DatabaseReference _articleRef = database.reference().child('articles');
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ArticlesProvider>(
          create: (context) => ArticlesProvider(),
        )
      ],
      child: StreamBuilder(
          stream: _articleRef.onValue,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData &&
                !snapshot.hasError &&
                snapshot.data.snapshot.value != null) {
              Map data = snapshot.data.snapshot.value;
              final articles = Provider.of<ArticlesProvider>(context, listen: false);
              int count = 0;
              data.forEach(
                (index, data) {
                  articles
                      .addArticle(Articles.fromJson({"key": index, ...data}));
                  count++;
                },
              );
              return MaterialApp(
                theme: Provider.of<ThemeModel>(context).currentTheme,
                initialRoute: Routes.navigation,
                routes: Routes.routes,
              );
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }
}
