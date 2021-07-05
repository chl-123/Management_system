package com.management.utils.util;



import com.management.utils.constant.Constant;

import javax.servlet.http.HttpServletRequest;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Util {

  /**
   * 对明文字符串进行MD5加密
   *
   * @param source 传入的明文字符串
   * @return 加密结果
   */
  public static String md5(String source) {

    // 1.判断source是否有效
    if (source == null || source.length() == 0) {

      // 2.如果不是有效的字符串抛出异常
      throw new RuntimeException(Constant.MESSAGE_STRING_INVALIDATE);
    }

    try {
      // 3.获取MessageDigest对象
      String algorithm = "md5";

      MessageDigest messageDigest = MessageDigest.getInstance(algorithm);

      // 4.获取明文字符串对应的字节数组
      byte[] input = source.getBytes();

      // 5.执行加密
      byte[] output = messageDigest.digest(input);

      // 6.创建BigInteger对象
      int signum = 1;
      BigInteger bigInteger = new BigInteger(signum, output);

      // 7.按照16进制将bigInteger的值转换为字符串
      int radix = 16;
      String encoded = bigInteger.toString(radix).toUpperCase();

      return encoded;

    } catch (NoSuchAlgorithmException e) {
      e.printStackTrace();
    }

    return null;
  }

  /**
   * 判断当前请求是否为Ajax请求
   *
   * @param request 请求对象
   * @return true：当前请求是Ajax请求 false：当前请求不是Ajax请求
   */
  public static boolean judgeRequestType(HttpServletRequest request) {
    // 1.获取请求消息头
    String acceptHeader = request.getHeader("Accept");
    String xRequestHeader = request.getHeader("X-Requested-With");
    // 2.判断
    return (acceptHeader != null && acceptHeader.contains("application/json"))
        || (xRequestHeader != null && xRequestHeader.equals("XMLHttpRequest"));
  }

  public static String createDate(String DateFormat) {
    Date date = new Date();
    SimpleDateFormat format = new SimpleDateFormat(DateFormat);
    String createTime = format.format(date);
    return createTime;
  }
//  public PageInfo<T> getPage(int pageNum, int pageSize,Integer pageTotalCount,List<T> items) {
//    PageInfo<T> pageInfo = new PageInfo<>();
//
//    // 设置每页显示的数量
//    pageInfo.setPageSize(pageSize);
//    // 求总记录数
////    Integer pageTotalCount = bookDao.queryForPageTotalCount();
//    // 设置总记录数
//    pageInfo.setPageTotalCount(pageTotalCount);
//    // 求总页码
//    Integer pageTotal = pageTotalCount / pageSize;
//    if (pageTotalCount % pageSize > 0) {
//      pageTotal+=1;
//    }
//    // 设置总页码
//    pageInfo.setPageTotal(pageTotal);
//
//    // 设置当前页码
//    pageInfo.setPageNum(pageNum);
//
//    // 求当前页数据的开始索引
//    int begin = (pageInfo.getPageNum() - 1) * pageSize;
//    // 求当前页数据
////    List<Book> items = bookDao.queryForPageItems(begin,pageSize);
//    // 设置当前页数据
//    pageInfo.setItems(items);
//
//    return pageInfo;
//  }


}
