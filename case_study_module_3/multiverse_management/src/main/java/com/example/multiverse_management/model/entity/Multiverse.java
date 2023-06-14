package com.example.multiverse_management.model.entity;

public class Multiverse {
    private int id;
    private String name;
    private String detail;
    private String img;

    public Multiverse() {
    }

    public Multiverse(int id, String name, String detail, String img) {
        this.id = id;
        this.name = name;
        this.detail = detail;
        this.img = img;
    }


    public Multiverse(String name, String detail, String img) {
        this.name = name;
        this.detail = detail;
        this.img = img;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }


    @Override
    public String toString() {
        return " 💥 MULTIVERSE 💥 "
                + "\n" + "✨ UNIVERSE ID: " + getId()
                + "\n" + "✨ UNIVERSE NAME: " + getName()
                + "\n" + "✨ UNIVERSE DETAIL: " + getDetail();
    }
}
