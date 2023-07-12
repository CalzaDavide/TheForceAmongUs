package Controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.UUID;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/upload")
@MultipartConfig
public class ImageUploadServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://127.0.0.1:3306/?user=root";
    private static final String DB_USERNAME = "root";
    private static final String DB_PASSWORD = "Pippo123";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String uploadPath = "src/main/webapp/images"; // Percorso in cui salvare le immagini sul server

        // Crea la cartella di destinazione se non esiste
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        // Legge l'immagine inviata dall'utente
        Part filePart = request.getPart("image");
        String fileName = generateUniqueFileName(filePart);
        String filePath = uploadPath + File.separator + fileName;

        // Salva l'immagine sul server
        try (OutputStream out = new FileOutputStream(filePath);
             InputStream fileContent = filePart.getInputStream()) {
            int read;
            byte[] buffer = new byte[4096];
            while ((read = fileContent.read(buffer)) != -1) {
                out.write(buffer, 0, read);
            }
        } catch (IOException e) {
            // Gestione dell'errore di salvataggio dell'immagine
            // Puoi definire come gestire l'errore a tua discrezione
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            return;
        }

        // Salva il riferimento all'immagine nel database
        saveImageToDatabase(fileName);

        // Invia una risposta di successo al frontend
        response.getWriter().println("L'immagine è stata caricata con successo!");
    }

    private String generateUniqueFileName(Part part) {
        String originalFileName = getFileName(part);
        String extension = originalFileName.substring(originalFileName.lastIndexOf("."));
        return UUID.randomUUID().toString() + extension;
    }

    private String getFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        String[] tokens = contentDisposition.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf("=") + 2, token.length() - 1);
            }
        }
        return "";
    }

    private void saveImageToDatabase(String fileName) {
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD)) {
            String query = "INSERT INTO images (File_name) VALUES (?)";
            PreparedStatement statement = conn.prepareStatement(query);
            statement.setString(1, fileName);
            statement.executeUpdate();
        } catch (SQLException e) {
            // Gestione dell'errore di salvataggio nel database
            // Puoi definire come gestire l'errore a tua discrezione
            e.printStackTrace();
        }
    }
}
