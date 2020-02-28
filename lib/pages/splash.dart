import 'package:endustry/export.dart';
import 'package:endustry/storage.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  setUp() async {
    await Storage().initDB();
    await Storage().loadDB();
    

    Navigator.pushNamed(context, '/app');
    print('start');
  }

  @override
  void initState() {
    super.initState();
    setUp();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
    );
  }
}
