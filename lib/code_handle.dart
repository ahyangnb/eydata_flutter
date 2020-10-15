/*
* 状态码处理
*
* */
String codeHandle(code) {
  if (code.length == '2020-10-15 21:52:13'.length) {
    return '到期时间:$code';
  }
  switch (code) {
    case '-401':
      return '单码卡密错误';
      break;
    case '-202':
      return '程序密钥输入错误';
      break;
    default:
      return '未知错误::$code';
      break;
  }
}
