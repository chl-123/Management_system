package com.management.mybatis;

import com.management.utils.util.Util;
import org.junit.Test;

public class OtherTest {
    @Test
    public void md5Test(){
        String s = Util.md5("123456789");
        System.out.println(s);
    }
}
