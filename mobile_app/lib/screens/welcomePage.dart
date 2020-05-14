import 'package:mobile_app/utilities/index.dart';

class WelcomePage extends StatelessWidget {
  Widget getCases(String title, String cases, String inc, Color color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: color,
          ),
        ),
        Text(
          cases,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700,
            color: color,
          ),
        ),
        (inc != null)
            ? Text(
                '[+$inc]',
                style: TextStyle(fontSize: 16, color: color),
              )
            : Text('')
      ],
    );
  }

  Widget getNews(IconData icon, Color iconColor, String section, String heading,
      String publisher) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: [
                Icon(
                  icon,
                  color: iconColor,
                ),
                SizedBox(width: 10),
                Text(
                  section,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            Text(
              'View More',
              style: TextStyle(
                color: Color(0xffA5A5A5),
                fontSize: 16,
              ),
            ),
          ],
        ),
        Container(
          height: 200.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.all(5.0),
                width: 170.0,
                child: Card(
                  color: Theme.of(context).cardColor,
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 5,
                  child: Column(
                    children: [
                      Image(
                        image: NetworkImage(
                            'https://techcrunch.com/wp-content/uploads/2020/03/GettyImages-1208505324.jpg?w=730&crop=1'),
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              heading,
                              style: TextStyle(fontSize: 14),
                            ),
                            SizedBox(height: 10),
                            Text(
                              publisher,
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xffA5A5A5),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 15.0),
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello John!',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Hope you are safe, here is the latest news.',
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(height: 5),
                    InkWell(
                      onTap: () {
                        Provider.of<ThemeModel>(context, listen: false)
                            .toggleTheme();
                      },
                      child: Icon(
                        Icons.info_outline,
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Wordwide Cases',
                        //${widget.currentUser.email}`
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'Updated: 20 mins ago',
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Theme.of(context).accentColor),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).cardColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        getCases(
                          'Confirmed',
                          '4.26M',
                          '82,591',
                          Color(0xffFFA726),
                        ),
                        getCases(
                          'Recovered',
                          '1.49M',
                          null,
                          Color(0xff7CB342),
                        ),
                        getCases(
                          'Deaths',
                          '292K',
                          '4,261',
                          Color(0xffE53935),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            getNews(FontAwesomeIcons.checkCircle, Color(0xff7CB342),
                'Latest News', 'What is COVID 19 All About?', 'Gulf News'),
            getNews(Icons.warning, Color(0xffFB8C00), 'Fake News',
                'What is COVID 19 All About?', 'Gulf News'),
          ],
        ),
      ),
    );
  }
}
