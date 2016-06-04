import java.io.*;

public class Main {
    
    public static String file_name;
    static public void main(String argv[]){
        file_name = argv[0];
        try {
            scanner l = new scanner(new FileReader(file_name));
            parser p = new parser(l);
            p.parse();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
