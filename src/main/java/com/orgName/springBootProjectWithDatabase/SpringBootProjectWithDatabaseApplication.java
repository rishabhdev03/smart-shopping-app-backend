package com.orgName.springBootProjectWithDatabase;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class SpringBootProjectWithDatabaseApplication {

	public static void main(String[] args) {
        SpringApplication.run(SpringBootProjectWithDatabaseApplication.class, args);
	}

}
