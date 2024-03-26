import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:searchfield/searchfield.dart';
import 'package:ser2/core/utiles/constants.dart';
import 'package:ser2/core/widgets/return_button.dart';
import 'package:ser2/features/medicinesSchedule/presentation/logic/add_med_cubit.dart';
import 'package:ser2/features/medicinesSchedule/presentation/logic/add_med_state.dart';
import '../../../../core/utiles/lists.dart';

class AddMedicin extends StatefulWidget {
  const AddMedicin({super.key});

  @override
  State<AddMedicin> createState() => _AddMedicinState();
}

final _formkey = GlobalKey<FormState>();
String? medicineName;
String? debut;
String? fin;
String? time1;
String? time2;
String? time3;
String? type;
String? dose;
List<String> days = [];
String jours = "";
List<String> types = ["botle", "capsuls", "syringe"];
List<int> hours = [
  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  9,
  10,
  11,
  12,
  13,
  14,
  15,
  16,
  17,
  18,
  19,
  20,
  21,
  22,
  23
];

String sat = "";
String sun = "";
String mon = "";
String thi = "";
String wed = "";
String tue = "";
String fri = "";
String dropdownValue = 'PM';

final AddMedicineBloc _addMedicineBloc = AddMedicineBloc();

class _AddMedicinState extends State<AddMedicin> {
  bool isDate(String str) {
    try {
      DateTime.parse(str);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xFFEAEBEC),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ReturnButton(),
              SizedBox(
                height: size.height * 0.02,
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Center(
                  child: Form(
                      key: _formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'medicName',
                            style: Kcolors.fontMain
                                .copyWith(color: Colors.black, fontSize: 15),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Container(
                            height: size.height * 0.07,
                            width: size.width * 0.9,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50),
                              child: Center(
                                child: SearchField(
                                  searchStyle: Kcolors.fontMain.copyWith(
                                      color: Colors.black, fontSize: 20),
                                  onSubmit: (val) {
                                    medicineName = val;
                                  },
                                  validator: (val) =>
                                      val!.isEmpty ? 'Enter a name' : null,
                                  searchInputDecoration: InputDecoration(
                                      hintStyle: Kcolors.fontMain.copyWith(
                                          color: Colors.black, fontSize: 20),
                                      hintText: 'medicine name',
                                      border: InputBorder.none),
                                  suggestions: medicines
                                      .map((e) => SearchFieldListItem(e,
                                          child: Container(
                                            width: size.width * 0.4,
                                            padding: const EdgeInsets.all(10),
                                            child: Text(e),
                                          )))
                                      .toList(),
                                  suggestionState: Suggestion.expand,
                                  hint: 'Medicine',
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Text(
                            'start',
                            style: Kcolors.fontMain
                                .copyWith(color: Colors.black, fontSize: 15),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Container(
                            height: size.height * 0.07,
                            width: size.width * 0.9,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50),
                              child: Center(
                                child: TextFormField(
                                  keyboardType: TextInputType.datetime,
                                  style: Kcolors.fontMain.copyWith(
                                      color: Colors.black, fontSize: 20),
                                  onChanged: (val) {
                                    debut = val;
                                  },
                                  validator: (val) => (!isDate(debut!) ||
                                          debut?.substring(4, 5) != "-" ||
                                          debut?.substring(7, 8) != "-")
                                      ? 'check start date'
                                      : null,
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                      hintStyle: Kcolors.fontMain.copyWith(
                                          color: Colors.black, fontSize: 20),
                                      hintText: 'start date YYYY-MM-DD',
                                      border: InputBorder.none),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Text(
                            'fin',
                            style: Kcolors.fontMain
                                .copyWith(color: Colors.black, fontSize: 15),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Container(
                            height: size.height * 0.07,
                            width: size.width * 0.9,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50),
                              child: Center(
                                child: TextFormField(
                                  keyboardType: TextInputType.datetime,
                                  style: Kcolors.fontMain.copyWith(
                                      color: Colors.black, fontSize: 20),
                                  onChanged: (val) {
                                    fin = val;
                                  },
                                  validator: (val) => (!isDate(fin!) ||
                                          fin?.substring(4, 5) != "-" ||
                                          debut?.substring(7, 8) != "-")
                                      ? 'check fin date'
                                      : null,
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                      hintStyle: Kcolors.fontMain.copyWith(
                                          color: Colors.black, fontSize: 20),
                                      hintText: 'fin date YYYY-MM-DD',
                                      border: InputBorder.none),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "dose",
                                    style: Kcolors.fontMain.copyWith(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 50),
                                    height: size.height * 0.07,
                                    width: size.width * 0.4,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Center(
                                      child: TextFormField(
                                        style: Kcolors.fontMain.copyWith(
                                            color: Colors.black, fontSize: 20),
                                        onChanged: (val) {
                                          dose = val;
                                        },
                                        validator: (val) =>
                                            val!.isEmpty ? 'Enter dose' : null,
                                        cursorColor: Colors.black,
                                        decoration: InputDecoration(
                                            hintStyle: Kcolors.fontMain
                                                .copyWith(
                                                    color: Colors.black,
                                                    fontSize: 20),
                                            border: InputBorder.none),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "type",
                                    style: Kcolors.fontMain.copyWith(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    height: size.height * 0.07,
                                    width: size.width * 0.4,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Center(
                                      child: SearchField(
                                        suggestions: types
                                            .map((e) => SearchFieldListItem(e,
                                                child: Container(
                                                  width: size.width * 0.4,
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  child: Text(e),
                                                )))
                                            .toList(),
                                        suggestionState: Suggestion.expand,
                                        hint: 'type',
                                        searchStyle: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black.withOpacity(0.8),
                                        ),
                                        validator: (x) => (x!.isEmpty ||
                                                (type != types[0] &&
                                                    type != types[1] &&
                                                    type != types[2]))
                                            ? 'Please enter the medicine type'
                                            : null,
                                        searchInputDecoration: InputDecoration(
                                            prefixIcon: Icon(
                                              Icons.search,
                                              color: Kcolors.blueBackground,
                                            ),
                                            border: InputBorder.none,
                                            focusedBorder:
                                                const UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.black)),
                                            hoverColor: Colors.black,
                                            fillColor: Colors.black,
                                            focusColor: Colors.black,
                                            isCollapsed: false),
                                        maxSuggestionsInViewPort: 2,
                                        itemHeight: 50,
                                        onSubmit: (x) {
                                          setState(() {
                                            type = x;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Dose 1",
                                    style: Kcolors.fontMain.copyWith(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  Container(
                                    height: size.height * 0.07,
                                    width: size.width * 0.25,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 1),
                                      height: size.height * 0.07,
                                      width: size.width * 0.25,
                                      child: SearchField(
                                        suggestions: hours
                                            .map((e) => SearchFieldListItem(
                                                e.toString()!,
                                                child: Container(
                                                  margin:
                                                      const EdgeInsets.all(10),
                                                  child: Text(e.toString()),
                                                )))
                                            .toList(),
                                        suggestionState: Suggestion.expand,
                                        searchStyle: Kcolors.fontMain.copyWith(
                                            color: Colors.black, fontSize: 20),
                                        onSubmit: (val) {
                                          time1 = val;
                                        },
                                        validator: (val) => (val!.isEmpty ||
                                                time1 == "" ||
                                                time1 == null)
                                            ? 'Enter 1st dose'
                                            : null,
                                        searchInputDecoration: InputDecoration(
                                            hintStyle: Kcolors.fontMain
                                                .copyWith(
                                                    color: Colors.black,
                                                    fontSize: 20),
                                            border: InputBorder.none),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Dose 2",
                                    style: Kcolors.fontMain.copyWith(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  Container(
                                    height: size.height * 0.07,
                                    width: size.width * 0.25,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 1),
                                      height: size.height * 0.07,
                                      width: size.width * 0.25,
                                      child: SearchField(
                                        suggestions: hours
                                            .map((e) => SearchFieldListItem(
                                                e.toString()!,
                                                child: Container(
                                                  margin:
                                                      const EdgeInsets.all(10),
                                                  child: Text(e.toString()),
                                                )))
                                            .toList(),
                                        suggestionState: Suggestion.expand,
                                        searchStyle: Kcolors.fontMain.copyWith(
                                            color: Colors.black, fontSize: 20),
                                        onSubmit: (val) {
                                          time2 = val;
                                        },
                                        validator: (val) => (((time1 == "" ||
                                                    time1 == null) &&
                                                (time2 == "" || time2 == null)))
                                            ? 'Enter 2nd dose'
                                            : null,
                                        searchInputDecoration: InputDecoration(
                                            hintStyle: Kcolors.fontMain
                                                .copyWith(
                                                    color: Colors.black,
                                                    fontSize: 20),
                                            border: InputBorder.none),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Dose 3",
                                    style: Kcolors.fontMain.copyWith(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  Container(
                                    height: size.height * 0.07,
                                    width: size.width * 0.25,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 1),
                                      height: size.height * 0.07,
                                      width: size.width * 0.25,
                                      child: SearchField(
                                        suggestions: hours
                                            .map((e) => SearchFieldListItem(
                                                e.toString()!,
                                                child: Container(
                                                  margin:
                                                      const EdgeInsets.all(10),
                                                  child: Text(e.toString()),
                                                )))
                                            .toList(),
                                        suggestionState: Suggestion.expand,
                                        searchStyle: Kcolors.fontMain.copyWith(
                                            color: Colors.black, fontSize: 20),
                                        onSubmit: (val) {
                                          time3 = val;
                                        },
                                        validator: (val) => (((time1 == "" ||
                                                    time1 == null) &&
                                                (time2 == "" ||
                                                    time2 == null) &&
                                                (time3 == "" || time3 == null)))
                                            ? 'Enter 3rd dose'
                                            : null,
                                        searchInputDecoration: InputDecoration(
                                            hintStyle: Kcolors.fontMain
                                                .copyWith(
                                                    color: Colors.black,
                                                    fontSize: 20),
                                            border: InputBorder.none),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ))),
              SizedBox(
                height: size.height * 0.02,
              ),
              BlocBuilder<AddMedicineBloc, AddMedicinState>(
                  bloc: _addMedicineBloc,
                  builder: (context, state) {
                    return Row(
                      children: [
                        AddMedicDay(
                          size: size,
                          isChoose: _addMedicineBloc.choosenDays['Sat']!,
                          day: 'Sat',
                          chooseDay: () => _addMedicineBloc.chooseDay('Sat'),
                        ),
                        AddMedicDay(
                          size: size,
                          isChoose: _addMedicineBloc.choosenDays['Sun']!,
                          day: 'Sun',
                          chooseDay: () => _addMedicineBloc.chooseDay('Sun'),
                        ),
                        AddMedicDay(
                          size: size,
                          isChoose: _addMedicineBloc.choosenDays['Mon']!,
                          day: 'Mon',
                          chooseDay: () => _addMedicineBloc.chooseDay('Mon'),
                        ),
                        AddMedicDay(
                          size: size,
                          isChoose: _addMedicineBloc.choosenDays['Thi']!,
                          day: 'Thi',
                          chooseDay: () => _addMedicineBloc.chooseDay('Thi'),
                        ),
                        AddMedicDay(
                          size: size,
                          isChoose: _addMedicineBloc.choosenDays['Wed']!,
                          day: 'Wed',
                          chooseDay: () => _addMedicineBloc.chooseDay('Wed'),
                        ),
                        AddMedicDay(
                          size: size,
                          isChoose: _addMedicineBloc.choosenDays['Tue']!,
                          day: 'Tue',
                          chooseDay: () => _addMedicineBloc.chooseDay('Tue'),
                        ),
                        AddMedicDay(
                          size: size,
                          isChoose: _addMedicineBloc.choosenDays['Fri']!,
                          day: 'Fri',
                          chooseDay: () => _addMedicineBloc.chooseDay('Fri'),
                        ),
                      ],
                    );
                  }),
              SizedBox(
                height: size.height * 0.02,
              ),
              AppoButton(
                  size: size,
                  title: 'save',
                  color: const Color(0xFF496CCE),
                  fontColor: Colors.white,
                  buttonFunc: () async {
                    if (_formkey.currentState!.validate()) {}
                  })
            ],
          ),
        ),
      ),
    ));
  }
}

class AddMedicDay extends StatelessWidget {
  const AddMedicDay({
    super.key,
    required this.size,
    required this.isChoose,
    required this.day,
    this.chooseDay,
  });

  final Size size;
  final bool isChoose;
  final String day;
  final Function()? chooseDay;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: chooseDay,
      child: Container(
        color: isChoose ? const Color(0xFF6694F6) : Colors.white,
        height: 40,
        width: size.width * 0.12,
        child: Center(
          child: Text(
            day,
            style: Kcolors.fontMain.copyWith(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
