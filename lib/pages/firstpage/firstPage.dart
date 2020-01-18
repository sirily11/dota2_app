import 'package:dota2/models/dota_model.dart';
import 'package:dota2/pages/home/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            "assets/backgrounds/bg1.jpg",
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Dota2 Report",
                  style: Theme.of(context)
                      .textTheme
                      .display1
                      .copyWith(fontSize: 50, shadows: [
                    Shadow(
                      color: Colors.purple,
                      blurRadius: 1,
                      offset: Offset(2, 2),
                    )
                  ]).apply(
                    color: Colors.white,
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => ConfirmDialog(),
                    );
                  },
                  child: Text(
                    "Check Your Report",
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text(
                "Powered by www.opendota.com",
                style: TextStyle(color: Colors.white, shadows: [
                  Shadow(
                    color: Colors.black,
                    blurRadius: 1,
                    offset: Offset(1, 1),
                  )
                ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ConfirmDialog extends StatefulWidget {
  const ConfirmDialog({
    Key key,
  }) : super(key: key);

  @override
  _ConfirmDialogState createState() => _ConfirmDialogState();
}

class _ConfirmDialogState extends State<ConfirmDialog> {
  TextEditingController controller = TextEditingController();
  bool withinOneYear = false;

  @override
  Widget build(BuildContext context) {
    DotaModel model = Provider.of(context);
    return AlertDialog(
      title: Text("Your Dota ID"),
      content: Wrap(
        children: <Widget>[
          TextField(
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              WhitelistingTextInputFormatter.digitsOnly
            ],
            decoration: InputDecoration(
              labelText: "SteamID",
              helperText: "Your Dota2 ID on your dota's main screen",
            ),
            controller: controller,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("一年内的数据？"),
              Checkbox(
                value: withinOneYear,
                onChanged: (value) {
                  setState(() {
                    withinOneYear = value;
                  });
                },
              ),
            ],
          )
        ],
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Cancel"),
        ),
        FlatButton(
          onPressed: () {
            if (controller.text.isEmpty) {
              return;
            }
            model.withinOneYear = withinOneYear;
            model.accountID = controller.text;
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => HomePage(),
              ),
            );
          },
          child: Text("OK"),
        )
      ],
    );
  }
}
