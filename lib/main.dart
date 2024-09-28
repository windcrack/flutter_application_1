import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const CryptoCurrenciesListApp());
}

class CryptoCurrenciesListApp extends StatelessWidget {
  const CryptoCurrenciesListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 31, 31, 31),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        appBarTheme: const AppBarTheme(
          backgroundColor: const Color.fromARGB(255, 31, 31, 31),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700)
          ),
        dividerColor: Colors.white24,
        useMaterial3: true,
        listTileTheme: ListTileThemeData(iconColor: Colors.white),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
          labelSmall: TextStyle(
            color: Colors.white60,
            fontWeight: FontWeight.w700,
            fontSize: 14,
          )
        ),
      ),
      routes: {
        '/' : (context) => CryptoListScreen(),
        '/coin' : (context) => CruptoCoinScreen(),
      },
      // home: const CryptoListScreen(),
    );
  }
}

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key,});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Currencies List'),
      ),
      body: ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, i) {
          const coinName = 'Bitcoin';
          return ListTile(
            leading: SvgPicture.asset(
              'assets/svg/btc.svg',
              width: 30,
              height: 30,
              ),
            title: Text(coinName, style: theme.textTheme.bodyMedium),
            subtitle: Text('20000\$', style: theme.textTheme.labelSmall),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).pushNamed(
                '/coin', 
                arguments: coinName
              );
            },
          );
        }
      ),
    );
  }
}

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