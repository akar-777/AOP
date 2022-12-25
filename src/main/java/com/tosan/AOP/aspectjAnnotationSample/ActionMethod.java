package com.tosan.AOP.aspectjAnnotationSample;

public class SecuredMethod {
    @Secured(isLocked = true)
    public void lockedMethod() {
        System.out.println("\n locked method executed...\n");
    }

    @Secured(isLocked = false)
    public void unlockedMethod() {
        System.out.println("\n unlocked method executed... \n");
    }
}
