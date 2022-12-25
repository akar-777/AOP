package com.tosan.AOP.aspectjSample;

public class Account {
    int balance = 20;

    public boolean withdraw(int amount) {
        System.out.println("withdraw method is executing....");
        if (balance < amount) {
            return false;
        }
        balance = balance - amount;
        return true;
    }
}
