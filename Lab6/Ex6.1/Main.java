import java.io.*;

public class Main {
    static public void main(String argv[]){
        try {
            scanner l = new scanner(new FileReader(argv[0]));
            parser p = new parser(l);
            p.parse();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
