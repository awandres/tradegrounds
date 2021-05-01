**Global Widgets Readme
The custom drawer is a reusable widget that has a HARD CODED index, that requires it to be passed in order to access certain global functionalility of a drawer
and properly maintain its 'location'.

The index is passed back up the widget tree by a call back function, allowing a call back function "page selector" to be passed down to custom drawer during instantiation

When using the custom drawer, you will need to pass three custom classes: CustomDrawer (_pages, _currentPageIndex, drawerPageSelector).
  
***_pages
pages is a mapped method, to which the list renders its contents, with the "title" string and the object "screen" to which it will push thee page to, upon rendering the custom scaffold. 
This should be rendered and created for every new stateful widget as sampled below: 

class _DeliveryDashboardState extends State<DeliveryDashboard>
    with SingleTickerProviderStateMixin {
  final List<Map<String, Object>> _pages = [
    {'title': 'Product Center', 'screen': ProductCenterScreen()},
    {'title': 'Delivery Dashboard', 'screen': MainScreen()},
    {'title': 'My Courier', 'screen': MyCourierScreen()},
    {'title': 'Delivery Calendar', 'screen': DeliveryCalendarScreen()},
    {'title': 'Billing/Payment', 'screen': BillingPaymentScreen()},
    {'title': 'Settings', 'screen': SettingsScreen()}
  ];  
  
***currentPageIndex 
 Helps your delivery dashboard store your current page's index and keeps your page where it needs to be.
 
   int _currentPageIndex = 1;
 
 // this function is called in the bottom navigation bar to change page index
   void _navbarpageselector(int index) {
     setState(() {
       _currentPageIndex = index;
     });
   }
   
***drawerPageSelector
This   
  void drawerPageSelector(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }