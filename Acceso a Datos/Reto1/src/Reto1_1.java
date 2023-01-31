import java.io.*;
import java.util.HashSet;

// Archivo con multiples enlaces
public class Reto1_1  {
    private File clue;
    private HashSet<String> hs;
    private String [] fFiltered;
    public Reto1_1() {
            clue = new File("challengeClues/pista1.txt");
    }

    // Adaptado de idea inicial dirigida a recoger Strings para hacer fuerza bruta con búsquedas
    public void filterCoincidences(){
        try {
            BufferedReader br = new BufferedReader(new FileReader(clue));
            hs=new HashSet<>();
            try {
                String tmp = "";
                while ((tmp = br.readLine()) != null) {
                    hs.add(tmp);
                }

                if(!hs.isEmpty()){
                    fFiltered=new String[hs.size()];
                    hs.toArray(fFiltered);
                }
                else{
                    System.out.println("Archivo vacio");
                }
            }
            catch (IOException ioe) {
                System.out.println("IOe error");
            }
            finally {
                br.close();
            }
        }
        catch (IOException ioe){
            System.out.println("ioe");
        }
    }
    public void toStringGetFFiltered(){
        for(String s :fFiltered){
            System.out.println("link: "+s);
        }
    }

    public void setfFiltered(String[] fFiltered) {
        this.fFiltered = fFiltered;
    }
}
