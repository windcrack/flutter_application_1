import 'package:flutter/material.dart';

class CruptoCoinScreen extends StatefulWidget {
  const CruptoCoinScreen({super.key});

  @override
  State<CruptoCoinScreen> createState() => _CruptoCoinScreenState();
}

class _CruptoCoinScreenState extends State<CruptoCoinScreen> {

  String? coinName;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is String, 'You must provider String args');
    // if(args == null){
    //   print('You must provider args');
    //   return;
    // }
    // if(args is! String){
    //   print('You must provider String args');
    //   return;
    // }
    coinName = args as String;
    setState(() {
      
    });
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(coinName ?? '...')),
    );
  }
}