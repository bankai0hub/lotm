package com.lotm;

import com.sun.net.httpserver.HttpExchange;
import com.sun.net.httpserver.HttpHandler;
import com.sun.net.httpserver.HttpServer;

import java.io.IOException;
import java.io.OutputStream;
import java.net.InetSocketAddress;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class AppServer {
    private static DatabaseManager db = new DatabaseManager();
    private static final String ADMIN_PASSWORD = "SefirahPassword123"; // User requested a password

    public static void main(String[] args) throws IOException {
        int port = 8080;
        HttpServer server = HttpServer.create(new InetSocketAddress(port), 0);
        
        server.createContext("/api/pathways", new PathwaysHandler());
        server.createContext("/api/artifacts", new ArtifactsHandler());
        server.createContext("/api/members", new MembersHandler());
        server.createContext("/api/pathways/", new SequenceDetailHandler()); // For /api/pathways/{id}/sequences
        server.createContext("/api/insert", new InsertHandler());
        
        server.setExecutor(null); // creates a default executor
        System.out.println("Sefirah Castle API Server started on port " + port);
        server.start();
    }

    static class PathwaysHandler implements HttpHandler {
        @Override
        public void handle(HttpExchange t) throws IOException {
            addCorsHeaders(t);
            if (t.getRequestMethod().equalsIgnoreCase("OPTIONS")) {
                t.sendResponseHeaders(204, -1);
                return;
            }
            
            List<Map<String, Object>> pathways = db.executeQuery("SELECT * FROM pathways");
            String response = convertToJson(pathways);
            sendResponse(t, response);
        }
    }

    static class ArtifactsHandler implements HttpHandler {
        @Override
        public void handle(HttpExchange t) throws IOException {
            addCorsHeaders(t);
            List<Map<String, Object>> artifacts = db.executeQuery("SELECT * FROM artifacts");
            String response = convertToJson(artifacts);
            sendResponse(t, response);
        }
    }

    static class MembersHandler implements HttpHandler {
        @Override
        public void handle(HttpExchange t) throws IOException {
            addCorsHeaders(t);
            List<Map<String, Object>> members = db.executeQuery("SELECT * FROM tarot_club");
            String response = convertToJson(members);
            sendResponse(t, response);
        }
    }

    static class SequenceDetailHandler implements HttpHandler {
        @Override
        public void handle(HttpExchange t) throws IOException {
            addCorsHeaders(t);
            String path = t.getRequestURI().getPath();
            // Path looks like /api/pathways/1/sequences
            String[] parts = path.split("/");
            if (parts.length >= 4) {
                String pathwayId = parts[3];
                List<Map<String, Object>> sequences = db.executeQuery("SELECT * FROM sequences WHERE pathway_id = " + pathwayId);
                String response = convertToJson(sequences);
                sendResponse(t, response);
            } else {
                t.sendResponseHeaders(404, -1);
            }
        }
    }

    static class InsertHandler implements HttpHandler {
        @Override
        public void handle(HttpExchange t) throws IOException {
            addCorsHeaders(t);
            if (t.getRequestMethod().equalsIgnoreCase("POST")) {
                // Simplified POST handling for this demonstration
                // In a real app, you'd parse the body and check the password
                String auth = t.getRequestHeaders().getFirst("X-Admin-Password");
                
                if (auth != null && auth.equals(ADMIN_PASSWORD)) {
                    // Logic to parse JSON and insert would go here
                    // For now, return a success placeholder
                    sendResponse(t, "{\"status\": \"success\", \"message\": \"Authorized\"}");
                } else {
                    t.sendResponseHeaders(401, -1);
                }
            }
        }
    }

    private static void addCorsHeaders(HttpExchange t) {
        t.getResponseHeaders().add("Access-Control-Allow-Origin", "*");
        t.getResponseHeaders().add("Access-Control-Allow-Methods", "GET, POST, OPTIONS");
        t.getResponseHeaders().add("Access-Control-Allow-Headers", "Content-Type, X-Admin-Password");
    }

    private static void sendResponse(HttpExchange t, String response) throws IOException {
        t.getResponseHeaders().set("Content-Type", "application/json");
        t.sendResponseHeaders(200, response.getBytes().length);
        OutputStream os = t.getResponseBody();
        os.write(response.getBytes());
        os.close();
    }

    private static String convertToJson(List<Map<String, Object>> list) {
        return "[" + list.stream()
                .map(m -> "{" + m.entrySet().stream()
                        .map(e -> "\"" + e.getKey() + "\": \"" + String.valueOf(e.getValue()).replace("\"", "\\\"") + "\"")
                        .collect(Collectors.joining(",")) + "}")
                .collect(Collectors.joining(",")) + "]";
    }
}
