import 'package:mobile_app/utilities/index.dart';

class ArticlePage extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String source;
  final String date;
  final String image;
  final String desc;

  ArticlePage(
      {@required this.icon,
      @required this.color,
      @required this.title,
      @required this.source,
      @required this.date,
      @required this.image,
      @required this.desc});

  Widget getReview(
      BuildContext context, IconData icon, Color color, String text) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      child: RaisedButton(
        textColor: Theme.of(context).primaryColor,
        color: color,
        elevation: 4,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.25,
              child: Text(
                text,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).primaryColor,
                  fontSize: 12,
                ),
                maxLines: null,
              ),
            ),
          ],
        ),
        onPressed: () {},
      ),
    );
  }

  Widget build(BuildContext context) {
    List dateFormatted = [
      DateTime.parse(date).hour.toString(),
      DateTime.parse(date).day.toString(),
      kMonthsInYear[DateTime.parse(date).month.toInt()],
      DateTime.parse(date).year.toString()
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 35.0, horizontal: 15.0),
        children: [
          SizedBox(height: 10),
          Row(
            children: [
              Icon(
                icon,
                color: color,
              ),
              SizedBox(width: 10),
              Text(
                (color == Color(0xff7CB342))
                    ? 'Verified News Source'
                    : 'Unverified News Source',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
              maxLines: null,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                source,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xffA5A5A5),
                ),
              ),
              Text(
                '${dateFormatted[0]}:00, ${dateFormatted[1]}th ${dateFormatted[2]} ${dateFormatted[3]}',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xffA5A5A5),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image(
              image: NetworkImage(image),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Text(
              desc,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 16,
              ),
              maxLines: null,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Help us fight fake news',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xffA5A5A5),
            ),
          ),
          SizedBox(height: 5),
          Row(
            children: [
              getReview(context, Icons.thumb_up, Color(0xff7CB342),
                  'This Article Was Helpful!'),
              SizedBox(width: 5),
              getReview(context, Icons.thumb_down, Color(0xffFFA726),
                  'This Article Was Not Helpful!'),
            ],
          )
        ],
      ),
    );
  }
}
