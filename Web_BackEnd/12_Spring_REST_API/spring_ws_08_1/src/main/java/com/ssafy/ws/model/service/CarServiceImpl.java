package com.ssafy.ws.model.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.ssafy.ws.model.dao.CarDao;
import com.ssafy.ws.model.dto.Car;

@Service
public class CarServiceImpl implements CarService {

	private static final Logger logger = LoggerFactory.getLogger(CarServiceImpl.class);

	/**
	 * has a 관계로 사용할 CarDao 타입의 dao를 선언한다.
	 */
	private CarDao dao;
	/**
	 * 파일 업로드 경로를 설정하기 위해 ResourceLoader를 주입받는다.
	 */
	@Autowired
	ResourceLoader resLoader;

	/**
	 * setter를 통해 CarDao를 주입받는다.
	 * 
	 * @Autowired를 통해 CarDao 타입의 빈을 주입 받는다.
	 * @param dao
	 */
	@Autowired
	public void setDao(CarDao dao) {
		this.dao = dao;
	}

	public CarDao getDao() {
		return dao;
	}

	@Override
	@Transactional
	public int insert(Car car, MultipartFile file) throws IllegalStateException, IOException {
		fileHandling(car, file);
		return dao.insert(car);
	}

	private void fileHandling(Car car, MultipartFile file) throws IOException {
		// 파일을 저장할 폴더 지정
		Resource res = resLoader.getResource("resources/upload");
		logger.debug("res: {}", res.getFile().getCanonicalPath());
		if (file != null && file.getSize() > 0) {
			// prefix를 포함한 전체 이름
			car.setImg(System.currentTimeMillis() + "_" + file.getOriginalFilename());
			car.setOrgImg(file.getOriginalFilename());

			// 변경된 파일 이름이 적용된 Car을 CarService를 통해 DB에 저장한다.

			file.transferTo(new File(res.getFile().getCanonicalPath() + "/" + car.getImg()));
		}
	}

	@Override
	public Car select(String vin) {
		return dao.select(vin);
	}

	@Override
	public List<Car> selectAll() {
		return dao.selectAll();
	}

}
