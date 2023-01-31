import java.io.*;
import java.net.Socket;

public class ServerTask implements Runnable {
    ProcessBuilder pb;
    String command = "";
    String msg = "";
    Socket client;
    BufferedWriter clientOut;
    BufferedReader clientIn;

    public ServerTask(Socket client) throws IOException {
        this.client = client;
        clientIn = new BufferedReader(new InputStreamReader(client.getInputStream()));
        clientOut = new BufferedWriter(new OutputStreamWriter(client.getOutputStream()));
    }

    @Override
    public void run() {
        try {
            while (true) {
                System.out.println("Hilo: Esperando comando...");
                command = clientIn.readLine();
                System.out.println("Hilo:" + Thread.currentThread().getName() + " ejecutando --> " + command);

                switch (command) {
                    case "dir", "date", "whoami", "tasklist", "ls", "pwd" -> {
                        pb = new ProcessBuilder(command);
                        var p = pb.start();

                        var brIn = p.inputReader();
                        msg = brIn.readLine() + "\n";
                    }
                    case "exit" -> {
                        msg = "bye \n";
                        client.close();
                    }
                    default -> msg = "Error 404" + "\n";
                }
                clientOut.write(msg);
                clientOut.flush();
            }
        } catch (IOException ioe) {
            System.out.println(ioe);
        }
    }
}