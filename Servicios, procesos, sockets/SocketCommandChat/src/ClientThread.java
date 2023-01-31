import java.io.*;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.util.Scanner;

public class ClientThread implements Runnable {
    @Override
    public void run() {
        try {
            Socket client = new Socket();

            Scanner sc = new Scanner(System.in);
            String command;
            String msg;
            BufferedReader in;
            BufferedWriter out;

            client.connect(new InetSocketAddress("localhost", 1500));

            in = new BufferedReader(new InputStreamReader(client.getInputStream()));
            out = new BufferedWriter(new OutputStreamWriter(client.getOutputStream()));

            while (true) {
                System.out.println("Introduzca el comando -->  ");
                command = sc.nextLine().trim();
                out.write(command + "\n");
                out.flush();

                msg = in.readLine();

                if (msg.equalsIgnoreCase("Error 404")) {
                    System.out.println("Comando <" + command + "> no reconocido\n");
                } else {
                    System.out.println(msg);
                }
            }
        } catch (IOException ioe) {
            System.out.println(ioe);
        }
    }
}
