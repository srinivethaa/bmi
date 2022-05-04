import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusable_card.dart';
import '../components/icon_content.dart';
import '../constants.dart';
import 'results_page.dart';
import '../components/bottom_button.dart';
import '../components/round_icon_button.dart';
import 'package:bmi_demo/services.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMICalculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              genderWidget(
                  Gender.male,
                  FontAwesomeIcons.mars,
                  "Male",
                  selectedGender == Gender.male
                      ? kActiveCardColour
                      : kInactiveCardColour),
              genderWidget(
                  Gender.female,
                  FontAwesomeIcons.venus,
                  "Female",
                  selectedGender == Gender.female
                      ? kActiveCardColour
                      : kInactiveCardColour),
            ],
          )),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Height',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Colors.black12,
                      activeTrackColor: Color(0xFFFFCDD2),
                      thumbColor: Color(0xFFF44336),
                      overlayColor: Color(0x15006064),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Row(
            children: <Widget>[
              weightAgeWidget(
                labelString: "Weight",
              ),
              weightAgeWidget(
                labelString: "Age",
              ),
            ],
          )),
          BottomButton(
            buttonTitle: 'Calculate',
            onTap: () {
              CalculatorBrain calc = CalculatorBrain(
                height: height,
                weight: weight,
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResults(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget genderWidget(
      Gender userInput, IconData icon, String labelText, Color color) {
    return Expanded(
      child: ReusableCard(
          onPress: () {
            setState(() {
              selectedGender = userInput;
            });
          },
          colour: color,
          // selectedGender == Gender.female
          //     ? kActiveCardColour
          //     : kInactiveCardColour,
          cardChild: IconContent(
            icon: icon,
            label: labelText,
          )),
    );
  }

  Widget weightAgeWidget({@required String labelString}) {
    bool isWeight = labelString == "Weight";
    int parameter = isWeight ? weight : age;
    return Expanded(
      child: ReusableCard(
        colour: kActiveCardColour,
        cardChild: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              labelString,
              style: kLabelTextStyle,
            ),
            Text(
              parameter.toString(),
              style: kNumberTextStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RoundIconButton(
                  icon: FontAwesomeIcons.minus,
                  onPressed: () {
                    if (isWeight) {
                      changeWeight(shouldIncrease: false);
                    } else {
                      changeAge(shouldIncrease: false);
                    }
                  },
                ),
                SizedBox(
                  width: 10.0,
                ),
                RoundIconButton(
                  icon: FontAwesomeIcons.plus,
                  onPressed: () {
                    if (isWeight) {
                      changeWeight(shouldIncrease: true);
                    } else {
                      changeAge(shouldIncrease: true);
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  changeWeight({@required bool shouldIncrease}) {
    if (shouldIncrease) {
      setState(() {
        weight++;
      });
    } else {
      setState(() {
        weight--;
      });
    }
  }

  changeAge({@required bool shouldIncrease}) {
    if (shouldIncrease) {
      setState(() {
        age++;
      });
    } else {
      setState(() {
        age--;
      });
    }
  }
}
