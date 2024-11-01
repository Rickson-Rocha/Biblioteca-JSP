package data;

import model.Book;

import java.sql.*;
import java.util.ArrayList;

public class DataBase {
    private Connection conn;
    private Statement stmt;
    private ResultSet rs;
    private static DataBase b = new DataBase();

    private String url = "jdbc:mysql://library.clkiqc8m2zfr.us-east-2.rds.amazonaws.com/library";
    private String usr = "admin";
    private String pass = "Banco4444";

    public DataBase() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, usr, pass);
            stmt = conn.createStatement();
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
    }


    public String getUser(String login) {
        String fullName = "";
        String query = "SELECT name_user FROM user WHERE login = '" + login + "'";

        try (ResultSet rs = stmt.executeQuery(query)) {
            if (rs.next()) {
                fullName = rs.getString("name_user");
            }
        } catch (Exception e) {
            System.out.println("Error when searching for user: " + e.getMessage());
        }
        return fullName;
    }
    public String getPassword(String login) throws SQLException {
        String password = "";


        rs = stmt.executeQuery("SELECT * FROM user WHERE login_user = '" + login + "'");


        while (rs.next()) {
            password = rs.getString("password_user");
        }

        return password;
    }

    public ArrayList<Book> getBookByTitle(String title) throws SQLException {

        ArrayList<Book> books = new ArrayList<Book>();
        rs = stmt.executeQuery("SELECT * FROM books WHERE title LIKE '%" + title + "%'");

        while (rs.next()) {
            Book book = new Book();
            book.setTitle(rs.getString("title"));
            book.setAuthor(rs.getString("author"));
            book.setCopies(rs.getInt("copies"));

            books.add(book);
        }

        return books;
    }


    public void createBook(int id, String title, String author, String publisher, int edition, int year, String cod, int copies) {
        // Corrigindo a construção da consulta SQL
        String query = "INSERT INTO books (id, title, author, publisher, edition, year, cod, copies) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setInt(1, id);                // ID como inteiro
            pstmt.setString(2, title);          // Título como string
            pstmt.setString(3, author);         // Autor como string
            pstmt.setString(4, publisher);      // Editora como string
            pstmt.setInt(5, edition);           // Edição como inteiro
            pstmt.setInt(6, year);              // Ano como inteiro
            pstmt.setString(7, cod);            // Código como string
            pstmt.setInt(8, copies);            // Cópias como inteiro

            pstmt.executeUpdate();              // Executa a inserção
        } catch (Exception e) {
            System.out.println("Error creating book: " + e.getMessage());
        }
    }

    public void deleteBook(String title) {
        String query = "DELETE FROM books WHERE title = '" + title + "'";

        try {
            stmt.executeUpdate(query);
        } catch (Exception e) {
            System.out.println("Error when deleting book " + e.getMessage());
        }
    }


    public void updateBook(String oldTitle, String newTitle, String author, String publisher, int edition, int year, String cod, int copies) {
        String query = "UPDATE books SET title = '" + newTitle + "', author = '" + author + "', publisher = '" + publisher + "', " +
                "edition = " + edition + ", year = " + year + ", cod = '" + cod + "', copies = " + copies +
                " WHERE title = '" + oldTitle + "'";

        try {
            stmt.executeUpdate(query);
        } catch (Exception e) {
            System.out.println("Error updating book: " + e.getMessage());
        }
    }

    public static DataBase getInstance() {
        return b;
    }

    public Connection getConnection() {
        return conn;
    }
}