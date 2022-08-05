import 'package:flutter/material.dart';
import 'package:stocks_stream/src/config/colors.dart';
import 'package:stocks_stream/src/presentation/widgets/customIcon.dart';
import 'package:stocks_stream/src/presentation/widgets/page_title.dart';
import 'package:stocks_stream/src/presentation/widgets/stock_list_item.dart';
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
                      title: "BONDS",
                      subtitle: "0 Items",
                    ),
                    CustomIcon(
                      icon: "assets/icons/search.svg",
                      size: 22,
                    ),
                  ],
                ),
                const SizedBox(height: 38),
                StockListItem(
                  action: () => Navigator.pushNamed(
                    context,
                    routes.details,
                  ),
                  image:
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Apple_logo_black.svg/833px-Apple_logo_black.svg.png",
                  shortName: "AAPL",
                  name: "Apple, Inc.",
                  price: "\$393.43",
                  change: "+3.12%",
                ),
                const SizedBox(height: 26),
                const StockListItem(
                  image:
                      "https://seeklogo.com/images/A/adobe-logo-EB46CA63ED-seeklogo.com.png",
                  shortName: "ADBE",
                  name: "Adobe Systems",
                  price: "\$455.27",
                  change: "+4.42%",
                ),
                const SizedBox(height: 26),
                const StockListItem(
                  image:
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/150px-Google_%22G%22_Logo.svg.png",
                  shortName: "GOOGL",
                  name: "Alphabet Inc.",
                  price: "\$1,515.55",
                  change: "+0.02%",
                ),
                const SizedBox(height: 26),
                const StockListItem(
                  image:
                      "https://upload.wikimedia.org/wikipedia/commons/d/de/Amazon_icon.png",
                  shortName: "AMZN",
                  name: "Amazon.com Inc.",
                  price: "\$3,196.84",
                  change: "+0.02%",
                ),
                const SizedBox(height: 26),
                const StockListItem(
                  image:
                      "https://www.freepnglogos.com/uploads/berkshire-hathaway-logo-png/berkshire-hathaway-logo-home-berkshire-hathaway-homeservices-new-mexico-33.png",
                  shortName: "BRK.A",
                  name: "Berkshire Hathaway",
                  price: "\$190.09",
                  change: "+0.02%",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
