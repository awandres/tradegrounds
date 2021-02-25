import 'package:authentication/widgets/newpassword_input.dart';
import 'package:flutter/material.dart';
import '../providers/password_reset.dart';
import 'package:provider/provider.dart';

import 'package:authentication/widgets/emailInput.dart';
import 'package:authentication/widgets/resetcode_input.dart';

class PasswordResetScreen extends StatefulWidget {
  @override
  _PasswordResetScreenState createState() => _PasswordResetScreenState();
}

class _PasswordResetScreenState extends State<PasswordResetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ChangeNotifierProvider(
        create: (ctx) => PasswordReset(),
        child: Consumer<PasswordReset>(
          builder: (ctx, reset, _) => SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  if (
                    reset.userEmail==null 
                    && reset.resetCode==null
                    && reset.newPassword== null
                  ) EmailInput(),
                  if(
                    reset.userEmail!=null
                    && reset.resetCode==null
                    && reset.newPassword ==null
                  ) ResetCode(),
                  if(
                    reset.userEmail!=null
                    && reset.resetCode!=null
                    && reset.newPassword==null
                  ) NewPassword(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
