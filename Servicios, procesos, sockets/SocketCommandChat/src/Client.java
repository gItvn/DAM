import java.io.*;
import java.util.Random;


public class Client {
    public static void main(String[] args) throws IOException {
        Random r = new Random();
        var auxInt = r.nextInt(10) + 1;
        System.out.println("Se crearan " + auxInt + " hilos.");
        for (int i = 0; i < auxInt; i++) {
            new Thread(new ClientThread()).start();
        }

    }
}