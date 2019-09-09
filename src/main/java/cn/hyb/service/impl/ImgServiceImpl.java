package cn.hyb.service.impl;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import cn.hyb.mapper.XbArticlePictureMapper;
import cn.hyb.pojo.XbArticlePicture;
import cn.hyb.pojo.XbArticlePictureExample;
import cn.hyb.service.ImgService;
import cn.hyb.utils.FtpUtil;
@Service
public class ImgServiceImpl implements ImgService{

	@Resource
	private XbArticlePictureMapper imgMapper;
	@Override
	public List<XbArticlePicture> selAll() {
		return imgMapper.selectByExample(new XbArticlePictureExample());
	}
	@Override
	public int delImg(int id) {
		//Criteria c = new ImgExample().createCriteria().andIdEqualTo(id);
		String key="bigimg";
		int index = imgMapper.deleteByPrimaryKey(id);
//		if(jedisDao.exists(key)) {
//			jedisDao.del(key);
//		}
		return index;
	}
	@Value("${ftpclient.host}")
	private String host;
	@Value("${ftpclient.port}")
	private int port;
	@Value("${ftpclient.username}")
	private String username;
	@Value("${ftpclient.password}")
	private String password;
	@Value("${ftpclient.basepath}")
	private String basePath;
	@Value("${ftpclient.filepath}")
	private String filePath;
	@Override
	public boolean uplord(MultipartFile file) throws IOException {
		String filename = UUID.randomUUID()+file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
		FtpUtil.uploadFile(host, port, username, password, basePath, filePath, filename, file.getInputStream());
		XbArticlePicture img=new XbArticlePicture();
		img.setUrl("http://192.168.222.130/"+filename);
		String key="bigimg";
		int index = imgMapper.insertSelective(img);
//		if(jedisDao.exists(key)) {
//			jedisDao.del(key);
//		}
		return index>0?true:false;
	}
	
}
