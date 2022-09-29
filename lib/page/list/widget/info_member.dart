import 'package:base_src/base/base_controller.dart';
import 'package:base_src/base/base_widget.dart';
import 'package:base_src/global/app_dimension.dart';
import 'package:base_src/global/app_path.dart';

class InfoMember extends BaseWidget<BaseController> {
  InfoMember({
    Key? key,
  }) : super(key: key);

  @override
  Widget builder() => Column(
        children: <Widget>[
          const SizedBox(height: 16.0),
          Image(
            image: AssetImage(
              AppPath.logo,
            ),
            width: 100.width,
            fit: BoxFit.fitWidth,
          ),
          const SizedBox(height: 16.0),
          _buildTextRow(Icons.person, "Nguyễn Kim Ngân"),
          const SizedBox(height: 4.0),
          _buildTextRow(Icons.personal_injury, "Tâm Hải"),
          const SizedBox(height: 4.0),
          _buildTextRow(Icons.call, "0708028705"),
          const SizedBox(height: 4.0),
          _buildTextRow(Icons.location_on, "123 Điện Biên Phủ"),
          const SizedBox(height: 4.0),
          _buildTextRow(Icons.star, "100"),
          const SizedBox(height: 16.0),
        ],
      );

  Widget _buildTextRow(IconData icon, String value) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: color.green),
        borderRadius: BorderRadius.circular(10.0),
        color: color.white,
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12.0),
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
            child: Icon(
              icon,
              size: 16.0,
              color: color.black,
            ),
          ),
          const SizedBox(width: 4.0),
          Text(value, style: textStyle.medium(size: 16.0, color: color.green)),
        ],
      ),
    );
  }
}
