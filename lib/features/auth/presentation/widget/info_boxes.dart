import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ser2/core/utiles/constants.dart';
import 'package:ser2/features/auth/presentation/logic/box_bloc.dart';
import 'package:ser2/features/auth/presentation/logic/box_state.dart';

class InfoBox extends StatelessWidget {
  const InfoBox(
      {super.key,
      required this.size,
      required this.bloc,
      required this.errMessage,
      required this.hintText,
      required this.height,
      required this.width});
  final Size size;
  final BoxBloc bloc;
  final String errMessage;
  final String hintText;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BoxBloc, BoxState>(
        bloc: bloc,
        builder: (context, state) {
          return Container(
            height: size.height * height,
            width: size.width * width,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Center(
                child: TextFormField(
                  style: Kcolors.fontMain
                      .copyWith(color: Colors.black, fontSize: 15),
                  onChanged: (val) => bloc.setInput(val),
                  validator: (val) =>
                      (state is BoxValidateState) ? null : errMessage,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      hintStyle: Kcolors.fontMain
                          .copyWith(color: Colors.black, fontSize: 15),
                      hintText: hintText,
                      border: InputBorder.none),
                ),
              ),
            ),
          );
        });
  }
}

class DropFillBox extends StatelessWidget {
  const DropFillBox(
      {super.key,
      required this.bloc,
      required this.listTypes,
      required this.errMessage,
      required this.height,
      required this.width,
      required this.size,
      required this.hintText});

  final ListTypes listTypes;
  final BoxBloc bloc;
  final String errMessage;
  final double height;
  final double width;
  final Size size;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BoxBloc, BoxState>(
        bloc: bloc,
        builder: (context, state) {
          return Container(
            height: size.height * height,
            width: size.width * width,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Center(
                child: DropdownButtonFormField(
                  validator: (val) =>
                      (state is BoxValidateState) ? null : errMessage,
                  items: listTypes == ListTypes.wilaya
                      ? bloc.wilayat
                          .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value, overflow: TextOverflow.fade),
                          );
                        }).toList()
                      : listTypes == ListTypes.commune
                          ? bloc.communes
                              .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value, overflow: TextOverflow.fade),
                              );
                            }).toList()
                          : listTypes == ListTypes.gender
                              ? bloc.gender.map<DropdownMenuItem<String>>(
                                  (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value,
                                        overflow: TextOverflow.fade),
                                  );
                                }).toList()
                              : bloc.bloodCategory
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value,
                                        overflow: TextOverflow.fade),
                                  );
                                }).toList(),
                  onChanged: (value) {
                    listTypes == ListTypes.wilaya
                        ? bloc.setWilaya(value.toString())
                        : listTypes == ListTypes.commune
                            ? bloc.setCommune(value.toString())
                            : bloc.setInput(value.toString());
                  },
                  decoration: InputDecoration(
                      hintStyle: Kcolors.fontMain
                          .copyWith(color: Colors.black, fontSize: 15),
                      hintText: hintText,
                      border: InputBorder.none),
                ),
              ),
            ),
          );
        });
  }
}

class DateBox extends StatelessWidget {
  const DateBox(
      {super.key,
      required this.size,
      required this.bloc,
      required this.height,
      required this.width});
  final Size size;
  final BoxBloc bloc;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BoxBloc, BoxState>(
        bloc: bloc,
        builder: (context, state) {
          return Container(
            height: size.height * height,
            width: size.width * width,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                    child: bloc.dateOfBirth == null
                        ? const Text('Date de naissance')
                        : Text(DateFormat('dd-MM-yyyy')
                            .format(bloc.dateOfBirth!)
                            .toString()))),
          );
        });
  }
}

enum ListTypes { wilaya, commune, gender, blood }
