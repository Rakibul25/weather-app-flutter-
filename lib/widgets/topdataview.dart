import 'package:flutter/material.dart';

class TopDataView extends StatelessWidget {
  final String title, temp, icon, details, country;

  TopDataView(
      {required this.title,
      required this.temp,
      required this.icon,
      required this.details,
      required this.country});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * .80,
      child: Padding(
        padding: const EdgeInsets.only(left: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  country,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  temp,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Visibility(
                  visible: icon == '01d',
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/icon/01d.png',
                        height: 60,
                        width: size.width * .55,
                      ),
                      Text(
                        details,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      )
                    ],
                  )),
                ),
                Visibility(
                  visible: icon == '02d',
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/icon/02d.png',
                        height: 60,
                        width: size.width * .55,
                      ),
                      Text(
                        details,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      )
                    ],
                  )),
                ),
                Visibility(
                  visible: icon == '03d',
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/icon/03d.png',
                        height: 60,
                        width: size.width * .55,
                      ),
                      Text(
                        details,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      )
                    ],
                  )),
                ),
                Visibility(
                  visible: icon == '04d',
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/icon/04d.png',
                        height: 60,
                        width: size.width * .55,
                      ),
                      Text(
                        details,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      )
                    ],
                  )),
                ),
                Visibility(
                  visible: icon == '09d',
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/icon/09d.png',
                        height: 60,
                        width: size.width * .55,
                      ),
                      Text(
                        details,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      )
                    ],
                  )),
                ),
                Visibility(
                  visible: icon == '10d',
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/icon/10d.png',
                        height: 60,
                        width: size.width * .55,
                      ),
                      Text(
                        details,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      )
                    ],
                  )),
                ),
                Visibility(
                  visible: icon == '11d',
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/icon/11d.png',
                        height: 60,
                        width: size.width * .55,
                      ),
                      Text(
                        details,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      )
                    ],
                  )),
                ),
                Visibility(
                  visible: icon == '13d',
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/icon/13d.png',
                        height: 60,
                        width: size.width * .55,
                      ),
                      Text(
                        details,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      )
                    ],
                  )),
                ),
                Visibility(
                  visible: icon == '15d',
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/icon/15d.png',
                        height: 60,
                        width: size.width * .55,
                      ),
                      Text(
                        details,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      )
                    ],
                  )),
                ),
                Visibility(
                  visible: icon == '50d',
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/icon/50d.png',
                        height: 60,
                        width: size.width * .55,
                      ),
                      Text(
                        details,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      )
                    ],
                  )),
                ),
                Visibility(
                  visible: icon == '01n',
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/icon/01n.png',
                        height: 60,
                        width: size.width * .55,
                      ),
                      Text(
                        details,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      )
                    ],
                  )),
                ),
                Visibility(
                  visible: icon == '02n',
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/icon/02n.png',
                        height: 60,
                        width: size.width * .55,
                      ),
                      Text(
                        details,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      )
                    ],
                  )),
                ),
                Visibility(
                  visible: icon == '03n',
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/icon/03n.png',
                        height: 60,
                        width: size.width * .55,
                      ),
                      Text(
                        details,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      )
                    ],
                  )),
                ),
                Visibility(
                  visible: icon == '04n',
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/icon/04n.png',
                        height: 60,
                        width: size.width * .55,
                      ),
                      Text(
                        details,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      )
                    ],
                  )),
                ),
                Visibility(
                  visible: icon == '09n',
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/icon/09n.png',
                        height: 60,
                        width: size.width * .55,
                      ),
                      Text(
                        details,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      )
                    ],
                  )),
                ),
                Visibility(
                  visible: icon == '10n',
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/icon/10n.png',
                        height: 60,
                        width: size.width * .55,
                      ),
                      Text(
                        details,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      )
                    ],
                  )),
                ),
                Visibility(
                  visible: icon == '11n',
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/icon/11n.png',
                        height: 60,
                        width: size.width * .55,
                      ),
                      Text(
                        details,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      )
                    ],
                  )),
                ),
                Visibility(
                  visible: icon == '13n',
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/icon/13n.png',
                        height: 60,
                        width: size.width * .55,
                      ),
                      Text(
                        details,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      )
                    ],
                  )),
                ),
                Visibility(
                  visible: icon == '50n',
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/icon/50n.png',
                        height: 60,
                        width: size.width * .55,
                      ),
                      Text(
                        details,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      )
                    ],
                  )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
