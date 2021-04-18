import '../models/delivery.dart';
import 'package:intl/intl.dart';

List dummyCompletedDeliveries = [
  {
    'itemCount': '7',
    'recipient': 'Ben and Jerry',
    'deliveredAtTime': '5:32',
    'fulfilled': true,
  },
  {
    'itemCount': '4',
    'recipient': 'Jill Stein',
    'deliveredAtTime': '3:00',
    'fulfilled': true,
  },
];

List dummyDeliveriesInProgress = [
  {
    'itemCount': '2',
    'recipient': 'Jack Dole',
    'deliveredAtTime': '11:37',
    'estimatedDeliveryTime': '11:10',
    'fulfilled': false,
  },
  {
    'itemCount': '8',
    'recipient': 'Ben Withers',
    'deliveredAtTime': '6:32',
    'estimatedDeliveryTime': '5:53',
    'fulfilled': false,
  },
  {
    'itemCount': '1',
    'recipient': 'Carl Sagan',
    'deliveredAtTime': '2:22',
    'estimatedDeliveryTime': '1:23',
    'fulfilled': false,
  },
  {
    'itemCount': '22',
    'recipient': 'Jenn Kulp',
    'deliveredAtTime': '12:10',
    'estimatedDeliveryTime': '12:30',
    'fulfilled': 'false',
  },
  {
    'itemCount': '10',
    'recipient': 'Dill Jones',
    'deliveredAtTime': '10:02',
    'estimatedDeliveryTime': '9:30',
    'fulfilled': false,
  },
];
