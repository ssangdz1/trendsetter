package com.example.trendsetter;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@SpringBootApplication
@EnableJpaAuditing //kich hoat tinh nang tu nhap ngay tao trong hoa don
public class TrendsetterApplication {

    public static void main(String[] args) {
        SpringApplication.run(TrendsetterApplication.class, args);
    }

}
