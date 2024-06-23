import 'package:flutter/material.dart';
import 'package:weathercast/forecast.dart';


import 'weather.dart';

class Report extends StatefulWidget {
  const Report({super.key});

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  Weather? _weather;
  bool _progress = false;

  void updateReport() {
     forecast()
     .whenComplete(() {
       if (_progress) {
        Navigator.pop(context);
        _progress = false;
       }
      })
      .then((weather) {
       ScaffoldMessenger.of(context).removeCurrentSnackBar();
       setState(() {
         _weather = weather;
       }); 
      })
      .catchError((error) {
         ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(
             content: Text(error.toString()),
             duration: const Duration(days: 1),
           )
        );
    });   
  }

  @override
  void initState() {
    updateReport();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'สภาพอากาศวันนี้',
          style: TextStyle(
            fontSize: 36,
            fontWeight:FontWeight.bold,
            color: Colors.white
          ), 
        ),
        Container(
          constraints: 
           _weather == null ? 
           const BoxConstraints.tightFor(
            width: 150,
            height: 150
          ) : null,
          decoration: BoxDecoration(
            color: Colors.blueAccent.shade700.withOpacity(0.7),
            borderRadius: BorderRadius.circular(10)
          ),
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.symmetric(vertical: 30),
          child: 
             _weather == null ? 
             null : 
             Column(
                children: [
                  Text(
                    _weather!.place,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 20,),
                  Text(
                 '${_weather!.temp}℃',
                 style: Theme.of(context).textTheme.displayLarge,
                  ),
                const SizedBox(height: 20,),
                Text(
                   _weather!.condition,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(height: 20,),
                Image.network(_weather!.symbol)
              ],
          ),
        ),
        FilledButton(
          onPressed: () {
             showDialog(
              context: context, 
              builder: (context) {
                _progress = true;
             return const Dialog(
             backgroundColor: Colors.transparent,
             child: Center(
              child: CircularProgressIndicator()
              ),
          );
        });
            updateReport();
          },
           child: const Text('Refresh')
        )
      ],
    );
  }
}