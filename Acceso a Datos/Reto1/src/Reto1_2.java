import java.io.*;

//Carpeta con subcarpetas y dentro de las mismas, un archivo (uno con la bandera).
public class Reto1_2 {
    private File dir=new File("challengeClues/Carpeta de pista");
    final String notRelevant="No es información relevante";

    public Reto1_2(){}
    // Filtro recursivo directorio - archivo
    public void findFlagFile(File f){
        var path=f.getPath();
        if(f.isDirectory()){
             var aux=f.list();
             for(String ff:aux){
                 findFlagFile(new File(path+"\\"+ff));
             }

        }
        else if(isRelevant(f)){
            try{
                BufferedReader bf=new BufferedReader (new FileReader(f));
                String result="";
                for(String i;(i=bf.readLine())!=null;result=result+i);
                System.out.println("Archivo: "+f.getAbsolutePath()+"\n"+"Resultado: "+result);
                bf.close();
            }
            catch (IOException ioe){}

        }

    }
    private boolean isRelevant(File f){
        boolean flag=false;

        try{
            BufferedReader bf=new BufferedReader(new FileReader(f));
                if (!(bf.readLine().equalsIgnoreCase(notRelevant))) flag = true;
                bf.close();
            }
        catch(IOException ioe){
            System.out.println("ioe");
        }
        return flag;
    }

    public File getDir() {
        return dir;
    }
}
