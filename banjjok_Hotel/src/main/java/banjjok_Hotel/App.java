package banjjok_Hotel;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan("banjjok_Hotel") //자동으로 객체조립기 생성
@MapperScan(basePackages = "banjjok_Hotel.mapper")
public class App {

	public static void main(String[] args) {
		//실행시킬 클래스 이름 적음
		SpringApplication.run(App.class, args);
	}
}
