import 'package:latlng/latlng.dart';
import './delivery.dart';

class Dashboard {
  List completedDelivieres = new List<Delivery>();
  List deliveriesInProgress = new List<Delivery>();
  int completedDeliveryCount;

  Dashboard({
    this.completedDelivieres,
    this.deliveriesInProgress,
    this.completedDeliveryCount,
  }) {}
}
