import 'dart:async';
import 'package:dio/dio.dart';
import '../config/service_url.dart';

// 通用请求方法
Future request(url, formData) async {
  try {
    print('开始获取数据----------------');
    Response response;
    Dio dio = new Dio();
    dio.options.contentType = Headers.formUrlEncodedContentType;
    // 区分是否有传参
    if (formData == null) {
      response = await dio.post(servicePath[url]);
    } else {
      response = await dio.post(servicePath[url], data: formData);
    }
    if (response.statusCode == 200) {
      print(response.data.shopInfo);
      return response.data;
    } else {
      throw Exception('后端接口出现异常');
    }
  } catch (e) {
    return print('ERROR:=============>$e');
  }
}

//获取主页主题内容
Future getHomePageContent() async {
  try {
    print('开始获取首页数据----------------');
    Response response;
    Dio dio = new Dio();
    dio.options.contentType = Headers.formUrlEncodedContentType;
    var formData = {'lon': '115.02998', 'lat': '35.79032'};
    response = await dio.post(servicePath['homePageContent'], data: formData);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常');
    }
  } catch (e) {
    return print('ERROR:=============>$e');
  }
}

//获取火爆专区数据
Future getHomePageBelowContent() async {
  try {
    print('开始获取火爆专区数据----------------');
    Response response;
    Dio dio = new Dio();
    dio.options.contentType = Headers.formUrlEncodedContentType;
    int page = 1;

    response = await dio.post(servicePath['homePageBelowConten'], data: page);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常');
    }
  } catch (e) {
    return print('ERROR:=============>$e');
  }
}
