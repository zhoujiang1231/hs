interface A{
    public String getName();
}
public class Test{
    public static void main(String[] args){
        new Test().test(()->new String("aa"));
    }
    public void test(A a){
        System.out.print(a.getName());
    }
}
