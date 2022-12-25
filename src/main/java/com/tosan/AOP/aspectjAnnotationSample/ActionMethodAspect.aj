package com.tosan.AOP.aspectjAnnotationSample;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public class SecuredMethodAspect {
    @Pointcut("@annotation(secured)")
    public void callAt(Secured secured) {
    }

    @Around("callAt(secured)")
    public Object around(ProceedingJoinPoint pjp, Secured secured) throws Throwable {
        System.out.println("around SecuredMethodAspect is running..." + secured);
        Object o = !secured.isLocked() ? null : pjp.proceed();
        System.out.println("around SecuredMethodAspect is finished--> " + o);
        return o;
    }
}