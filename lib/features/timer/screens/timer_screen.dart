// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:whatsapp_ui/screens/mobile_home_screen.dart';
import 'package:whatsapp_ui/screens/mobile_layout_screen.dart';
import 'package:whatsapp_ui/theme/pallete.dart';

class TimerScreen extends StatefulWidget {
  static const routeName = '/timer-screen';
  const TimerScreen({Key? key}) : super(key: key);

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  TextEditingController descriptionTextController = TextEditingController();

  int meterC = 0;
  int countC = 1;
  int cycleC = 1;
  void meterAdd() {
    setState(() {
      meterC += 25;
    });
  }

  void meterRemove() {
    if (meterC > 0) {
      setState(() {
        meterC -= 25;
      });
    }
  }

  void countAdd() {
    setState(() {
      countC += 1;
    });
  }

  void countRemove() {
    if (countC > 0) {
      setState(() {
        countC -= 1;
      });
    }
  }

  void cycleAdd() {
    setState(() {
      cycleC += 10;
    });
  }

  void cycleRemove() {
    if (cycleC > 0) {
      setState(() {
        cycleC -= 10;
      });
    }
  }

  int meter = 0;
  int count = 0;
  int cycle = 0;

  Timer? timer;
  bool _isRunning = false;
  bool _isFive = false;
  int _isFiveCount = 5;

  @override
  void initState() {
    super.initState();
    print('initState');
  }

  @override
  void dispose() {
    super.dispose();
    timer!.cancel();
    print('disPose');
  }

  @override
  Widget build(BuildContext context) {
    print('view load');
    final size = MediaQuery.of(context).size;
    return OnBoardingSlider(
      finishButtonColor: Pallete.appbarColor,
      headerBackgroundColor: Pallete.appbarColor,
      finishButtonText: '??????',
      onFinish: () {
        timer?.cancel();
        Navigator.pushNamed(context, MobileHomeScreen.routeName);
      },
      totalPage: 2,
      background: [
        Image.asset(
          'assets/mool.png',
          fit: BoxFit.contain,
        ),
        Image.asset(
          'assets/mool.png',
          fit: BoxFit.contain,
        ),
      ],
      speed: 2,
      pageBodies: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '????????? ??????',
              style: TextStyle(fontSize: 50),
            ),
            SizedBox(
              width: size.width * 0.7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$meterC ??????',
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                      onPressed: () => meterRemove(),
                      child: Icon(Icons.remove)),
                  ElevatedButton(
                      onPressed: () => meterAdd(), child: Icon(Icons.add)),
                ],
              ),
            ),
            SizedBox(
              width: size.width * 0.7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$countC ??????',
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                      onPressed: () => countRemove(),
                      child: Icon(Icons.remove)),
                  ElevatedButton(
                      onPressed: () => countAdd(), child: Icon(Icons.add)),
                ],
              ),
            ),
            SizedBox(
              width: size.width * 0.5,
              child: SleekCircularSlider(
                appearance: CircularSliderAppearance(
                  infoProperties: InfoProperties(
                    topLabelText: 'Sec',
                  ),
                ),
                min: 1,
                max: 300,
                initialValue: 1,
                onChange: (value) {
                  setState(() {
                    final val = value.toInt();
                    cycleC = val;
                    print('pogress $cycleC');
                  });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: size.width * 0.7,
                  child: TextField(
                    controller: descriptionTextController,
                    decoration: InputDecoration(
                      hintText: '?????? ??????',
                    ),
                    style: TextStyle(fontSize: 40),
                  ),
                ),
              ],
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                '??????????????? ??????????????? ???????????????',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              Text(
                '?????? ??????',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${meterC} ??????',
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    '${countC} ??????',
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    '${cycleC} ???',
                    style: TextStyle(fontSize: 30),
                  ),
                ],
              ),
              Text(
                '?????? ?????? : ${descriptionTextController.text}',
                style: TextStyle(fontSize: 30),
              ),
              Spacer(),
              Spacer(),
              StepProgressIndicator(
                totalSteps: countC,
                currentStep: count,
                size: 36,
                selectedColor: Colors.greenAccent,
                customStep: (index, color, _) => color == Colors.greenAccent
                    ? Container(
                        color: color,
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                      )
                    : Container(
                        color: color,
                        child: Icon(
                          Icons.remove,
                        ),
                      ),
              ),
              Spacer(),
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  CircularStepProgressIndicator(
                    totalSteps: cycleC,
                    currentStep: cycle,
                    stepSize: 10,
                    selectedColor: Colors.greenAccent,
                    unselectedColor: Colors.grey[200],
                    padding: 0,
                    width: size.width * 0.7,
                    height: size.width * 0.7,
                    selectedStepSize: 35,
                    roundedCap: (_, __) => true,
                  ),
                  if (_isFive)
                    SizedBox(
                      width: size.width * 0.8,
                      child: StepProgressIndicator(
                        totalSteps: _isFiveCount,
                        currentStep: 5,
                        size: 40,
                        roundedEdges: Radius.circular(10),
                        selectedColor: Color.fromARGB(255, 255, 0, 0),
                        unselectedColor: Colors.transparent,
                      ),
                    ),
                  Column(
                    children: [
                      Text(
                        '${cycle} / ${cycleC}',
                        style: TextStyle(
                            fontSize: 50,
                            color: Colors.red[500],
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _isRunning = !_isRunning;
                          if (!_isRunning) {
                            setState(() {
                              timer?.cancel();
                            });
                          }

                          if (_isRunning == true) {
                            timer =
                                Timer.periodic(Duration(seconds: 1), (timer) {
                              setState(() {
                                meter = meterC;
                                cycle++;
                                // ?????? 5??????
                                if (cycle > cycleC - 5 && count < countC - 1) {
                                  _isFive = true;
                                  _isFiveCount--;

                                  if (_isFiveCount == 0) {
                                    _isFiveCount = 5;
                                    _isFive = false;
                                  }
                                }
                                if (cycle == cycleC) {
                                  cycle = 0;
                                  count++;
                                  if (count == countC) {
                                    cycle = 0;
                                    count = 0;
                                    meter = 0;
                                    _isRunning = false;
                                    print(_isRunning);
                                    timer.cancel();
                                  }
                                }
                              });
                            });
                          }
                        },
                        child: !_isRunning
                            ? Text(
                                '??????',
                                style: TextStyle(
                                  fontSize: 50,
                                ),
                              )
                            : Text(
                                '??????',
                                style:
                                    TextStyle(fontSize: 50, color: Colors.red),
                              ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${meter} ??????',
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    '${count} ??????',
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    '${cycle} ???',
                    style: TextStyle(fontSize: 30),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${meter * count} ?????? ??????',
                    style: TextStyle(fontSize: 30),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Spacer(),
            ],
          ),
        ),
      ],
    );
  }
}
