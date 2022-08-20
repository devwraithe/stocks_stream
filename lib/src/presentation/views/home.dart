import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../data/models/stock_model.dart';
import '../../data/services/stocks_service.dart';
import '../widgets/custom_icon.dart';
import '../../presentation/widgets/page_title.dart';
import '../../presentation/widgets/stock_list_item.dart';
import '../../config/colors.dart';
import '../../config/routes.dart' as routes;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: SSColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    CustomIcon(
                      icon: "assets/icons/left-arrow.svg",
                      size: 22,
                    ),
                    PageTitle(
                      title: "STOCKS",
                      subtitle: "0 Items",
                    ),
                    CustomIcon(
                      icon: "assets/icons/search.svg",
                      size: 22,
                    ),
                  ],
                ),
                const SizedBox(height: 38),
                Container(
                  decoration: BoxDecoration(
                    color: SSColors.gray,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.fromLTRB(22, 15, 20, 13),
                  child: TextFormField(
                    strutStyle: StrutStyle.disabled,
                    autofocus: false,
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.characters,
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                      isDense: true,
                      border: InputBorder.none,
                      suffixIcon: SvgPicture.asset(
                        "assets/icons/search.svg",
                        color: SSColors.black,
                      ),
                      prefixIconColor: SSColors.white,
                      hintText: "Search by symbol, company...",
                      hintStyle:
                          Theme.of(context).textTheme.bodyText1?.copyWith(
                                color: SSColors.black,
                                fontWeight: FontWeight.w600,
                              ),
                      suffixIconConstraints: const BoxConstraints(
                        minHeight: 24,
                        minWidth: 24,
                      ),
                    ),
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          color: SSColors.black,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                const SizedBox(height: 34),
                const FetchStocks(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// display the stocks list
class FetchStocks extends StatefulWidget {
  const FetchStocks({Key? key}) : super(key: key);
  @override
  _FetchStocksState createState() => _FetchStocksState();
}

class _FetchStocksState extends State<FetchStocks> {
  final _stocksService = Get.put(StocksService());
  bool _isLoading = true;
  List<StockModel> _stocks = [];

  @override
  void initState() {
    super.initState();
    _getStocks();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _getStocks() async {
    try {
      final result = await _stocksService.getStocksList();
      setState(() {
        _stocks = result;
        _isLoading = false;
      });
    } catch (err) {
      setState(() {
        _isLoading = false;
      });
      printInfo(info: ">>> An Error Occured <<<");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _isLoading
          ? const Center(
              child: SizedBox(
                height: 40.0,
                width: 40.0,
                child: CupertinoActivityIndicator(),
              ),
            )
          : _stocks.isEmpty
              ? const Center(
                  child: Text("No Stocks Found"),
                )
              : ListView.separated(
                  itemBuilder: (context, index) {
                    return StockListItem(
                      image:
                          "https://cdn.worldvectorlogo.com/logos/tesla-motors-1.svg",
                      symbol: _stocks[index].symbol,
                      symbolColor:
                          int.tryParse(_stocks[index].symbolColor ?? "000000"),
                      company: _stocks[index].company,
                      price: "\$${_stocks[index].price}",
                      change:
                          "${_stocks[index].status == true ? '+' : '-'}${_stocks[index].change}%",
                      changeColor: _stocks[index].status == true
                          ? SSColors.green
                          : SSColors.red,
                      action: () => Get.toNamed(
                        routes.stockDetails,
                        arguments: {"symbol": _stocks[index].symbol},
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 18),
                  itemCount: _stocks.length,
                  shrinkWrap: true,
                ),
    );
  }
}
