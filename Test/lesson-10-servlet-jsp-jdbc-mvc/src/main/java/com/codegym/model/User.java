package com.codegym.model;

public class User {
    private long id;
    private String fullName;
    private String userName;
    private String passWord;
    private String email;
    private String address;

    private Integer roleId;

    public User() {
    }

    public User(long id, String fullName, String userName, String passWord, String email, String address, Integer roleId) {
        this.id = id;
        this.fullName = fullName;
        this.userName = userName;
        this.passWord = passWord;
        this.email = email;
        this.address = address;
        this.roleId = roleId;
    }

    public User(String fullName, String userName, String passWord, String email, String address, Integer roleId) {
        this.fullName = fullName;
        this.userName = userName;
        this.passWord = passWord;
        this.email = email;
        this.address = address;
        this.roleId = roleId;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
