public class Test{
    public static void main(String[] args){
        try {
            te();
        }catch (Exception e){
            e.printStackTrace();
        }
        /*try{
            int i = 1/0;
        }catch (Exception e){
            e.printStackTrace();
            //System.out.print("异常处理");
            //throw new Exception();
        }*/
        /*if(1>=0){
            //throw new RuntimeException();
           throw new IllegalArgumentException();
        }*/
        System.out.println("123");
    }

    public static void te(){
        if(1>=0){
            throw new IllegalArgumentException();
        }
        //throw new IllegalArgumentException();
        System.out.println("aaaaa");
        /*if(1<=0){
            throw new Exception("aaa");
        }*/
    }
}
