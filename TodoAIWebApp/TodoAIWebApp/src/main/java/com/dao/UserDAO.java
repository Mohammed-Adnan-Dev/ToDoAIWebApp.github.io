package com.dao;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.model.User;

public class UserDAO {

    public User getUserByUsername(String username) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        User user = null;
        try {
            Query<User> query = session.createQuery("FROM User WHERE username = :username", User.class);
            query.setParameter("username", username);
            user = query.uniqueResult();
        } finally {
            session.close();
        }
        return user;
    }

    public User validateUser(String username, String password) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        User user = null;
        try {
            Query<User> query = session.createQuery(
                "FROM User WHERE username = :username AND password = :password", User.class);
            query.setParameter("username", username);
            query.setParameter("password", password);
            user = query.uniqueResult();
        } finally {
            session.close();
        }
        return user;
    }

    public void saveUser(User user) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.save(user);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        }
    }
    
    
    public void registerUser(User user) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.save(user);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        }
    }
}
