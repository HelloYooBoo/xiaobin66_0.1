package cn.hyb.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import cn.hyb.pojo.XbArticlePicture;

public interface ImgService {
	List<XbArticlePicture> selAll();
	
	int delImg(int id);
	
	boolean uplord(MultipartFile file) throws IOException;
}
