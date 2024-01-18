import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male;
  int height=180;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  colour: selectedGender == Gender.male ? kActiveCardColour : kInactiveCardColour,
                  onPress:(){ setState(() {
                    selectedGender = Gender.male;
                  });},
                  cardChild: const IconContent(FontAwesomeIcons.mars, 'MALE'),
                ),
              ),
              Expanded(
                  child: ReusableCard(
                colour: selectedGender == Gender.female ? kActiveCardColour : kInactiveCardColour,
                onPress: ()=> setState(() {
                  selectedGender = Gender.female;
                }),
                cardChild: const IconContent(FontAwesomeIcons.venus, 'FEMALE'),
              )),
            ],
          )),
          Expanded(
            child: ReusableCard(
            colour:kActiveCardColour,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('HEIGHT',
                style: labelTextStyle,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children:[
                    Text(
                    height.toString(),
                    style: kNumberTextStyle,
                    ),
                    const Text('cm',
                    style: labelTextStyle),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    thumbColor: const Color(0xFFEB1555),
                    overlayColor: const Color(0x29EB1555),
                    thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: const RoundSliderOverlayShape(overlayRadius: 30.0),
                  ),
                  child: Slider(value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      activeColor: const Color(0xFFEB1555),
                      inactiveColor: const Color(0xFF8D8E98),
                      onChanged: (double newValue) {
                      setState(() {
                        height=newValue.round();
                      });
                      },
                  ),
                ),
              ],
            ),
            )
          ),
          const Expanded(
              child: Row(
            children: [
              Expanded(child:
              ReusableCard(
                colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('WEIGHT',
                    style: labelTextStyle,)
                  ],
                ),
              ),
              ),
              // Expanded(child: ReusableCard(activeCardColour)),
            ],
          )),
          Container(
            color: kBottomContainerColour,
            margin: const EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: 80.0,
            child: const Center(
              child: Text('BMI Calculator',
                  style:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}
