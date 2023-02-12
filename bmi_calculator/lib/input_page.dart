import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constans.dart';
import 'result_page.dart';
import 'bottom_button.dart';
import 'bmi_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male;

  int height = 180;
  int weight = 80;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'BMI CALCULATOR',
            ),
          ),
          body: Center(
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: ReusableCard(
                          onPress: () {
                            setState(() {
                              selectedGender = Gender.male;
                            });
                          },
                          colour: selectedGender == Gender.male
                              ? kActiveCardsColour
                              : kInactiveCardsColour,
                          cardChild: IconContent(
                              text: 'MALE', icon: FontAwesomeIcons.mars),
                        ),
                      ),
                      Expanded(
                        child: ReusableCard(
                          onPress: () {
                            setState(() {
                              selectedGender = Gender.female;
                            });
                          },
                          colour: selectedGender == Gender.female
                              ? kActiveCardsColour
                              : kInactiveCardsColour,
                          cardChild: IconContent(
                            text: 'FEMALE',
                            icon: FontAwesomeIcons.venus,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {},
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'HEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(
                              'cm',
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbColor: kBottomContainerColour,
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Color(0xFF8D8E98),
                            overlayColor: Color(0x29EB1555),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30.0),
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            trackHeight: 2.0,
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            },
                            min: 120.0,
                            max: 220.0,
                          ),
                        )
                      ],
                    ),
                    colour: kActiveCardsColour,
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: ReusableCard(
                          onPress: () {},
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'WEIGHT',
                                style: kLabelTextStyle,
                              ),
                              Text(
                                weight.toString(),
                                style: kNumberTextStyle,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.minus,
                                    onPress: () {
                                      setState(() {
                                        if (weight > 0) {
                                          weight--;
                                        }
                                      });
                                    },
                                  ),
                                  SizedBox(width: 10.0),
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.plus,
                                    onPress: () {
                                      setState(() {
                                        weight++;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                          colour: kActiveCardsColour,
                        ),
                      ),
                      Expanded(
                        child: ReusableCard(
                          onPress: () {},
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'AGE',
                                style: kLabelTextStyle,
                              ),
                              Text(
                                age.toString(),
                                style: kNumberTextStyle,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.minus,
                                    onPress: () {
                                      setState(() {
                                        if (age > 0) {
                                          age--;
                                        }
                                      });
                                    },
                                  ),
                                  SizedBox(width: 10.0),
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.plus,
                                    onPress: () {
                                      setState(() {
                                        age++;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                          colour: kActiveCardsColour,
                        ),
                      ),
                    ],
                  ),
                ),
                BottomButton(
                  onPress: () {
                    setState(() {
                      BMIBrain bmiBrain =
                          BMIBrain(height: height, weight: weight);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResultPage(
                                  bmi: bmiBrain.getBMI(),
                                  bmiInterpretation:
                                      bmiBrain.getInterpretation(),
                                  result: bmiBrain.getResult())));
                    });
                  },
                  text: 'CALCULATE',
                ),
              ],
            ),
          )),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function() onPress;

  RoundIconButton({required this.icon, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      elevation: 8.0,
      fillColor: Color(0xFF4c4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      child: Icon(icon),
    );
  }
}
