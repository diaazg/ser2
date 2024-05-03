  import 'package:flutter/material.dart';

SnackBar daysErrSnack = const SnackBar(
    content: Text('Choisir le jour'),
    backgroundColor: Colors.red,
    elevation: 10,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(5),
  );
  SnackBar setErr = const SnackBar(
    content: Text('Il y a un problem, réessayez'),
    backgroundColor: Colors.red,
    elevation: 10,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(5),
  );
  SnackBar successSnack = const SnackBar(
    content: Text('Médicament ajouté'),
    backgroundColor: Colors.green,
    elevation: 10,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(5),
  );
  SnackBar doseSnack = const SnackBar(
    content: Text('Ajoutez au moins une dose'),
    backgroundColor: Colors.red,
    elevation: 10,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(5),
  );

  SnackBar filterValsSnack = const SnackBar(
    content: Text('Saisir les valeurs à filtrer choisies'),
    backgroundColor: Colors.red,
    elevation: 10,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(5),
  );

   SnackBar filterChoose = const SnackBar(
    content: Text('Choisissez au moins l\'option de filtre'),
    backgroundColor: Colors.red,
    elevation: 10,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(5),
  ); 

     SnackBar chooseWilayaErr = const SnackBar(
    content: Text('Choisir la wilaya des communes'),
    backgroundColor: Colors.red,
    elevation: 10,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(5),
  );


    SnackBar emailSend= const SnackBar(
    content: Text('Verifier votre boit email'),
    backgroundColor: Colors.green,
    elevation: 10,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(5),
  );


       SnackBar errDate = const SnackBar(
    content: Text('Entrer date de naissance'),
    backgroundColor: Colors.red,
    elevation: 10,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(5),
  );
  
  