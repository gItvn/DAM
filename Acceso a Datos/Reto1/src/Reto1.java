
// Unzip challengeClues.zip
public class Reto1 {
    public static void main(String[] s) {
        try {
            System.out.println("-----------Bienvenidos al primer reto de programación-----------");
            Thread.sleep(3000);
            System.out.println("Será un CTF sobre archivos");
            Thread.sleep(3000);
            System.out.println("Archivos en: challengeClues \n");
            Thread.sleep(4000);
            System.out.flush();
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }

        System.out.println("~~ Escape Room ~~");
        System.out.println("Solución reto 1:");
        Reto1_1 r1=new Reto1_1();
        r1.filterCoincidences();
        r1.toStringGetFFiltered();

        // Segundo reto
        System.out.println("\n"+"Solución reto 2:");
        Reto1_2 r2=new Reto1_2();
        r2.findFlagFile(r2.getDir());

        // tercer reto
        Reto1_3 r3=new Reto1_3();
        System.out.print("\n"+" Solución reto 3:");
        System.out.println(r3.getCharEach());

    }
}
