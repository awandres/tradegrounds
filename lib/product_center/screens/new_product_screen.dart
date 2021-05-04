import 'package:flutter/material.dart';
import 'package:storegrounds/delivery_dashboard/models/delivery.dart';


// efedec
// bigger back button
// New product in the top bar 

class Product {
  String name;
  String cost;
  String dimensions;
  String weight;
  String sku;
  // set to false on instantiation
  bool ageVerified;
  int amountInsured;
  bool insured;
  bool signatureNeeded;

  bool active;
  double deliveryCost;
  int amountDelivered;

  Product ({
    @required this.name,
    @required this.cost,
    @required this.sku,
    @required this.amountInsured,
    @required this.amountDelivered,
    @required this.deliveryCost,

    this.ageVerified =false,
    this.insured=false,
    this.signatureNeeded=false,
    this.active=false,
    

  });

  void toggleAgeVerified(){
    ageVerified= !this.ageVerified;
  }

  void toggleInsurance(){
    insured= !this.insured;
  }

  void toggleSignature(){
    signatureNeeded= !this.signatureNeeded;
  }

  void setName(value){
    name=value;
    print(name);
  }

  void setCost(value){
    cost=value;
    print(cost);
  }

  void setDimensions(value){
    dimensions=value;
    print(dimensions);
  }

  void setWeight(value){
    weight=value;
    print(weight);
  }

  void setSku(value){
    sku=value;
    print(sku);
  }
}

class NewProductScreen extends StatefulWidget {
  // -----------------------------------
  //  STATE FULL NEW PRODUCT SCREEN
  // -----------------------------------
  @override
  _NewProductScreenState createState() => _NewProductScreenState();
}

class _NewProductScreenState extends State<NewProductScreen> {
  static GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  // ----------------------
  // ---- Product Object
  // ----------------------
  var _product =  Product(
    name:'',
    cost:'',
    sku:'',
    active:false,
    amountInsured:0,
    amountDelivered: 0,
    deliveryCost: 0,
    
  );
  
  // ----------------------
  // ----- Focus Nodes
  // ----------------------
  final _productNameFocusNode = FocusNode();
  final _costOfProductFocusNode = FocusNode();
  final _dimesionsFocusNode = FocusNode();
  final _weightFocusNode = FocusNode();
  final _skuFocusNode = FocusNode();
  final _ageVerificationFocusNode = FocusNode();
  final _insuranceVerificationFocusNode = FocusNode();
  final _signatureVerificationFocusNode = FocusNode();

  // -------------------------------------------------
  // --- drop down menu lists ( Dimensions & Weight )
  // -------------------------------------------------
  List<String> _dimensions = [
    "Flat",
    "Two Handfuls",
    "Armful",
    "Hip Height",
    "Human Height",
  ];

  List<String> _weight = [
    "Feather",
    "Light",
    "Heavy",
    "Very Heavy",
    "High Risk",
  ];

  var _isLoading =false;

  // ----------------------------
  // --- On Submit Function 
  // ----------------------------

  Future<void> _saveForm() async {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // -------------------------------------
      // --- APP BAR
      // -------------------------------------
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 120.0,
        brightness: Brightness.light,
        backgroundColor: Theme.of(context).primaryColor,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        leading: Builder(
          builder: (context) => IconButton(
            splashRadius: 30,
            padding: EdgeInsets.only(left: 25),
            icon: Icon(
              Icons.arrow_back, 
              size: 40,
            ),
            onPressed: () => Navigator.of(context).pop()
          ),
        ),
        title: Center(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "New Product",
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontWeight: FontWeight.w700,
                  fontSize: 40.0,
                ),
              ),
          ),
        ),
      ),
      body: LayoutBuilder(builder: (ctx, constraints) {
        return Container(
          margin: EdgeInsets.all(35),
          height: constraints.maxHeight*0.95,
          child: Material(
            elevation: 10,
            type: MaterialType.card,
            borderRadius: BorderRadius.all(Radius.circular(30)),
            child: Padding(
              padding: const EdgeInsets.all(28),
              // ------------------------------
              // -- Form 
              // ------------------------------
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget> [
                          SizedBox(width:30),
                          Icon(
                            Icons.add_box,
                            size: 42,
                          ),
                          SizedBox(width:30),
                          Expanded(
                            child: Text(
                              'Product Info',
                              style: TextStyle(
                                fontSize: 42,
                                fontFamily: 'Quicksand'
                              ),
                            ),
                          ),
                          CloseButton()
                        ]
                      ),
                      SizedBox(height:20),
                      // -------------------------------------
                      // -- Text Form Field (NAME OF PRODUCT)
                      // -------------------------------------
                       Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            labelText: 'Name of Product',
                            fillColor: Colors.grey[200],
              
                          ),
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context).requestFocus(_costOfProductFocusNode);
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please provide a name.';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _product.setName(value);
                          },
                        ),
                      ),
                      // -------------------------------------
                      // -- Text Form Field (COST)
                      // -------------------------------------
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Icon(Icons.add_circle),
                            SizedBox(width:20),
                            Container(
                              width: 620,
                              child: TextFormField(
                                keyboardType: TextInputType.datetime,
                                decoration: InputDecoration(
                                  filled: true,
                                  labelText: 'Cost of Product',
                                  fillColor: Colors.grey[200],
                                ),
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context).requestFocus(_costOfProductFocusNode);
                                },
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please provide a name.';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _product.setCost(value);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      // -------------------------------------
                      // -- Text Form Field (Dimensions)
                      // -------------------------------------
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Icon(Icons.add_circle),
                            SizedBox(width:20),
                            Container(
                              width: 620,
                              child: DropdownButtonFormField(
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black.withOpacity(0.8),
                                  fontFamily: 'Quicksand',
                                  fontWeight: FontWeight.w700,
                                ),
                                decoration: InputDecoration(
                                  filled: true,
                                  labelText: 'Dimensions',
                                  fillColor: Colors.grey[200],
                                ),
                                isExpanded: true,
                                iconSize: 30.0,
                                items: _dimensions.map(
                                  (value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  },
                                ).toList(),
                                onChanged: (value) => {
                                  _product.setDimensions(value)
                                },
                                validator: (value) {
                                  if (value==null) {
                                    return 'Please provide Dimensions';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      // -------------------------------------
                      // -- Dropdown Form Field (Weight)
                      // -------------------------------------
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Icon(Icons.add_circle),
                            SizedBox(width:20),
                            Container(
                              width: 620,
                              child: DropdownButtonFormField(
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black.withOpacity(0.8),
                                  fontFamily: 'Quicksand',
                                  fontWeight: FontWeight.w700,
                                ),
                                decoration: InputDecoration(
                                  filled: true,
                                  labelText: 'Weight',
                                  fillColor: Colors.grey[200],
                                ),
                                isExpanded: true,
                                iconSize: 30.0,
                                items: _weight.map(
                                  (value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  },
                                ).toList(),
                                onChanged: (value) => {
                                  _product.setWeight(value),
                                },
                                validator: (value) {
                                  if (value==null) {
                                    return 'Please provide Weight';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      // -------------------------------------
                      // -- Text Form Field (SKU)
                      // -------------------------------------
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Icon(Icons.add_circle),
                            SizedBox(width:20),
                            Container(
                              width: 620,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  filled: true,
                                  labelText: 'SKU (Optional)',
                                  fillColor: Colors.grey[200],
                                ),
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context).requestFocus(_costOfProductFocusNode);
                                },
                                // ------------------------
                                // ---- OPTIONAL FIELD
                                // ------------------------
                                // validator: (value) {
                                //   if (value.isEmpty) {
                                //     return 'Please provide a name.';
                                //   }
                                //   return null;
                                // },
                                onSaved: (value) {
                                  _product.setSku(value);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      // -------------------------------------
                      // -- Age Verified checkbox
                      // -------------------------------------
                      Container(
                        margin: EdgeInsets.only(left:10, right: 10, top: 5, bottom:5),
                        child: Row(
                          children: [
                            Icon(Icons.add_circle),
                            SizedBox(width:20),
                            Checkbox(
                              value: _product.ageVerified, 
                              onChanged: (va){ 
                                setState(() {
                                  _product.toggleAgeVerified();
                                });
                              }
                            ),
                            Text(
                              ' [Age Verified] Does this product need to be age verified? ')
                          ],
                        ),
                      ),
                      // -------------------------------------
                      // -- Insurance checkbox
                      // -------------------------------------
                      Container(
                        margin: EdgeInsets.only(left:10, right: 10, top: 5, bottom:5),
                        child: Row(
                          children: [
                            Icon(Icons.add_circle),
                            SizedBox(width:20),
                            Checkbox(
                              value: _product.insured, 
                              onChanged: (va){
                                setState(() {
                                  _product.toggleInsurance();
                                }); 
                              }
                            ),
                            Text(' [Insurance] Do you need this product insured? ')
                          ],
                        ),
                      ),
                      // -------------------------------------
                      // -- Signature required checkbox
                      // -------------------------------------
                      Container(
                        margin: EdgeInsets.only(left:10, right: 10, top: 5, bottom:5),
                        child: Row(
                          children: [
                            Icon(Icons.add_circle),
                            SizedBox(width:20),
                            Checkbox(
                              value: _product.signatureNeeded, 
                              onChanged: (va){ 
                                setState(() {
                                  _product.toggleSignature();
                                });
                              }
                            ),
                            Text(' [Signature] Have the recipient sign the package? ')
                          ],
                        ),
                      ),
                      // --------------------------------------
                      // --- Submit Button 
                      // --------------------------------------
                      // Conditionally rendering loading spinner
                      // -----------------------------------------
                      if (_isLoading)
                        CircularProgressIndicator()
                      else
                      // ------------------------
                      // ----- CONTINUE BUTTON
                      // ------------------------
                      Container(
                        margin: EdgeInsets.only(left:10),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 12.0, 0, 0.0),
                          child: RaisedButton(
                            child: const Text(
                              'CONTINUE',
                              style: TextStyle(
                                fontSize: 25.0,
                                letterSpacing: 7.5,
                                fontFamily: 'Quicksand',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () => _saveForm(),
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 235.0, vertical: 25.0),
                            color: Theme.of(context).primaryColor,
                            textColor: Theme.of(context)
                                .primaryTextTheme
                                .button
                                .color,
                          ),
                        ),
                      ),
                    ]
                  ),
                ),
              ),
            )
          )
        );
      })
    );
  }
}