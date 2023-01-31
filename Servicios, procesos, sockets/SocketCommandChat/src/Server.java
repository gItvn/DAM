import com.sun.net.httpserver.HttpsServer;

import java.io.*;
import java.net.*;
import java.util.ArrayList;

public class Server {
    public static void main(String[] args) throws IOException, InterruptedException {
        final InetSocketAddress ADDRESS = new InetSocketAddress("localhost", 1500);
        ServerSocket server;
        Socket client;
        ArrayList<Thread> threadArrayList = new ArrayList<>();
        server = new ServerSocket();
        server.bind(ADDRESS);


        while (true) {
            System.out.println("Servidor: esperando peticiones");
            client = server.accept();
            System.out.println("Servidor: recibida de: " + client.getLocalAddress().getHostAddress());
            Thread t=new Thread(new ServerTask(client));
            t.join(15000);
            threadArrayList.add(t);
            t.start();
        }
    }
}
