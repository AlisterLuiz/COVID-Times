import 'package:mobile_app/utilities/index.dart';

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final controller = PageController(
    initialPage: 1,
  );

  Widget build(BuildContext context) {
    final List<Widget> _children = [
      WelcomePage(),
      SearchPage(),
      RankingPage(),
      ProfilePage()
    ];
    return SafeArea(
      child: Scaffold(
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTappedBar,
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Theme.of(context).accentColor,
          backgroundColor: Theme.of(context).cardColor,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.home,
                semanticLabel: 'Welcome Page',
              ),
              title: Text(
                'Home',
                style: kNavigationBarTextStyle,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.search,
                semanticLabel: 'Search News Articles',
              ),
              title: Text(
                'Search',
                style: kNavigationBarTextStyle,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.userShield,
                semanticLabel: 'Ranking News Sources',
              ),
              title: Text(
                'Ranking',
                style: kNavigationBarTextStyle,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.user,
                semanticLabel: 'Profile Page',
              ),
              title: Text(
                'Profile',
                style: kNavigationBarTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
