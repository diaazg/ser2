  import 'package:flutter/material.dart';

SnackBar daysErrSnack = const SnackBar(
    content: Text('Choose day'),
    backgroundColor: Colors.red,
    elevation: 10,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(5),
  );
  SnackBar setErr = const SnackBar(
    content: Text('There is something wrong , try again'),
    backgroundColor: Colors.red,
    elevation: 10,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(5),
  );
  SnackBar successSnack = const SnackBar(
    content: Text('Medicin added'),
    backgroundColor: Colors.green,
    elevation: 10,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(5),
  );
  SnackBar doseSnack = const SnackBar(
    content: Text('Add at least one dose'),
    backgroundColor: Colors.red,
    elevation: 10,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(5),
  );

  SnackBar filterValsSnack = const SnackBar(
    content: Text('enter values to filter choosen'),
    backgroundColor: Colors.red,
    elevation: 10,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(5),
  );

   SnackBar filterChoose = const SnackBar(
    content: Text('Choose at least filter option'),
    backgroundColor: Colors.red,
    elevation: 10,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(5),
  ); 
  
  