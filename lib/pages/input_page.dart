import 'package:bmicalculator/components/widgets/bottom_button.dart';
import 'package:bmicalculator/constants/constants.dart';
import 'package:bmicalculator/data/model/calculator_brain.dart';
import 'package:bmicalculator/pages/result_page.dart';
import 'package:bmicalculator/components/widgets/input_page_container.dart';
import 'package:bmicalculator/components/widgets/input_page_icon_button.dart';
import 'package:bmicalculator/components/widgets/input_page_icon_content.dart';
import 'package:flutter/material.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

String get appBarTitle => 'BMI Calculator';

String get femaleText => 'FEMALE';

String get maleText => 'MALE';

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;

  int height = 180;

  int weight = 75;

  int age = 25;

  /* Color maleCardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;

  // male = 1 , female = 2;
   void updateColor(Gender selectedGender) {
    if (selectedGender == Gender.male) {
      if (maleCardColor == inactiveCardColor) {
        maleCardColor = activeCardColor;
        femaleCardColor = inactiveCardColor;
      } else {
        maleCardColor = inactiveCardColor;
      }
    }
    if (selectedGender == Gender.female) {
      if (femaleCardColor == inactiveCardColor) {
        femaleCardColor = activeCardColor;
        maleCardColor = inactiveCardColor;
      } else {
        femaleCardColor = inactiveCardColor;
      }
    } 
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: InputPageCard(
                    onPress: () {
                      setState(() {
                        selectedGender =
                            selectedGender == Gender.male ? null : Gender.male;
                      });
                    },
                    cardChild: IconContent(
                      label: maleText,
                      icon: Icons.male,
                    ),
                    cardColor: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                  ),
                ),
                Expanded(
                  child: InputPageCard(
                    onPress: () {
                      setState(() {
                        selectedGender = selectedGender == Gender.female
                            ? null
                            : Gender.female;
                      });
                    },
                    cardChild: IconContent(
                      icon: Icons.female,
                      label: femaleText,
                    ),
                    cardColor: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: InputPageCard(
                    cardColor: kInactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
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
                            const Text(
                              'Cm',
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.white,
                            thumbColor: const Color(0xffEB1555),
                            overlayColor: const Color(0x29EB1555),
                            thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 15,
                            ),
                            overlayShape: const RoundSliderOverlayShape(
                              overlayRadius: 30,
                            ),
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            min: 120,
                            max: 220,
                            inactiveColor: const Color(0xff8D8E98),
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
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: InputPageCard(
                    cardColor: kInactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
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
                              onPressed: () {
                                setState(() {
                                  if (weight > 0) {
                                    weight--;
                                  }
                                });
                              },
                              icon: Icons.remove,
                            ),
                            const SizedBox(width: 10),
                            RoundIconButton(
                              icon: Icons.add,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: InputPageCard(
                    cardColor: kInactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
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
                              onPressed: () {
                                setState(() {
                                  if (age > 0) {
                                    age--;
                                  }
                                });
                              },
                              icon: Icons.remove,
                            ),
                            const SizedBox(width: 10),
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              icon: Icons.add,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'Calculate',
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(weight: weight, height: height);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: calc.calculateBMI(),
                    interpretation: calc.getInterpretation(),
                    resultText: calc.getResult(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
