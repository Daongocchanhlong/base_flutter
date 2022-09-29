import 'package:base_src/domain/model/work/work_result.dart';
import 'package:base_src/extension/enum_ex.dart';
import 'package:base_src/global/app_enum.dart';
import 'package:base_src/import.dart';
import 'package:base_src/page/home/home_ctrl.dart';
import 'package:base_src/widget/appbar_custom.dart';
import 'package:base_src/widget/check_box.dart';

class HomePage extends BaseScreen<HomeCtrl> {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget builder() => Scaffold(
        body: _buildBody(),
        appBar: AppBarCustom(textTitle: LocaleKeys.home_title.tr),
        backgroundColor: color.white.withOpacity(0.9),
      );

  @override
  HomeCtrl? putController() => HomeCtrl();

  Widget _buildBody() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 16.0),
          _buildMenu().marginSymmetric(horizontal: 16.0),
          const SizedBox(height: 24.0),
          Text(
            LocaleKeys.home_wordNeedToDo.tr,
            style: textStyle.bold(size: 16.0),
          ).marginSymmetric(horizontal: 16.0),
          const SizedBox(height: 16.0),
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: controller.works.length,
              itemBuilder: (context, index) =>
                  _buildItem(controller.works.elementAt(index)),
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(height: 8.0),
            ),
          ),
          const SizedBox(height: 16.0),
        ],
      );

  Widget _buildItem(WorkResult work) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: color.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 3.0,
              color: color.black.withOpacity(0.5),
              offset: const Offset(1, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                work.title ?? '',
                style: textStyle.custom(
                    size: 16.0,
                    fontWeight: FontWeight.w500,
                    textDecoration: (work.isDone ?? false)
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ),
            const SizedBox(width: 4.0),
            BaseCheckBox(
                value: work.isDone ?? false, size: 18, onChange: () {}),
          ],
        ),
      );

  Container _buildMenu() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      decoration: BoxDecoration(
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
      child: Column(
        children: [
          Row(
            children: [
              _buildItemMenu(TypeMenu.list),
              _buildItemMenu(TypeMenu.doctrine),
              _buildItemMenu(TypeMenu.exam),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            children: [
              _buildItemMenu(TypeMenu.fund),
              _buildItemMenu(TypeMenu.skill),
              _buildItemMenu(TypeMenu.another),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildItemMenu(TypeMenu type) => Expanded(
        child: InkWell(
          onTap: () => controller.onPress(type),
          child: Column(
            children: [
              _buildImage(type.image),
              const SizedBox(height: 8.0),
              Text(
                type.title,
                style: textStyle.medium(size: 14),
              )
            ],
          ),
        ),
      );

  Widget _buildImage(String path) => Image(
        image: AssetImage(path),
        height: 50,
        width: 50,
        fit: BoxFit.fill,
      );
}
