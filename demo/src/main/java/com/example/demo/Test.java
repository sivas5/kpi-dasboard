package com.example.demo;

import java.io.IOException;
import java.text.ParseException;
//import java.util.Scanner;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;


@SpringBootApplication
public class Test extends SpringBootServletInitializer{
	
	@Override
	  protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
	    return application.sources(Test.class);
	  }
	
	public static void main(String[] args) throws IOException, InvalidFormatException, ParseException {
		SpringApplication.run(Test.class, args);
		
	}

}
