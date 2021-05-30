import 'package:flutter/material.dart';

class BillSplitter extends StatefulWidget {
  @override
  _BillSplitterState createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> {
  int _tipPercentage = 0;
  int _personCounter = 1;
  double _billAmount = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
      alignment: Alignment.center,
      color: Colors.white,
      child: ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(20.5),
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
                color: Colors.purpleAccent.shade100,
                borderRadius: BorderRadius.circular(12.0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Total per Person",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      color: Colors.purple),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "\$ ${calculateTotalPerPerson(_billAmount, _personCounter, _tipPercentage)}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 34.9,
                        color: Colors.purple),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0),
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: Colors.blueGrey.shade100,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(12.0)),
            child: Column(
              children: [
                TextField(
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  style: TextStyle(color: Colors.grey),
                  decoration: InputDecoration(
                      prefixText: "Bill Amount",
                      prefixIcon: Icon(Icons.attach_money)),
                  onChanged: (String value) {
                    try {
                      _billAmount = double.parse(value);
                    } catch (exception) {
                      _billAmount = 0.0;
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Split",
                        style: TextStyle(color: Colors.grey.shade700)),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (_personCounter > 1) {
                                _personCounter--;
                              }
                            });
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            margin: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.0),
                                color: Colors.purpleAccent.shade100),
                            child: Center(
                              child: Text(
                                "-",
                                style: TextStyle(
                                    color: Colors.purple,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "$_personCounter",
                          style: TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _personCounter++;
                            });
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            margin: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                color: Colors.purpleAccent.shade100,
                                borderRadius: BorderRadius.circular(7.0)),
                            child: Center(
                              child: Text(
                                "+",
                                style: TextStyle(
                                    color: Colors.purple,
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Tip",
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        "\$ ${(calculateTotalTip(_billAmount, _personCounter, _tipPercentage)).toStringAsFixed(2)}",
                        style: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "$_tipPercentage%",
                      style: TextStyle(
                          color: Colors.purple,
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Slider(
                      min: 0,
                      max: 100,
                      activeColor: Colors.purple,
                      inactiveColor: Colors.grey,
                      divisions: 10,
                      value: _tipPercentage.toDouble(),
                      onChanged: (double value) {
                        setState(() {
                          _tipPercentage = value.round();
                        });
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }

  calculateTotalPerPerson(double billAmount, int splitBy, int tipPercentage) {
    var totalPerPerson =
        (calculateTotalTip(billAmount, splitBy, tipPercentage) + billAmount) /
            splitBy;

    return totalPerPerson.toStringAsFixed(2);
  }

  calculateTotalTip(double billAmount, int splitBy, int tipPercentage) {
    double totalTip = 0.0;

    if (billAmount < 0 || billAmount.toString().isEmpty || billAmount == null) {
    } else {
      totalTip = (billAmount * tipPercentage) / 100;
    }

    return totalTip;
  }
}

class Wisdom extends StatefulWidget {
  @override
  _WisdomState createState() => _WisdomState();
}

class _WisdomState extends State<Wisdom> {
  int _index = 0;

  List quotes = ['a', 'b', 'c', 'e'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Container(
                    width: 350,
                    height: 200,
                    margin: EdgeInsets.all(30.0),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(14.5)),
                    child: Center(
                        child: Text(
                      quotes[_index % quotes.length],
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontStyle: FontStyle.italic,
                          fontSize: 16.5),
                    ))),
              ),
            ),
            Divider(
              thickness: 1.3,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: FlatButton.icon(
                onPressed: _showQuote,
                color: Colors.greenAccent.shade700,
                icon: Icon(Icons.wb_sunny),
                label: Text("Inspire Me!!",
                    style: TextStyle(fontSize: 18.8, color: Colors.white)),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  void _showQuote() {
    setState(() {
      _index++;
    });
  }
}

class BizCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Biz Card"),
        centerTitle: true,
      ),
      backgroundColor: Colors.redAccent,
      body: Container(
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [_getCard(), _getAvatar()],
          )),
    );
  }

  Container _getCard() {
    return Container(
      width: 350,
      height: 200,
      margin: EdgeInsets.all(50.0),
      decoration: BoxDecoration(
          color: Colors.pinkAccent, borderRadius: BorderRadius.circular(14.5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Harshit Pathak",
            style: TextStyle(
                fontSize: 20.9,
                fontWeight: FontWeight.w500,
                color: Colors.white),
          ),
          Text("harshitpathak.io"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.person_outline), Text("T: @harshiitpathak")],
          )
        ],
      ),
    );
  }

  _getAvatar() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          border: Border.all(
            color: Colors.redAccent,
            width: 1.2,
          ),
          image: DecorationImage(
              image: NetworkImage("https://picsum.photos/300"),
              fit: BoxFit.cover)),
    );
  }
}

class ScaffoldExample extends StatelessWidget {
  _tapButton() {
    debugPrint("hello there");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Scaffold"),
          centerTitle: true,
          backgroundColor: Colors.amberAccent,
          actions: [
            IconButton(
              icon: Icon(Icons.email),
              onPressed: () => debugPrint("what's up"),
            ),
            IconButton(
              icon: Icon(Icons.alarm),
              onPressed: _tapButton,
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightGreen,
          child: Icon(Icons.all_inclusive),
          onPressed: () => debugPrint("debugging..."),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), title: Text("First")),
            BottomNavigationBarItem(
                icon: Icon(Icons.ac_unit), title: Text("Second")),
            BottomNavigationBarItem(
                icon: Icon(Icons.access_alarm), title: Text("Third"))
          ],
          onTap: (int index) => debugPrint("Tapped Item $index"),
        ),
        backgroundColor: Colors.redAccent.shade100,
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(),
              // InkWell(
              //   child: Text("Tap Me!!",
              //     style: TextStyle(
              //       fontSize: 23.4,
              //     ),),
              //   onTap: () => debugPrint("tapped..."),
              // )
            ],
          ),
        ));
  }
}

class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final snackBar = SnackBar(
          content: Text("Hello Again!!"),
          backgroundColor: Colors.amberAccent.shade700,
        );

        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: Colors.pinkAccent, borderRadius: BorderRadius.circular(8.0)),
        child: Text("Here!"),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.deepOrange,
      child: Center(
        child: Text("Hello Flutter!!!",
            textDirection: TextDirection.ltr,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 23,
              fontStyle: FontStyle.italic,
            )),
      ),
    );
  }
}
