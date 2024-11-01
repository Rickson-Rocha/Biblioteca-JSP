package model;



public class Book {
    private int id;
    private String title;
    private String author;
    private String publisher;
    private int edition;
    private int year;
    private String cod;
    private int copies;


    public Book() {
    }

    public Book(int id, String title, String publisher, String author, int edition, int year, String cod, int copies) {
        this.id = id;
        this.title = title;
        this.publisher = publisher;
        this.author = author;
        this.edition = edition;
        this.year = year;
        this.cod = cod;
        this.copies = copies;
    }


    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public int getEdition() {
        return edition;
    }

    public void setEdition(int edition) {
        this.edition = edition;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public int getCopies() {
        return copies;
    }

    public void setCopies(int copies) {
        this.copies = copies;
    }

    public String getCod() {
        return cod;
    }

    public void setCod(String cod) {
        this.cod = cod;
    }
}
