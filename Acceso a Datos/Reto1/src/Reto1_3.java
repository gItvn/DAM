import java.io.*;
//Pista3:volcado del contenido de una página
public class Reto1_3 {
    File clue = new File("challengeClues/Pista3.txt");

    public Reto1_3() {}
    //char de la flag en cada 100 posiciones hasta 2700
    public String getCharEach() {
        String result="";
        int i=0;
        int tmp;
        try {
           BufferedReader br=new BufferedReader(new FileReader(clue));
           while(i<2700){
                tmp=br.read();
                i++;
               if(i%100==0){
                   result=result+(char)tmp;
               }
           }
        }
        catch (IOException ioe) {}

        return result;
    }
}
