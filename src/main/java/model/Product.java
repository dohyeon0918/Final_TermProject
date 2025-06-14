package model;

public class Product {
    private int productId;
    private String title;
    private String description;
    private int price;
    private String sellerId;
    private String image; 
    private String category;
    private String location;

    public Product() {}

    public Product(int productId, String title, String category, String description, int price, String sellerId, String image ,String location) {
        this.productId = productId;
        this.title = title;
        this.category = category;
        this.description = description;
        this.price = price;
        this.sellerId = sellerId;
        this.image = image;
        this.location = location;
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
    
    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }
    

    public String getLocation() {return location;}
    public void setLocation(String location) { this.location = location;}
}