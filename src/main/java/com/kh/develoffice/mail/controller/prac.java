package com.kh.develoffice.mail.controller;

import java.io.IOException;
import java.util.Properties;
import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Store;
import javax.mail.internet.AddressException;


public class prac {

	public static void main(String[] args) {
		try {
			open();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
    public static void open() throws AddressException, MessagingException {

        String host = "pop.gmail.com";

        final String username = "sangyoon2ya"; // @naver.com 은 제외하고 아이디만.
        final String password = "12Rjwlfua!";
        int port=995;

        Properties props = System.getProperties();

        props.put("mail.pop3.host", host);
        props.put("mail.pop3.port", port);
        props.put("mail.pop3.auth", "true");
        props.put("mail.pop3.ssl.enable", "true");
        props.put("mail.pop3.ssl.trust", host);

        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {

            String un=username;
            String pw=password;

            protected javax.mail.PasswordAuthentication getPasswordAuthentication() {

                return new javax.mail.PasswordAuthentication(un, pw);
            }
        });

        session.setDebug(false);
        
        Store store = session.getStore("pop3");
        store.connect();

        Folder folder = store.getFolder("INBOX");
        folder.open(Folder.READ_ONLY);

        Message[] messages = folder.getMessages();

        if (messages.length == 0) System.out.println("No messages found.");

        for(Message message : messages) {

            System.out.println(":::::::::::::::::::::::::::::::::::");
            
            System.out.println("제목: " + message.getSubject());
            System.out.println("보낸시간: " + message.getSentDate());
//          System.out.println(message.getDataHandler());
            System.out.println("보낸사람 이메일: " + message.getFrom()[0].toString().split("=? <")[1].split(">")[0]);
            try {
				System.out.println("내용: " + message.getContent());
			} catch (IOException e) {
				e.printStackTrace();
			}
        }
        store.close();
    }

}