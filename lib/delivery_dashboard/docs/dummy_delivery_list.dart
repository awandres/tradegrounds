import '../models/delivery.dart';
import 'package:intl/intl.dart';

List dummyCompletedDelivieres = [
  Delivery(
    itemCount: 2,
    recipient: 'John Stamos ',
    deliveredAtTime: new DateFormat.jm().format(new DateTime.now()),
    fulfilled: true,
  ),
  Delivery(
    itemCount: 3,
    recipient: 'John Stamos 2',
    deliveredAtTime: new DateFormat.jm().format(new DateTime.now()),
    fulfilled: true,
  ),
];

List dummyDeliveriesInProgress = [
  Delivery(
    itemCount: 2,
    recipient: 'Carl Sagan 1',
    deliveredAtTime: new DateFormat.jm().format(new DateTime.now()),
    estimatedDeliveryTime: new DateFormat.jm().format(new DateTime.now()),
    fulfilled: false,
  ),
  Delivery(
    itemCount: 3,
    recipient: 'Carl Sagan 2',
    estimatedDeliveryTime: new DateFormat.jm().format(new DateTime.now()),
    fulfilled: false,
  ),
  Delivery(
    itemCount: 5,
    recipient: 'Carl Sagan 3',
    estimatedDeliveryTime: new DateFormat.jm().format(new DateTime.now()),
  ),
  Delivery(
    itemCount: 1,
    recipient: 'Carl Sagan 4',
    estimatedDeliveryTime: new DateFormat.jm().format(new DateTime.now()),
  ),
];
