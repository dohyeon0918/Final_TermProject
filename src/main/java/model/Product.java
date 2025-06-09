package model;

public class Product {
    private int productId;
    private String title;
    private String description;
    private int price;
    private String sellerId;
    private String image; 

    public Product() {}

    public Product(int productId, String title, String description, int price, String sellerId, String image) {
        this.productId = productId;
        this.title = title;
        this.description = description;
        this.price = price;
        this.sellerId = sellerId;
        this.image = image;
        
    }

    // Getter & Setter
    public int getProductId() { return productId; }
    public void setProductId(int productId) { this.productId = productId; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public int getPrice() { return price; }
    public void setPrice(int price) { this.price = price; }

    public String getSellerId() { return sellerId; }
    public void setSellerId(String sellerId) { this.sellerId = sellerId; }
    
    public String getImage() {return image;}
    public void setImage(String image) {this.image = image;}
}