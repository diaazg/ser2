import 'package:flutter/material.dart';
import 'package:ser2/core/utiles/constants.dart';
import 'package:ser2/features/doctors/presentation/widgets/accorder_button.dart';
import 'package:ser2/features/doctors/presentation/widgets/filter_option_card.dart';

class SerarchWidget extends StatelessWidget {
  const SerarchWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: size.height * 0.09 * 0.7,
        width: size.width * 0.85,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /*  Container(
              height: size.height * 0.1 * 0.3,
              width: size.width * 0.5,
              child: SearchField(
                suggestions: doctors
                    .map((e) => SearchFieldListItem(e.name!,
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: TextButton(onPressed: (){
                          
                          }, child: Text(e.name!)),
                        )))
                    .toList(),
                suggestionState: Suggestion.expand,
                hint: 'Doctor name',
                searchStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.black.withOpacity(0.8),
                ),
                validator: (x) =>
                    x!.isEmpty ? 'Please enter your commune' : null,
                searchInputDecoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Kconstants.blueBackground,
                    ),
                    border: InputBorder.none,
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    hoverColor: Colors.black,
                    fillColor: Colors.black,
                    focusColor: Colors.black,
                    isCollapsed: false),
                maxSuggestionsInViewPort: 2,
                itemHeight: 50,
                onSubmit: (x) {
                  setState(() {
                    searchDoctor = x;
                  });
                },
              ),
            ), */
              GestureDetector(
                onTap: () {
                  showBottomSheet(
                      context: context,
                      builder: ((context) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 60,
                                    color: Colors.black54,
                                    spreadRadius: 45)
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20))),
                          height: size.height * 0.8,
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Filter',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: size.height * 0.8 * 0.06,
                              ),
                              FilterOption(
                                size: size,
                                title: 'Wilaya',
                              ),
                              SizedBox(
                                height: size.height * 0.8 * 0.06,
                              ),
                              FilterOption(
                                size: size,
                                title: 'Commune',
                              ),
                              SizedBox(
                                height: size.height * 0.8 * 0.06,
                              ),
                              FilterOption(size: size, title: 'Sexe'),
                              SizedBox(
                                height: size.height * 0.8 * 0.06,
                              ),
                              const Center(
                                child: Accorder(),
                              )
                            ],
                          ),
                        );
                      }));
                },
                child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Kcolors.blueBackground,
                        borderRadius: BorderRadius.circular(200)),
                    child: const Icon(
                      Icons.filter_alt_outlined,
                      color: Colors.white,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}



enum ListTypes { wilaya, commune, gender }
