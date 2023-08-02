package com.maurya.Servlets;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;


public class databaseConnection 
{
	 Connection connection;
	    databaseConnection() throws ClassNotFoundException, SQLException
	    {
	    	Class.forName("com.mysql.cj.jdbc.Driver");
	        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306", "root", "password");
	        Statement statement = connection.createStatement();
	        statement.execute("create database if not exists jsp_and_servlets");
	        statement.execute("use jsp_and_servlets");
	        statement.execute("create table if not exists users(" +
	                "uname varchar(50) primary key, " +
	                "pword varchar(50) not null);");
	        statement.execute("create table if not exists posts("+
	        				"post_id int auto_increment primary key,"+
	        				"title varchar(200) not null,"+
	        				"post text not null,"+
	        				"user_id text not null);");
	        
	        statement.execute("create table if not exists comments("
	        		+ "comment text not null,"
	        		+ "comment_id int auto_increment primary key,"
	        		+ "user_id text not null,"
	        		+ "post_id int not null,"
	        		+ "time datetime default now() not null);");
	        statement.close();
	    }
	    public Connection getConnection()
	    {
	        return connection;
	    }
}
