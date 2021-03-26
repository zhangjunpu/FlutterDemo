
/// 通用模型
/// [author] junpu
/// [date] 2020/9/15
class StatusBean<T> {
  bool rlt;
  String msg;
  String code;
  T data;

  StatusBean.fromJsonMap(Map<String, dynamic> map)
      : rlt = map["rlt"],
        msg = map["msg"],
        code = map["code"],
        data = map["data"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rlt'] = rlt;
    data['msg'] = msg;
    data['code'] = code;
    data['data'] = data != null ? data : null;
    return data;
  }
}
