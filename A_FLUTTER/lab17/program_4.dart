import '../utils/import_export.dart';

class LayoutOrientationScreen extends StatelessWidget {
  const LayoutOrientationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    if(screenWidth > 1024){
      return MonumentView();
    }
    else if(screenWidth > 740){
      return StudentView();
    }
    else{
      return ProductView();
    }

  }
}

class TabViewScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Container(
          child: Text("This is Tab View Widget Screen"),
          color: Colors.blueGrey,
        ),
      ),
    );
  }
}

class MobileViewScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellowAccent,
      body: Center(
        child: Container(
          child: Text("This is Mobile View Widget Screen"),
          color: Colors.yellowAccent,
        ),
      ),
    );
  }
}

class ViewScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      body: Center(
        child: Container(
          child: Text("This is View Widget Screen"),
          color: Colors.brown,
        ),
      ),
    );
  }
}