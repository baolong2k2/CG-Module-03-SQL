package com.example.multiverse_management.model.entity;

public class Scientist extends User{
    public Scientist(){
        super();
    }

    public Scientist(String userName, String fullName, String phoneNumber, String email, String passWord, String address, String avatar) {
        super(userName, fullName, phoneNumber, email, passWord, address, avatar);
    }

    public Scientist(int id, String userName, String fullName, String phoneNumber, String email, String passWord, String address, String avatar) {
        super(id, userName, fullName, phoneNumber, email, passWord, address, avatar);
    }

    public Scientist(String fullName, String phoneNumber, String email, String passWord, String address, String avatar) {
        super(fullName, phoneNumber, email, passWord, address, avatar);
    }

}
