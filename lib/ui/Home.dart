import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  final TextEditingController _weightController = new TextEditingController();
  double _finalResult = 0.0;
  String _formatedResult = '';
  String _planet = 'images/pluto.png';


  int radioValue = 0;

  void handleRadioValueChanged(int value) {
    setState(() {
      radioValue = value;
      switch (radioValue) {
        case 0:
          _finalResult = calculateWeight(_weightController.text, 0.06);
          _formatedResult = "Your Weight on Pluto is ${_finalResult.toStringAsFixed(1).toString()} Pounds";
          _planet = 'images/pluto.png';

          break;
        case 1 :
          _finalResult = calculateWeight(_weightController.text, 0.38);
          _formatedResult = "Your Weight on Mars is ${_finalResult.toStringAsFixed(1).toString()} Pounds";
          _planet = 'images/mars.png';
          break;
        case 2 :
          _finalResult = calculateWeight(_weightController.text, 0.91);
          _formatedResult = "Your Weight on Venus is ${_finalResult.toStringAsFixed(1).toString()} Pounds";
          _planet = 'images/venus.png';
      }
    });
  }





  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black38,
        title: new Text('Weight on Planets'),
        centerTitle: true,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
          alignment: Alignment.topCenter,
          child: ListView(
            children: <Widget>[
              new Image.asset(
                "$_planet",
                height: 133.0,
                width: 200.0,
              ),
              //Form and radio Buttons
              new Container(
                  child: Column(
                    children: <Widget>[
                      new TextField(
                        style: new TextStyle(color: Colors.amberAccent),
                        controller: _weightController,
                        keyboardType: TextInputType.number,
                        decoration: new InputDecoration(
                            hintText: 'Weight in Pounds',
                            labelText: 'Your Weight on Earth (in Pound)',
                            icon: new Icon(Icons.person_outline,color:Colors.white)),
                      ),
                      new Padding(padding: new EdgeInsets.all(5.0)),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Radio<int>(
                              activeColor: Colors.green.shade200,
                              value: 0,
                              groupValue: radioValue,
                              onChanged: handleRadioValueChanged),
                          new Text('Pluto',
                              style: new TextStyle(color: Colors.white38)),
                          new Radio<int>(
                              activeColor: Colors.redAccent,
                              value: 1,
                              groupValue: radioValue,
                              onChanged: handleRadioValueChanged),
                          new Text('Mars',
                              style: new TextStyle(color: Colors.white38)),
                          new Radio<int>(
                              value: 2,
                              groupValue: radioValue,
                              activeColor: Colors.orangeAccent,
                              onChanged: handleRadioValueChanged),
                          new Text('Venus',
                              style: new TextStyle(color: Colors.white38)),
                        ],
                      ),
                      new Padding(padding: new EdgeInsets.all(15.5)),
                      new Text('$_formatedResult', style: new TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500))

                    ],
                  )),

            ],
          )),
    );
  }

  double calculateWeight(String weight, double multiplier) {
    if (int
        .parse(weight)
        .toString()
        .isNotEmpty && int.parse(weight) > 0) {
      return int.parse(weight) * multiplier;
    } else {

      return double.parse(weight)*180;
    }

  }

}
