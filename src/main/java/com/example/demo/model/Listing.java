package com.example.demo.model;

import javax.persistence.*;
import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Objects;

@Entity
@Table(name = "listings", schema = "dorin_alexander_webshop", catalog = "")
public class Listing {
    private int listingId;
    private String title;
    private String itemCondition;
    private String description;
    private String price;
    private LocalDate date = LocalDate.now();
    private String contactinfo;
    private int typeId;
    private int accountId;

    @Id
    @Column(name = "listing_id", nullable = false)
    public int getListingId() {
        return listingId;
    }

    public void setListingId(int listingId) {
        this.listingId = listingId;
    }

    @Basic
    @Column(name = "title", nullable = false, length = 45)
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Basic
    @Column(name = "item_condition", nullable = false, length = 10)
    public String getItemCondition() {
        return itemCondition;
    }

    public void setItemCondition(String itemCondition) {
        this.itemCondition = itemCondition;
    }

    @Basic
    @Column(name = "description", nullable = false, length = 1000)
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Basic
    @Column(name = "price", nullable = false, length = 10)
    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    @Basic
    @Column(name = "date", nullable = true)
    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    @Basic
    @Column(name = "contactinfo", nullable = false, length = 140)
    public String getContactinfo() {
        return contactinfo;
    }

    public void setContactinfo(String contactinfo) {
        this.contactinfo = contactinfo;
    }

    @Basic
    @Column(name = "type_id", nullable = true)
    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    @Basic
    @Column(name = "account_id", nullable = true)
    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Listing listing = (Listing) o;
        return listingId == listing.listingId &&
                typeId == listing.typeId &&
                accountId == listing.accountId &&
                Objects.equals(title, listing.title) &&
                Objects.equals(itemCondition, listing.itemCondition) &&
                Objects.equals(description, listing.description) &&
                Objects.equals(price, listing.price) &&
                Objects.equals(date, listing.date) &&
                Objects.equals(contactinfo, listing.contactinfo);
    }

    @Override
    public int hashCode() {
        return Objects.hash(listingId, title, itemCondition, description, price, date, contactinfo, typeId, accountId);
    }
}
