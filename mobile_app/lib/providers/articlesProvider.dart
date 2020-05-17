import 'package:mobile_app/utilities/index.dart';

class ArticlesProvider extends ChangeNotifier {
  final List<Articles> _articles = [];

  addArticle(Articles article) {
    _articles.add(article);
    notifyListeners();
  }

  List<Articles> getArtcle() => _articles;
}
