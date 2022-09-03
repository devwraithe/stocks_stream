import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/custom_icon.dart';
import '../../domain/entities/stock.dart';
import '../../presentation/providers/stocks_provider.dart';
import '../../presentation/widgets/stock_list_item.dart';
import '../../presentation/widgets/page_title.dart';
import '../../config/colors.dart';

class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final stocksList = ref.watch(stocksProvider);
    late final List<Stock> _stocks = stocksList;

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
                  children: [
                    const CustomIcon(
                      icon: "assets/icons/left-arrow.svg",
                    ),
                    PageTitle(
                      title: "STOCKS",
                      subtitle: "${_stocks.length} Items",
                    ),
                    const CustomIcon(
                      icon: "assets/icons/more-horiz.svg",
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
                _stocks.isEmpty
                    ? const CupertinoActivityIndicator()
                    : ListView.separated(
                        itemBuilder: (context, index) {
                          return StockListItem(
                            image:
                                "https://play-lh.googleusercontent.com/TBRwjS_qfJCSj1m7zZB93FnpJM5fSpMA_wUlFDLxWAb45T9RmwBvQd5cWR5viJJOhkI",
                            symbol: _stocks[index].shortName,
                            company: _stocks[index].name,
                            symbolColor: int.tryParse(
                                _stocks[index].symbolColor ?? "000000"),
                            price: "\$${_stocks[index].price}",
                            change:
                                "${_stocks[index].status == true ? '+' : '-'}${_stocks[index].change}%",
                            changeColor: _stocks[index].status == true
                                ? SSColors.green
                                : SSColors.red,
                          );
                        },
                        itemCount: _stocks.length,
                        shrinkWrap: true,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 22),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
