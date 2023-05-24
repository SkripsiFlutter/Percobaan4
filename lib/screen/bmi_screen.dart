import 'package:flutter/material.dart';
import 'package:flutter_bmi/constants.dart';
import 'package:numberpicker/numberpicker.dart';

import '../widget/card.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _InputPageState();
}

class _InputPageState extends State<BmiScreen> {
  bool isMaleSelected = false;
  int height = 155;
  int weight = 55;
  int age = 22;
  void ageIncrement() {
    setState(() {
      age++;
    });
  }

  void ageDecrement() {
    setState(() {
      age--;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: kbackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Image.asset(
          'assets/images/Logo.png',
          height: 75.0,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isMaleSelected = true;
                  });
                },
                child: AppCard(
                  borderSide: isMaleSelected
                      ? const BorderSide(color: Colors.white70, width: 3)
                      : BorderSide.none,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.male,
                        color: Color.fromARGB(255, 39, 123, 250),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Male',
                        style: isMaleSelected
                            ? textTheme.bodySmall
                            : textTheme.labelSmall,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isMaleSelected = false;
                  });
                },
                child: AppCard(
                    borderSide: isMaleSelected == false
                        ? const BorderSide(color: Colors.white70, width: 3)
                        : BorderSide.none,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.female,
                            color: Color.fromARGB(255, 255, 155, 189)),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Female',
                          style: isMaleSelected == false
                              ? textTheme.bodySmall
                              : textTheme.labelSmall,
                        ),
                      ],
                    )),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: AppCard(
                width: 370,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Height (in cm)',
                      style: textTheme.bodySmall,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    NumberPicker(
                        minValue: 120,
                        maxValue: 220,
                        value: height,
                        selectedTextStyle:
                            const TextStyle(color: Colors.white, fontSize: 24),
                        textStyle: const TextStyle(
                            color: Colors.white54, fontSize: 16),
                        axis: Axis.horizontal,
                        itemCount: 5,
                        itemWidth: 60,
                        onChanged: (newValue) {
                          setState(() {
                            height = newValue;
                          });
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: List.generate(
                          5,
                          (index) => Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 29),
                                height: index == 2 ? 30 : 20,
                                width: 2,
                                color:
                                    index == 2 ? Colors.white : Colors.white54,
                              )),
                    )
                  ],
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppCard(
                  child: Column(
                children: [
                  const SizedBox(height: 15),
                  Text(
                    'Weight',
                    style: textTheme.bodySmall,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: 80,
                    width: 130,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(.18),
                        border: Border.all(
                            width: 2, color: Colors.grey.withOpacity(.3)),
                        borderRadius: BorderRadius.circular(30)),
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        const Positioned(
                          bottom: 60,
                          child: RotatedBox(
                            quarterTurns: 45,
                            child: Icon(
                              Icons.play_arrow_rounded,
                              size: 30,
                            ),
                          ),
                        ),
                        Center(
                          child: NumberPicker(
                              minValue: 10,
                              maxValue: 150,
                              value: weight,
                              itemWidth: 40,
                              selectedTextStyle: const TextStyle(
                                  color: Colors.white, fontSize: 24),
                              textStyle: const TextStyle(
                                  color: Colors.white54, fontSize: 16),
                              axis: Axis.horizontal,
                              onChanged: (newValue) {
                                setState(() {
                                  weight = newValue;
                                });
                              }),
                        ),
                      ],
                    ),
                  )
                ],
              )),
              const SizedBox(
                width: 10,
              ),
              AppCard(
                  child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Age',
                    style: textTheme.bodySmall,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          ageDecrement();
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(5),
                              border:
                                  Border.all(color: Colors.white54, width: 3)),
                          child: Center(
                            child: Text(
                              '-',
                              style: textTheme.labelSmall,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        '$age',
                        style: textTheme.bodyLarge,
                      ),
                      InkWell(
                        onTap: () {
                          ageIncrement();
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(5),
                              border:
                                  Border.all(color: Colors.white54, width: 3)),
                          child: Center(
                            child: Text(
                              '+',
                              style: textTheme.labelSmall,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )),
            ],
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return BottomSheet(
                    onClosing: () {},
                    builder: (context) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 50),
                        height: 800,
                        child: Center(
                            child: Column(
                          children: [
                            Text(
                              'Nilai IMT kamu adalah: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                  color: Colors.white.withOpacity(.8)),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              calculateBMI(height, weight),
                              style: textTheme.bodyLarge,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              bmiResult(),
                              style: textTheme.bodySmall,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              bmiFeedBack(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  height: 1.5,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Colors.white.withOpacity(.8)),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Colors.black;
                              },
                              child: const Text('Close',
                                  style: TextStyle(color: kblueColor)),
                            )
                          ],
                        )),
                      );
                    });
              });
        },
        backgroundColor: kblueColor,
        shape: const CircleBorder(),
        child: const Text(
          'BMI',
          style:
              TextStyle(color: kbackgroundColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

double bmi = 18;
calculateBMI(int height, int weight) {
  bmi = weight / (height * height) * 10000;
  return bmi.toStringAsFixed(1);
}

bmiResult() {
  if (bmi < 18.5) {
    return '(Berat badan kurang)';
  } else if (bmi >= 18.5 && bmi < 23) {
    return '(Normal)';
  } else if (bmi >= 23 && bmi < 25) {
    return '(Kelebihan berat badan dengan resiko)';
  } else if (bmi >= 25 && bmi < 30) {
    return '(Obesitas I)';
  } else {
    return '(Obesitas II)';
  }
}

bmiFeedBack() {
  if (bmi < 18.5) {
    return 'Nilai IMT kurang dari 18.5 memiliki klasifikasi berat badan kurang. Anda perlu untuk menambah berat badan.';
  } else if (bmi >= 18.5 && bmi < 23) {
    return 'Nilai IMT 18.5-22.9 memiliki klasifikasi berat badan normal. Dengan mempertahankan berat badan yang sehat, Anda menurunkan risiko terkena masalah kesehatan yang serius.';
  } else if (bmi >= 23 && bmi < 25) {
    return 'Nilai IMT 23-24.9 memiliki klasifikasi kelebihan berat badan dengan resiko. Anda di sarankan untuk menurunkan berat badan karena kesehatan.';
  } else if (bmi >= 25 && bmi < 30) {
    return 'Nilai IMT 25-29.9 memiliki klasifikasi obesitas I. Anda di sarankan untuk menurunkan berat badan karena kesehatan.';
  } else {
    return 'Nilai IMT lebih dari 30 memiliki klasifikasi obesitas II. Kesehatan Anda mungkin berisiko jika Anda tidak menurunkan berat badan.';
  }
}
