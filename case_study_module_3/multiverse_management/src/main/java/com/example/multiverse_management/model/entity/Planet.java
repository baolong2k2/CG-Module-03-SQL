package com.example.multiverse_management.model.entity;

public class Planet {
    private int id;
    private String name;
    private String detail;
    private String typeOfCreature;
    private String environment;
    private String civilization;
    private String img;

    public Planet() {
    }

    public Planet(int id, String name, String detail, String typeOfCreature, String environment, String civilization, String img) {
        this.id = id;
        this.name = name;
        this.detail = detail;
        this.typeOfCreature = typeOfCreature;
        this.environment = environment;
        this.civilization = civilization;
        this.img = img;
    }

    public Planet(String name, String detail, String typeOfCreature, String environment, String civilization, String img) {
        this.name = name;
        this.detail = detail;
        this.typeOfCreature = typeOfCreature;
        this.environment = environment;
        this.civilization = civilization;
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

    public String getTypeOfCreature() {
        return typeOfCreature;
    }

    public void setTypeOfCreature(String typeOfCreature) {
        this.typeOfCreature = typeOfCreature;
    }

    public String getEnvironment() {
        return environment;
    }

    public void setEnvironment(String environment) {
        this.environment = environment;
    }

    public String getCivilization() {
        return civilization;
    }

    public void setCivilization(String civilization) {
        this.civilization = civilization;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }


    @Override
    public String toString() {
        return " *** Planet *** "
                + "\n" + "✨ Planet id: " + getId()
                + "\n" + "✨ Planet name: " + getName()
                + "\n" + "✨ Planet detail: " + getDetail()
                + "\n" + "✨ Type of creature: " + getTypeOfCreature()
                + "\n" + "✨ Environment: " + getEnvironment()
                + "\n" + "✨ Civilization: " + getCivilization();
    }
}
