package cn.yusui.xb.common.utils;

/**
 * Created by Administrator on 2019/1/14 0014.
 */
public class Hello {

    public static void main(String[] args) throws Exception {
        Hello hello = new Hello();
        hello.sayHello("word. bingo!");
    }

    public void sayHello(String word) {
        System.out.println("hello, " + word);
    }
}
