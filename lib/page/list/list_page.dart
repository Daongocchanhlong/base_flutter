import 'package:base_src/import.dart';
import 'package:base_src/page/list/list_ctrl.dart';
import 'package:base_src/widget/appbar_custom.dart';

class ListPage extends BaseScreen<ListCtrl> {
  ListPage({Key? key}) : super(key: key);

  @override
  Widget builder() => Scaffold(
        body: _buildBody(),
        appBar: AppBarCustom(
          textTitle: 'Danh sách',
          textLeading: '',
          actionsWidget: InkWell(
            onTap: () => controller.openAddPopUp(),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Icon(
                Icons.add,
                color: color.black,
                size: 32,
              ),
            ),
          ),
        ),
        backgroundColor: color.white.withOpacity(0.9),
      );

  @override
  ListCtrl? putController() => ListCtrl();

  Widget _buildBody() => Column(
        children: [
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(right: 16.0, left: 16.0, top: 8.0),
              itemBuilder: (BuildContext context, int index) =>
                  _buildItemMember(),
              itemCount: 10,
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(height: 16.0),
            ),
          ),
          const SizedBox(height: 8.0),
        ],
      );

  Widget _buildItemMember() => InkWell(
        onLongPress: () => controller.openPopUp(),
        onTap: () => controller.openBottom(),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: color.green),
            borderRadius: BorderRadius.circular(10.0),
            color: color.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 10.0,
                color: color.black.withOpacity(0.5),
                offset: const Offset(3, 4), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildIconMember(),
              const SizedBox(width: 8.0),
              _buildMemberInfo()
            ],
          ),
        ),
      );

  Widget _buildIconMember() => Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: <Color>[
              color.yellowBgr,
              color.orangeBgr,
            ],
          ),
        ),
        child: const Icon(Icons.person, size: 48),
      );

  Widget _buildMemberInfo() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 8.0),
          Row(
            children: <Widget>[
              Text(
                "Nguyễn Kim Ngân",
                style: textStyle.medium(size: 16, color: color.green),
              ),
              const SizedBox(width: 4.0),
              Visibility(
                visible: true,
                child: Icon(
                  Icons.star,
                  color: color.orangeBgr,
                  size: 16,
                ),
              )
            ],
          ),
          const SizedBox(height: 6.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              InkWell(
                onTap: () {},
                child: Text(
                  "0708028705",
                  style: textStyle.custom(
                    size: 16,
                    color: color.green,
                    fontWeight: FontWeight.w500,
                    textDecoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(width: 24.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "Điểm :",
                    style: textStyle.medium(size: 16, color: color.green),
                  ),
                  SizedBox(
                    width: 70.width,
                    child: Text(
                      "1000",
                      style: textStyle.medium(size: 20, color: color.red10),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      );
}
