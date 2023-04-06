import 'package:flutter/material.dart';
import 'package:facebook_app_events/facebook_app_events.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static final facebookAppEvents = FacebookAppEvents();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FutureBuilder(
                future: facebookAppEvents.getAnonymousId(),
                builder: (context, snapshot) {
                  final id = snapshot.data ?? '???';
                  return Text('Anonymous ID: $id');
                },
              ),
              MaterialButton(
                child: Text("Click me!"),
                onPressed: () {
                  facebookAppEvents.logEvent(
                    name: 'button_clicked',
                    parameters: {
                      'button_id': 'the_clickme_button',
                    },
                  );
                },
              ),
              MaterialButton(
                child: Text("Set user data"),
                onPressed: () {
                  facebookAppEvents.setUserData(
                    email: 'opensource@oddbit.id',
                    firstName: 'Oddbit',
                    dateOfBirth: '2019-10-19',
                    city: 'Denpasar',
                    country: 'Indonesia',
                  );
                },
              ),
              MaterialButton(
                child: Text("Test logAddToCart"),
                onPressed: () {
                  facebookAppEvents.logAddToCart(
                    id: '1',
                    type: 'product',
                    price: 99.0,
                    currency: 'TRY',
                  );
                },
              ),
              MaterialButton(
                child: Text("Test purchase!"),
                onPressed: () {
                  facebookAppEvents.logPurchase(amount: 1, currency: "USD");
                },
              ),
              MaterialButton(
                child: Text("Enable advertise tracking!"),
                onPressed: () {
                  facebookAppEvents.setAdvertiserTracking(enabled: true);
                },
              ),
              MaterialButton(
                child: Text("Disabled advertise tracking!"),
                onPressed: () {
                  facebookAppEvents.setAdvertiserTracking(enabled: false);
                },
              ),
              MaterialButton(
                child: Text("Enable Automatically Logged Events!"),
                onPressed: () {
                  facebookAppEvents.setAutoLogAppEventsEnabled(true);
                },
              ),
              MaterialButton(
                child: Text("Disable Automatically Logged Events!"),
                onPressed: () {
                  facebookAppEvents.setAutoLogAppEventsEnabled(false);
                },
              ),
              MaterialButton(
                child: Text("Enable Auto Init!"),
                onPressed: () async {
                  await facebookAppEvents.setAutoInitEnabled(true);
                  await facebookAppEvents.fullyInitialize();
                },
              ),
              MaterialButton(
                child: Text("Disable Auto Init!"),
                onPressed: () {
                  facebookAppEvents.setAutoInitEnabled(false);
                },
              ),
              MaterialButton(
                child: Text("Enable Collection of Advertiser IDs!"),
                onPressed: () {
                  facebookAppEvents.setAdvertiserTracking(enabled: true);
                },
              ),
              MaterialButton(
                child: Text("Enable Debugging!"),
                onPressed: () {
                  facebookAppEvents.setIsDebugEnabled(false);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
