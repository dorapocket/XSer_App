import 'package:dio/dio.dart';
import '../Utils/sqLiteUser.dart';
import 'dart:async';

class HttpUtils {
  static Dio dio;
  /// request method
  static Future<Map<dynamic, dynamic>> request(String url, {data, method}) async {
    data = data ?? {};
    method = method ?? 'get';
    /// restful 请求处理
    /// 
    String getdata="?";
    if(method=="get"||method=="GET"){
      data.forEach((key, value) {
        getdata+=key+'='+value+'&';
    });
    }
    
    print('请求：$method $url ${data.toString()}');

    Dio dio = createInstance();
    var result;
    try {
      Response response;
      if(method=="get"||method=="GET"){
        print("get method :"+url+getdata);
        response = await dio.get(url+getdata);
      }else{
        response = await dio.request(url,
        data: data, options: new Options(method: method));
      }
      result = response.data;
      print(response.data);
      if(response.statusCode==301){
        print('请登录${response.statusCode}');
      }

    } on DioError catch (e) {
      /// 打印请求失败相关信息
      print("错误类型: ${e}");
      if (e.type == DioErrorType.CONNECT_TIMEOUT ||
          e.type == DioErrorType.RECEIVE_TIMEOUT) {
        result = {'msg': '请求超时 Ծ‸ Ծ'};
      } else if (e.type == DioErrorType.DEFAULT) {
        result = {'msg': '服务器好像又死机了耶 Ծ‸ Ծ','code':404};
      } else {
        print("错误: ${e.response.data}");
        if(e.response.statusCode==301){
          final _sqlL = SqlLite();
          await _sqlL.open();
          await _sqlL.delLoginInfo();
        }
        e.response.data==null?result={'msg':'请求超时 Ծ‸ Ծ'}:result=e.response.data;
      }
    }
    return result;
  }

  /// 创建 dio 实例对象
  static Dio createInstance() {
    if (dio == null) {
      /// 全局属性：请求前缀、连接超时时间、响应超时时间
      BaseOptions options = new BaseOptions(
        baseUrl: 'https://xsapi.lgyserver.top',
        connectTimeout: 10000,
        receiveTimeout: 10000,
      );
      dio = new Dio(options);
    }
    return dio;
  }

  /// 清空 dio 对象
  static clear() {
    dio = null;
  }
}
