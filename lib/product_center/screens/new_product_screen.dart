import 'package:flutter/material.dart';
import 'package:storegrounds/delivery_dashboard/models/delivery.dart';

class Product {
  String name;
  String cost;
  String dimensions;
  String weight;
  String sku;
  bool ageVerified;
  int amountInsured;
  bool active;
  double deliveryCost;
  int amountDelivered;

  Product ({
    @required this.name,
    @required this.cost,
    @required this.sku,
    @required this.active,
    @required this.amountInsured,
    @required this.amountDelivered,
    @required this.deliveryCost,
  });
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.all(40),
        child: Material(
          elevation: 10,
          type: MaterialType.card,
          borderRadius: BorderRadius.all(Radius.circular(30)),
          child: Padding(
            padding: const EdgeInsets.all(28),
            // ------------------------------
            // -- Form 
            // ------------------------------
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
                      Text(
                        'Product Info',
                        style: TextStyle(
                          fontSize: 42,
                          fontFamily: 'Quicksand'
                        ),
                      )
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
                        fillColor: Colors.grey,
                        focusColor: Colors.grey
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
                        _product = Product(
                          name:value,
                          cost:_product.cost,
                          sku:_product.sku,
                          active:_product.active,
                          amountInsured:_product.amountInsured,
                          amountDelivered: _product.amountDelivered,
                          deliveryCost: _product.deliveryCost,
                        );
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
                          width: 600,
                          child: TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              labelText: 'Cost of Product',
                              fillColor: Colors.grey,
                              focusColor: Colors.grey
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
                              _product = Product(
                                name:value,
                                cost:_product.cost,
                                sku:_product.sku,
                                active:_product.active,
                                amountInsured:_product.amountInsured,
                                amountDelivered: _product.amountDelivered,
                                deliveryCost: _product.deliveryCost,
                              );
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
                          width: 600,
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
                              fillColor: Colors.grey,
                              focusColor: Colors.grey
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
                          width: 600,
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
                              fillColor: Colors.grey,
                              focusColor: Colors.grey
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
                          width: 600,
                          child: TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              labelText: 'SKU (Optional)',
                              fillColor: Colors.grey,
                              focusColor: Colors.grey
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
                              _product = Product(
                                name:value,
                                cost:_product.cost,
                                sku:_product.sku,
                                active:_product.active,
                                amountInsured:_product.amountInsured,
                                amountDelivered: _product.amountDelivered,
                                deliveryCost: _product.deliveryCost,
                              );
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
                    margin: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Icon(Icons.add_circle),
                        SizedBox(width:20),
                        Checkbox(
                          value: false, 
                          onChanged: (va){ }
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
                    margin: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Icon(Icons.add_circle),
                        SizedBox(width:20),
                        Checkbox(
                          value: false, 
                          onChanged: (va){ }
                        ),
                        Text(' [Insurance] Do you need this product insured? ')
                      ],
                    ),
                  ),
                  // -------------------------------------
                  // -- Signature required checkbox
                  // -------------------------------------
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Icon(Icons.add_circle),
                        SizedBox(width:20),
                        Checkbox(
                          value: false, 
                          onChanged: (va){ }
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
                  // ----- Login Button
                  // ------------------------
                  Container(
                    margin: EdgeInsets.only(left:160),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 20.0, 0, 0.0),
                      child: RaisedButton(
                        child: const Text(
                          'LOGIN',
                          style: TextStyle(
                            fontSize: 25.0,
                            letterSpacing: 7.5,
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          // _submit();
                        },
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 100.0, vertical: 25.0),
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
          )
        )
      )
    );
  }
}