import 'package:european_countries/components/row_items.dart';
import 'package:european_countries/providers/country_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

CountryNotifier? _countryNotifier;

class _HomeScreenState extends State<HomeScreen> {
   int selectedCountry= -1;
  @override
  void initState() {
    _countryNotifier = CountryNotifier();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return  Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding:const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(height: 10,),
              const Text('Here is the Counties',style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),),
              const SizedBox(height: 30,),
             
                Container(
                //  color: Colors.amberAccent,
                height: screenHeight * 0.135,
                width: double.infinity,
                child:  _allCounties(),
              ),
            ],
          ),
        ),
      )),
    );
  }
  _allCounties(){
   double screenHeight = MediaQuery.of(context).size.height;
   double screenWidth = MediaQuery.of(context).size.width;
   return ChangeNotifierProvider.value(value: _countryNotifier,
   child: Consumer<CountryNotifier>(
        builder: (context, cntNtfr, child) {
          if (cntNtfr.isLoading == true) {
            return Container();
          } else {
            return cntNtfr.contries.isEmpty
                ? Container(
                    padding: const EdgeInsets.all(30.0),
                    width: double.infinity,
                    child: const Text(
                      'empty',
                      style: TextStyle(color: Colors.black),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.only(left: 15),
                    itemCount: cntNtfr.contries.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      bool isSelected = selectedCountry == index;
                      return Padding(
                        padding:const  EdgeInsets.only(right: 15),
                        child: SizedBox(
                          height: screenHeight * 0.7,
                          width: screenWidth * 0.45,
                          child: RowItems(
                            isSelected: selectedCountry == index,
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: ((context) => const ToDoScreen())));
                            },
                           country: cntNtfr.contries[index].name?.common ?? 'Unknown Country',
                           image: cntNtfr.contries[index].flags?.svg ?? '',
                          ),
                        ),
                      );
                    });
          }
        },
      ),
   );
  }
}
