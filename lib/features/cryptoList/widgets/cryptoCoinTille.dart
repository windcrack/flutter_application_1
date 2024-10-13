import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/repositories/cryptoCoins/models/models.dart';
import 'package:flutter_application_1/routes/router.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({
    super.key,
    required this.coin,
  });

  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final coinDetails = coin.details;
    return ListTile(
      leading: Image.network(coinDetails.fullImageUrl),
      title: Text(coin.name, style: theme.textTheme.bodyMedium),
      subtitle: Text('${coinDetails.priceInUSD.toStringAsFixed(2)} \$', style: theme.textTheme.labelSmall),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        AutoRouter.of(context).push(CruptoCoinRoute(coin: coin));
        // Navigator.of(context).pushNamed(
        //   '/coin', 
        //   arguments: coin.name
        // );
      },
    );
  }
}
