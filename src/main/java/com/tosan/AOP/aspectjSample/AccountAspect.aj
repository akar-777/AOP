package com.tosan.AOP.aspectjSample;

public aspect AccountAspect {
    final int MIN_BALANCE = 10;

    pointcut callWithDraw(int amount, Account acc):
            call(boolean Account.withdraw(int)) && args(amount) && target(acc);

    before(int amount, Account acc): callWithDraw(amount, acc) {
        System.out.println("\n before aspect is executing ... \n");
    }

    boolean around(int amount, Account acc):
            callWithDraw(amount, acc) {
//        if (acc.balance < amount) {
//            return false;
//        }
        long startTime = System.currentTimeMillis();
        System.out.println("\n around aspect is going to execute process method ... \n");
        boolean proceed = proceed(amount, acc);
        for(int i=0;i<100000;i++)
            continue;
        long duration = System.currentTimeMillis() - startTime;
        System.out.println(String.format("\n aspect method is proceed successfully. Time elapsed {%d} ms.  \n", duration));
        return proceed;
    }

    after(int amount, Account balance): callWithDraw(amount, balance) {
        System.out.println("\n after aspect is executing... \n ");
    }
}
